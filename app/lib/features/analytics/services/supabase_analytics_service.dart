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

  static const _queueKey = 'analytics_event_queue';
  static const _maxBatchSize = 50;
  static const _uploadInterval = Duration(seconds: 30);

  late EventQueue _queue;
  Timer? _uploadTimer;
  bool _isUploading = false;

  SupabaseAnalyticsService({
    required SupabaseClient supabase,
    required SharedPreferences prefs,
  })  : _supabase = supabase,
        _prefs = prefs {
    _initializeQueue();
    _startUploadTimer();
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

  void _startUploadTimer() {
    _uploadTimer?.cancel();
    _uploadTimer = Timer.periodic(_uploadInterval, (_) {
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

    await _supabase.from('app_sessions').insert({
      'id': sessionId,
      'user_id': userId,
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
        return event.parameters.entries.map((param) => {
              'event_id': event.id,
              'param_name': param.key,
              'param_value': param.value,
            });
      }).toList();

      // Insert events
      await _supabase.from('events').insert(
            batch.map((queuedEvent) => {
                  'id': queuedEvent.event.id,
                  'session_id': queuedEvent.event.sessionId,
                  'user_id': queuedEvent.event.userId,
                  'timestamp': queuedEvent.event.timestamp.toIso8601String(),
                  'event_type': queuedEvent.event.eventType,
                }),
          );

      // Insert parameters
      await _supabase.from('event_parameters').insert(parameterRows);

      // Remove successfully uploaded events
      _queue.removeEvents(batch);
      await _persistQueue();
    } catch (e) {
      // Mark batch as failed and increment retry count
      final batch = _queue.getNextBatch(_maxBatchSize);
      _queue.markAsFailed(batch);
      await _persistQueue();
      rethrow;
    } finally {
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
