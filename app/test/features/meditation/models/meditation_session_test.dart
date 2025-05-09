import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';

void main() {
  const testId = 'test-session-id';
  group('MeditationSession', () {
    test('creates initial session', () {
      final session = MeditationSession.initial(
        duration: const Duration(minutes: 10),
      );
      expect(session.duration, const Duration(minutes: 10));
      expect(session.currentTime, Duration.zero);
      expect(session.status, MeditationStatus.running);
    });

    test('validates positive duration', () {
      expect(
        () => MeditationSession(
          id: testId,
          duration: Duration.zero,
          currentTime: Duration.zero,
          status: MeditationStatus.running,
        ),
        throwsAssertionError,
      );

      expect(
        () => MeditationSession(
          id: testId,
          duration: const Duration(minutes: -1),
          currentTime: Duration.zero,
          status: MeditationStatus.running,
        ),
        throwsAssertionError,
      );
    });

    test('validates current time range', () {
      expect(
        () => MeditationSession(
          id: testId,
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: -1),
          status: MeditationStatus.running,
        ),
        throwsAssertionError,
      );

      expect(
        () => MeditationSession(
          id: testId,
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: 11),
          status: MeditationStatus.running,
        ),
        throwsAssertionError,
      );
    });

    group('status checks', () {
      test('isRunning returns correct value', () {
        final running = MeditationSession.initial(
          duration: const Duration(minutes: 10),
        );
        final paused = MeditationSession.paused(
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: 5),
        );

        expect(running.isRunning, true);
        expect(paused.isRunning, false);
      });

      test('isPaused returns correct value', () {
        final paused = MeditationSession.paused(
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: 5),
        );
        final running = MeditationSession.initial(
          duration: const Duration(minutes: 10),
        );

        expect(paused.isPaused, true);
        expect(running.isPaused, false);
      });

      test('isCompleted returns correct value', () {
        final completed = MeditationSession.completed(
          duration: const Duration(minutes: 10),
        );
        final running = MeditationSession.initial(
          duration: const Duration(minutes: 10),
        );

        expect(completed.isCompleted, true);
        expect(running.isCompleted, false);
      });
    });

    test('calculates remaining time correctly', () {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 3),
        status: MeditationStatus.running,
      );
      expect(session.remainingTime, const Duration(minutes: 7));
    });

    test('calculates progress correctly', () {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );
      expect(session.progress, 0.5);
    });

    test('copyWith creates new instance with updated values', () {
      final original = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      final copy = original.copyWith(
        status: MeditationStatus.paused,
      );

      expect(copy.duration, original.duration);
      expect(copy.currentTime, original.currentTime);
      expect(copy.status, MeditationStatus.paused);
      expect(copy, isNot(same(original)));
    });

    test('equality comparison works correctly', () {
      final session1 = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      final session2 = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      final session3 = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 6),
        status: MeditationStatus.running,
      );

      expect(session1, equals(session2));
      expect(session1, isNot(equals(session3)));
    });
  });
}
