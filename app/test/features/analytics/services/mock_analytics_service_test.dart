import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/analytics/models/analytics_event.dart';
import 'package:meditation_companion/features/analytics/services/mock_analytics_service.dart';

void main() {
  late MockAnalyticsService service;

  setUp(() {
    service = MockAnalyticsService(
      minLatency: Duration.zero,
      maxLatency: const Duration(milliseconds: 10),
      failureRate: 0.0,
    );
  });

  test('service requires initialization before tracking events', () async {
    final event = UIEvent.screenView(
      id: '1',
      userId: 'user1',
      screenName: 'home',
    );

    expect(
      () => service.trackEvent(event),
      throwsStateError,
    );
  });

  group('session management', () {
    test('can start a new session', () async {
      final sessionId = await service.startSession(
        userId: 'user1',
        deviceInfo: 'test device',
        appVersion: '1.0.0',
      );

      expect(sessionId, isNotEmpty);
      expect(await service.isReady(), isTrue);
    });

    test('can end an existing session', () async {
      final sessionId = await service.startSession(
        userId: 'user1',
        deviceInfo: 'test device',
        appVersion: '1.0.0',
      );

      await service.endSession(sessionId);
    });
  });

  group('event tracking', () {
    late String sessionId;

    setUp(() async {
      sessionId = await service.startSession(
        userId: 'user1',
        deviceInfo: 'test device',
        appVersion: '1.0.0',
      );
    });

    test('can track single event', () async {
      final event = MeditationEvent.started(
        id: '1',
        userId: 'user1',
        meditationId: 'med1',
        plannedDuration: const Duration(minutes: 10),
      );

      await service.trackEvent(event);

      expect(service.events, contains(event));
    });

    test('can track multiple events', () async {
      final events = [
        MeditationEvent.started(
          id: '1',
          userId: 'user1',
          meditationId: 'med1',
          plannedDuration: const Duration(minutes: 10),
        ),
        AudioEvent.volumeChanged(
          id: '2',
          userId: 'user1',
          soundId: 'rain',
          volume: 0.5,
          meditationId: 'med1',
        ),
      ];

      await service.trackEvents(events);

      expect(service.events, containsAll(events));
    });
  });

  test('can clear analytics data', () async {
    await service.startSession(
      userId: 'user1',
      deviceInfo: 'test device',
      appVersion: '1.0.0',
    );

    await service.trackEvent(
      MeditationEvent.started(
        id: '1',
        userId: 'user1',
        meditationId: 'med1',
        plannedDuration: const Duration(minutes: 10),
      ),
    );

    await service.clearAnalytics();

    expect(service.events, isEmpty);
    expect(await service.isReady(), isFalse);
  });

  group('network simulation', () {
    test('respects minimum latency', () async {
      final service = MockAnalyticsService(
        minLatency: const Duration(milliseconds: 50),
        maxLatency: const Duration(milliseconds: 100),
        failureRate: 0.0,
      );

      final stopwatch = Stopwatch()..start();

      await service.startSession(
        userId: 'user1',
        deviceInfo: 'test device',
        appVersion: '1.0.0',
      );

      stopwatch.stop();

      expect(stopwatch.elapsedMilliseconds, greaterThanOrEqualTo(50));
    });

    test('simulates network failures', () async {
      final service = MockAnalyticsService(
        minLatency: Duration.zero,
        maxLatency: const Duration(milliseconds: 10),
        failureRate: 1.0, // Always fail
      );

      expect(
        () => service.startSession(
          userId: 'user1',
          deviceInfo: 'test device',
          appVersion: '1.0.0',
        ),
        throwsException,
      );
    });
  });
}
