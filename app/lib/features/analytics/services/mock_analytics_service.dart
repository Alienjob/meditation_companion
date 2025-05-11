import 'dart:async';
import 'dart:math';

import 'package:uuid/uuid.dart';

import '../models/analytics_event.dart';
import 'analytics_service.dart';

/// Mock implementation of AnalyticsService for testing and development
class MockAnalyticsService implements AnalyticsService {
  final _events = <AnalyticsEvent>[];

  final _uuid = const Uuid();
  final _random = Random();

  bool _isInitialized = false;
  Timer? _uploadTimer;
  String? sessionId;

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
    _events.add(event);
  }

  @override
  Future<void> trackEvents(List<AnalyticsEvent> events) async {
    await _simulateNetworkCall();
    if (!_isInitialized) throw StateError('Analytics service not initialized');
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

    sessionId = _uuid.v4();

    // Start periodic upload simulation
    _uploadTimer?.cancel();
    _uploadTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => uploadPendingEvents(),
    );

    return sessionId!;
  }

  @override
  Future<void> endSession(String sessionId) async {
    await _simulateNetworkCall();

    await uploadPendingEvents();
    _uploadTimer?.cancel();
  }

  @override
  Future<void> uploadPendingEvents() async {
    await _simulateNetworkCall();
  }

  @override
  Future<void> clearAnalytics() async {
    await _simulateNetworkCall();
    _events.clear();
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
