import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';

class MockTimerService extends Mock implements TimerService {}

class MockAudioService extends Mock implements AudioService {}

void main() {
  setUpAll(() {
    registerFallbackValue(const Duration(minutes: 1));
    registerFallbackValue('dummy_sound');
    registerFallbackValue(true);
    registerFallbackValue(0.5);
  });

  group('MeditationBloc', () {
    late MockTimerService timerService;
    late MockAudioService audioService;
    late MeditationBloc bloc;
    late StreamController<Duration> timerController;
    late StreamController<Map<String, AmbientSoundSettings>> audioController;

    setUp(() {
      timerService = MockTimerService();
      audioService = MockAudioService();
      timerController = StreamController<Duration>.broadcast();
      audioController =
          StreamController<Map<String, AmbientSoundSettings>>.broadcast();

      // Setup timer service mock
      when(() => timerService.timeStream)
          .thenAnswer((_) => timerController.stream);
      when(() => timerService.start(any())).thenAnswer((_) => Future.value());
      when(() => timerService.pause()).thenAnswer((_) => Future.value());
      when(() => timerService.resume()).thenAnswer((_) => Future.value());
      when(() => timerService.stop()).thenAnswer((_) => Future.value());
      when(() => timerService.dispose()).thenAnswer((_) => Future.value());
      when(() => timerService.currentTime).thenReturn(Duration.zero);
      when(() => timerService.isRunning).thenReturn(false);
      when(() => timerService.getTimeLeft()).thenReturn(Duration.zero);

      // Setup audio service mock
      when(() => audioService.soundSettingsStream)
          .thenAnswer((_) => audioController.stream);
      when(() => audioService.getCurrentSoundSettings()).thenReturn({});
      when(() => audioService.toggleSound(any(), any()))
          .thenAnswer((_) => Future.value());
      when(() => audioService.setVolume(any(), any()))
          .thenAnswer((_) => Future.value());
      when(() => audioService.stopAllSounds())
          .thenAnswer((_) => Future.value());
      when(() => audioService.dispose()).thenAnswer((_) => Future.value());

      bloc = MeditationBloc(
        timerService: timerService,
        audioService: audioService,
      );
    });

    tearDown(() async {
      await timerController.close();
      await audioController.close();
      await bloc.close();
    });

    test('initial state is MeditationInitial', () {
      expect(bloc.state, isA<MeditationInitial>());
    });

    group('StartMeditation', () {
      test('emits MeditationActive with correct session', () async {
        // Arrange
        final duration = Duration(minutes: 10);
        when(() => timerService.isRunning).thenReturn(true);

        // Act & Assert
        expectLater(
          bloc.stream,
          emits(
            isA<MeditationActive>()
                .having((s) => s.session.duration, 'duration', duration)
                .having((s) => s.session.status, 'status',
                    MeditationStatus.running),
          ),
        );

        bloc.add(StartMeditation(duration: duration));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => timerService.start(duration)).called(1);
      });

      test('handles timer service failure', () async {
        // Arrange
        when(() => timerService.start(any()))
            .thenThrow(Exception('Timer service failed'));

        // Act & Assert
        expectLater(
          bloc.stream,
          emits(isA<MeditationError>()),
        );

        bloc.add(StartMeditation(duration: Duration(minutes: 10)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
    });

    group('PauseMeditation', () {
      setUp(() async {
        bloc.add(StartMeditation(duration: Duration(minutes: 10)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });

      test('emits paused state', () async {
        // Act & Assert
        expectLater(
          bloc.stream,
          emits(
            isA<MeditationActive>().having(
                (s) => s.session.status, 'status', MeditationStatus.paused),
          ),
        );

        bloc.add(PauseMeditation());
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => timerService.pause()).called(1);
      });
    });

    group('ResumeMeditation', () {
      setUp(() async {
        bloc.add(StartMeditation(duration: Duration(minutes: 10)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
        bloc.add(PauseMeditation());
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });

      test('emits running state', () async {
        // Arrange
        when(() => timerService.isRunning).thenReturn(true);

        // Act & Assert
        expectLater(
          bloc.stream,
          emits(
            isA<MeditationActive>().having(
                (s) => s.session.status, 'status', MeditationStatus.running),
          ),
        );

        bloc.add(ResumeMeditation());
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => timerService.resume()).called(1);
      });
    });

    group('StopMeditation', () {
      setUp(() async {
        bloc.add(StartMeditation(duration: Duration(minutes: 10)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });

      test('emits completed state and stops services', () async {
        // Act & Assert
        expectLater(
          bloc.stream,
          emits(isA<MeditationCompleted>()),
        );

        bloc.add(StopMeditation());
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => timerService.stop()).called(1);
        verify(() => audioService.stopAllSounds()).called(1);
      });
    });

    group('Sound management', () {
      setUp(() async {
        bloc.add(StartMeditation(duration: Duration(minutes: 10)));
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });

      test('toggles sound', () async {
        // Act & Assert
        bloc.add(ToggleSound(soundId: 'rain', active: true));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => audioService.toggleSound('rain', true)).called(1);
      });

      test('adjusts volume', () async {
        // Act & Assert
        bloc.add(AdjustVolume(soundId: 'rain', volume: 0.5));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        verify(() => audioService.setVolume('rain', 0.5)).called(1);
      });

      test('updates state on sound settings change', () async {
        // Arrange
        final newSettings = {
          'rain': AmbientSoundSettings(isActive: true, volume: 0.5),
        };

        // Act & Assert
        expectLater(
          bloc.stream,
          emits(
            isA<MeditationActive>()
                .having((s) => s.soundSettings, 'soundSettings', newSettings),
          ),
        );

        audioController.add(newSettings);
        await Future<void>.delayed(const Duration(milliseconds: 50));
      });
    });

    test('completes meditation when time is up', () async {
      // Arrange
      bloc.add(StartMeditation(duration: Duration(minutes: 10)));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      // Act & Assert
      expectLater(
        bloc.stream,
        emits(isA<MeditationCompleted>()),
      );

      timerController.add(Duration(minutes: 10)); // Time's up
      await Future<void>.delayed(const Duration(milliseconds: 50));

      verify(() => timerService.stop()).called(1);
      verify(() => audioService.stopAllSounds()).called(1);
    });
  });
}
