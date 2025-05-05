import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';

void main() {
  group('MeditationSession', () {
    test('should be created with default values except duration', () {
      final session = MeditationSession(duration: Duration(minutes: 10));

      expect(session.duration, Duration(minutes: 10));
      expect(session.currentTime, Duration.zero);
      expect(session.status, MeditationStatus.paused);
      expect(session.activeAmbientSounds, isEmpty);
    });

    test('should be created with custom values', () {
      final sounds = {
        'rain': AmbientSoundSettings(isActive: true, volume: 0.5),
      };

      final session = MeditationSession(
        duration: Duration(minutes: 20),
        currentTime: Duration(minutes: 5),
        status: MeditationStatus.running,
        activeAmbientSounds: sounds,
      );

      expect(session.duration, Duration(minutes: 20));
      expect(session.currentTime, Duration(minutes: 5));
      expect(session.status, MeditationStatus.running);
      expect(session.activeAmbientSounds, sounds);
    });

    test('should assert duration is positive', () {
      expect(
        () => MeditationSession(duration: Duration.zero),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => MeditationSession(duration: Duration(minutes: -1)),
        throwsA(isA<AssertionError>()),
      );
    });

    test('should assert currentTime is not greater than duration', () {
      expect(
        () => MeditationSession(
          duration: Duration(minutes: 5),
          currentTime: Duration(minutes: 6),
        ),
        throwsA(isA<AssertionError>()),
      );
    });

    group('status helpers', () {
      test('isRunning should return correct value', () {
        final running = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.running,
        );
        final paused = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.paused,
        );

        expect(running.isRunning, true);
        expect(paused.isRunning, false);
      });

      test('isPaused should return correct value', () {
        final paused = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.paused,
        );
        final running = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.running,
        );

        expect(paused.isPaused, true);
        expect(running.isPaused, false);
      });

      test('isCompleted should return correct value', () {
        final completed = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.completed,
        );
        final running = MeditationSession(
          duration: Duration(minutes: 10),
          status: MeditationStatus.running,
        );

        expect(completed.isCompleted, true);
        expect(running.isCompleted, false);
      });
    });

    test('remainingTime should be calculated correctly', () {
      final session = MeditationSession(
        duration: Duration(minutes: 10),
        currentTime: Duration(minutes: 3),
      );

      expect(session.remainingTime, Duration(minutes: 7));
    });

    test('progress should be calculated correctly', () {
      final session = MeditationSession(
        duration: Duration(minutes: 10),
        currentTime: Duration(minutes: 5),
      );

      expect(session.progress, 0.5);
    });

    test('copyWith should create new instance with updated values', () {
      final original = MeditationSession(
        duration: Duration(minutes: 10),
        currentTime: Duration(minutes: 2),
        status: MeditationStatus.running,
        activeAmbientSounds: {
          'rain': AmbientSoundSettings(isActive: true, volume: 0.5),
        },
      );

      final copy = original.copyWith(
        duration: Duration(minutes: 15),
        currentTime: Duration(minutes: 5),
        status: MeditationStatus.paused,
        activeAmbientSounds: {
          'rain': AmbientSoundSettings(isActive: false, volume: 0.7),
        },
      );

      expect(copy.duration, Duration(minutes: 15));
      expect(copy.currentTime, Duration(minutes: 5));
      expect(copy.status, MeditationStatus.paused);
      expect(copy.activeAmbientSounds['rain']?.isActive, false);
      expect(copy.activeAmbientSounds['rain']?.volume, 0.7);

      // Original should remain unchanged
      expect(original.duration, Duration(minutes: 10));
      expect(original.currentTime, Duration(minutes: 2));
      expect(original.status, MeditationStatus.running);
      expect(original.activeAmbientSounds['rain']?.isActive, true);
      expect(original.activeAmbientSounds['rain']?.volume, 0.5);
    });

    test('props should contain all fields', () {
      final sounds = {
        'rain': AmbientSoundSettings(),
      };
      final session = MeditationSession(
        duration: Duration(minutes: 10),
        currentTime: Duration(minutes: 5),
        status: MeditationStatus.running,
        activeAmbientSounds: sounds,
      );

      expect(session.props, [
        Duration(minutes: 10),
        Duration(minutes: 5),
        MeditationStatus.running,
        sounds,
      ]);
    });

    test('toString should contain all field values', () {
      final session = MeditationSession(
        duration: Duration(minutes: 10),
        currentTime: Duration(minutes: 5),
        status: MeditationStatus.running,
        activeAmbientSounds: {
          'rain': AmbientSoundSettings(isActive: true, volume: 0.5),
        },
      );

      expect(
        session.toString(),
        contains('duration: 0:10:00.000000'),
      );
      expect(
        session.toString(),
        contains('currentTime: 0:05:00.000000'),
      );
      expect(
        session.toString(),
        contains('status: MeditationStatus.running'),
      );
      expect(
        session.toString(),
        contains('activeAmbientSounds:'),
      );
    });
  });
}
