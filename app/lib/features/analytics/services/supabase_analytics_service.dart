import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/analytics_event.dart';
import '../models/event_queue.dart';
import 'analytics_service.dart';

/// Implements analytics service that sends events to Supabase
class SupabaseAnalyticsService implements AnalyticsService {
  final SupabaseClient _supabase;
  final SharedPreferences _prefs;
  final _uuid = const Uuid();
  String? _anonymousUserId;
  String? sessionId;

  static const _queueKey = 'analytics_event_queue';
  static const _anonymousUserKey = 'anonymous_user_id';
  static const _maxBatchSize = 50;

  late EventQueue _queue;
  Timer? _uploadTimer;
  bool _isUploading = false;

  SupabaseAnalyticsService({
    required SupabaseClient supabase,
    required SharedPreferences prefs,
    Duration? uploadInterval,
  })  : _supabase = supabase,
        _prefs = prefs {
    _initializeQueue();
    // Load existing anonymous user ID if any
    _anonymousUserId = _prefs.getString(_anonymousUserKey);
    if (uploadInterval != null) {
      _startUploadTimer(uploadInterval);
    }
  }

  void _initializeQueue() {
    final queueJson = _prefs.getString(_queueKey);
    if (queueJson != null) {
      try {
        _queue = EventQueue.fromJson(queueJson);
      } catch (e) {
        _queue = EventQueue();
      }
    } else {
      _queue = EventQueue();
    }
  }

  void _startUploadTimer(Duration interval) {
    _uploadTimer?.cancel();
    _uploadTimer = Timer.periodic(interval, (_) {
      uploadPendingEvents();
    });
  }

  Future<void> _persistQueue() async {
    await _prefs.setString(_queueKey, _queue.toJson());
  }

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    _queue.enqueue(event);
    await _persistQueue();
    await uploadPendingEvents();
  }

  @override
  Future<void> trackEvents(List<AnalyticsEvent> events) async {
    for (final event in events) {
      _queue.enqueue(event);
    }
    await _persistQueue();
    await uploadPendingEvents();
  }

  @override
  Future<String> startSession({
    required String userId,
    required String deviceInfo,
    required String appVersion,
  }) async {
    final sessionId = _uuid.v4();

    // Handle anonymous users with consistent ID
    String actualUserId;
    if (userId == 'anonymous') {
      _anonymousUserId ??= _prefs.getString(_anonymousUserKey) ?? _uuid.v4();
      await _prefs.setString(_anonymousUserKey, _anonymousUserId!);
      actualUserId = _anonymousUserId!;
    } else {
      actualUserId = userId;
      // Clear any stored anonymous ID when real user logs in
      await _prefs.remove(_anonymousUserKey);
      _anonymousUserId = null;
    }

    await _supabase.from('app_sessions').insert({
      'id': sessionId,
      'user_id': actualUserId,
      'start_time': DateTime.now().toIso8601String(),
      'device_info': deviceInfo,
      'app_version': appVersion,
    });

    return sessionId;
  }

  @override
  Future<void> endSession(String sessionId) async {
    await _supabase.from('app_sessions').update({
      'end_time': DateTime.now().toIso8601String(),
    }).eq('id', sessionId);

    // Ensure all remaining events are uploaded
    await uploadPendingEvents();
  }

  @override
  Future<void> uploadPendingEvents() async {
    if (_isUploading || _queue.isEmpty) return;

    _isUploading = true;
    try {
      final batch = _queue.getNextBatch(_maxBatchSize);
      if (batch.isEmpty) return;

      // Convert events to parameter rows
      final parameterRows = batch.expand((queuedEvent) {
        final event = queuedEvent.event;
        return event.parameters.entries
            .map((param) => {
                  'event_id': event.id,
                  'param_name': param.key,
                  'param_value': param.value,
                })
            .toList();
      }).toList();

      // Insert events
      // Map events with proper user ID handling
      final events = batch.map((queuedEvent) {
        final event = queuedEvent.event;
        String userId = event.userId;

        // Handle anonymous users consistently
        if (userId == 'anonymous') {
          _anonymousUserId ??=
              _prefs.getString(_anonymousUserKey) ?? _uuid.v4();
          _prefs.setString(_anonymousUserKey, _anonymousUserId!);
          userId = _anonymousUserId!;
        }

        return {
          'id': event.id,
          'session_id': sessionId,
          'user_id': userId,
          'timestamp': event.timestamp.toIso8601String(),
          'event_type': event.eventType,
        };
      }).toList();

      await _supabase.from('events').insert(events);

      // Insert parameters
      await _supabase.from('event_parameters').insert(parameterRows);

      // Remove successfully uploaded events
      _queue.removeEvents(batch);
    } catch (e) {
      print('Error uploading events: $e');
      // Mark the current batch as failed and increment retry count
      final currentBatch = _queue.getNextBatch(_maxBatchSize);
      _queue.markAsFailed(currentBatch);
      rethrow;
    } finally {
      await _persistQueue();
      _isUploading = false;
    }
  }

  @override
  Future<void> clearAnalytics() async {
    _queue = EventQueue();
    await _prefs.remove(_queueKey);
  }

  @override
  Future<bool> isReady() async {
    try {
      await _supabase.from('events').select().limit(1);
      return true;
    } catch (e) {
      return false;
    }
  }

  void dispose() {
    _uploadTimer?.cancel();
  }
}
