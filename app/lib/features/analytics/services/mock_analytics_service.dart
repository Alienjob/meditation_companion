import 'dart:async';
import 'dart:math';

import 'package:uuid/uuid.dart';

import '../models/analytics_event.dart';
import 'analytics_service.dart';

/// Mock implementation of AnalyticsService for testing and development
class MockAnalyticsService implements AnalyticsService {
  final _events = <AnalyticsEvent>[];
  final _sessions = <String, _MockSession>{};
  final _uuid = const Uuid();
  final _random = Random();

  bool _isInitialized = false;
  Timer? _uploadTimer;

  // Simulate network conditions
  final Duration _minLatency;
  final Duration _maxLatency;
  final double _failureRate;

  MockAnalyticsService({
    Duration minLatency = const Duration(milliseconds: 100),
    Duration maxLatency = const Duration(milliseconds: 500),
    double failureRate = 0.1,
  })  : _minLatency = minLatency,
        _maxLatency = maxLatency,
        _failureRate = failureRate.clamp(0.0, 1.0);

  @override
  Future<void> trackEvent(AnalyticsEvent event) async {
    await _simulateNetworkCall();
    if (!_isInitialized) throw StateError('Analytics service not initialized');
    if (!_sessions.containsKey(event.sessionId)) {
      throw StateError('Invalid session ID: ${event.sessionId}');
    }
    _events.add(event);
  }

  @override
  Future<void> trackEvents(List<AnalyticsEvent> events) async {
    await _simulateNetworkCall();
    if (!_isInitialized) throw StateError('Analytics service not initialized');
    for (final event in events) {
      if (!_sessions.containsKey(event.sessionId)) {
        throw StateError('Invalid session ID: ${event.sessionId}');
      }
    }
    _events.addAll(events);
  }

  @override
  Future<String> startSession({
    required String userId,
    required String deviceInfo,
    required String appVersion,
  }) async {
    await _simulateNetworkCall();
    _isInitialized = true;

    final sessionId = _uuid.v4();
    _sessions[sessionId] = _MockSession(
      id: sessionId,
      userId: userId,
      deviceInfo: deviceInfo,
      appVersion: appVersion,
      startTime: DateTime.now(),
    );

    // Start periodic upload simulation
    _uploadTimer?.cancel();
    _uploadTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => uploadPendingEvents(),
    );

    return sessionId;
  }

  @override
  Future<void> endSession(String sessionId) async {
    await _simulateNetworkCall();
    if (!_sessions.containsKey(sessionId)) {
      throw StateError('Invalid session ID: $sessionId');
    }

    final session = _sessions[sessionId]!;
    _sessions[sessionId] = session.copyWith(endTime: DateTime.now());

    // Upload any remaining events
    await uploadPendingEvents();
    _uploadTimer?.cancel();
  }

  @override
  Future<void> uploadPendingEvents() async {
    await _simulateNetworkCall();
    // In mock implementation, events are already "uploaded" when tracked
  }

  @override
  Future<void> clearAnalytics() async {
    await _simulateNetworkCall();
    _events.clear();
    _sessions.clear();
    _isInitialized = false;
    _uploadTimer?.cancel();
  }

  @override
  Future<bool> isReady() async {
    await _simulateNetworkCall();
    return _isInitialized;
  }

  // Helper methods for testing

  /// Get all tracked events
  List<AnalyticsEvent> get events => List.unmodifiable(_events);

  /// Get all sessions
  Map<String, DateTime> get sessions => Map.unmodifiable(
        _sessions.map((key, value) => MapEntry(key, value.startTime)),
      );

  /// Get events for a specific session
  List<AnalyticsEvent> getSessionEvents(String sessionId) {
    return List.unmodifiable(
      _events.where((e) => e.sessionId == sessionId),
    );
  }

  /// Simulate network latency and potential failures
  Future<void> _simulateNetworkCall() async {
    if (_random.nextDouble() < _failureRate) {
      throw Exception('Simulated network failure');
    }

    final latencyRange =
        _maxLatency.inMilliseconds - _minLatency.inMilliseconds;
    final randomLatency =
        _minLatency.inMilliseconds + _random.nextInt(latencyRange + 1);

    await Future.delayed(Duration(milliseconds: randomLatency));
  }
}

/// Internal class to track session information
class _MockSession {
  final String id;
  final String userId;
  final String deviceInfo;
  final String appVersion;
  final DateTime startTime;
  final DateTime? endTime;

  const _MockSession({
    required this.id,
    required this.userId,
    required this.deviceInfo,
    required this.appVersion,
    required this.startTime,
    this.endTime,
  });

  _MockSession copyWith({
    DateTime? endTime,
  }) {
    return _MockSession(
      id: id,
      userId: userId,
      deviceInfo: deviceInfo,
      appVersion: appVersion,
      startTime: startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
