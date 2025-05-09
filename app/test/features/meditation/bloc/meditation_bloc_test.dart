import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/analytics/models/analytics_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';

class MockTimerService extends Mock implements TimerService {}

class MockAudioService extends Mock implements AudioService {}

class MockAnalyticsService extends Mock implements AnalyticsService {}

class FakeStreamSubscription<T> extends Fake implements StreamSubscription<T> {}

class FakeAnalyticsEvent extends Fake implements AnalyticsEvent {}

void main() {
  const testId = 'test-session-id';
  late TimerService timerService;
  late AudioService audioService;
  late AnalyticsService analyticsService;
  late StreamController<Duration> timerController;
  late StreamController<Map<String, AmbientSoundSettings>> audioController;

  void setupMocks() {
    timerController = StreamController<Duration>.broadcast();
    audioController =
        StreamController<Map<String, AmbientSoundSettings>>.broadcast();

    when(() => timerService.timeStream)
        .thenAnswer((_) => timerController.stream);
    when(() => audioService.soundSettingsStream)
        .thenAnswer((_) => audioController.stream);
    when(() => audioService.getCurrentSoundSettings()).thenReturn({});
    when(() => timerService.start(any())).thenAnswer((_) async {});
    when(() => timerService.pause()).thenAnswer((_) async {});
    when(() => timerService.resume()).thenAnswer((_) async {});
    when(() => timerService.stop()).thenAnswer((_) async {});
    when(() => audioService.stopAllSounds()).thenAnswer((_) async {});
  }

  setUpAll(() {
    registerFallbackValue(const Duration(minutes: 10));
    registerFallbackValue(FakeStreamSubscription<Duration>());
    registerFallbackValue(
        FakeStreamSubscription<Map<String, AmbientSoundSettings>>());
    registerFallbackValue(FakeAnalyticsEvent());
  });

  setUp(() {
    timerService = MockTimerService();
    audioService = MockAudioService();
    analyticsService = MockAnalyticsService();
    when(() => analyticsService.trackEvent(any())).thenAnswer((_) async {});
    setupMocks();
  });

  tearDown(() async {
    await timerController.close();
    await audioController.close();
  });

  group('MeditationBloc', () {
    test('initial state is MeditationInitial', () {
      final bloc = createBloc(timerService, audioService, analyticsService);
      expect(bloc.state, isA<MeditationInitial>());
      bloc.close();
    });

    blocTest<MeditationBloc, MeditationState>(
      'StartMeditation starts timer and emits active state',
      build: () => createBloc(timerService, audioService, analyticsService),
      act: (bloc) =>
          bloc.add(StartMeditation(duration: const Duration(minutes: 10))),
      expect: () => [
        isA<MeditationActive>()
            .having((state) => state.session.duration, 'duration',
                const Duration(minutes: 10))
            .having((state) => state.session.currentTime, 'currentTime',
                Duration.zero)
            .having((state) => state.session.status, 'status',
                MeditationStatus.running),
      ],
      verify: (_) {
        verify(() => timerService.start(const Duration(minutes: 10))).called(1);
        verify(() => analyticsService.trackEvent(any())).called(1);
      },
    );

    blocTest<MeditationBloc, MeditationState>(
      'StopMeditation stops timer and sounds',
      build: () => createBloc(timerService, audioService, analyticsService),
      seed: () => MeditationActive(
        session: MeditationSession(
          id: testId,
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: 5),
          status: MeditationStatus.running,
        ),
        soundSettings: const {},
      ),
      act: (bloc) => bloc.add(const StopMeditation()),
      expect: () => [isA<MeditationInitial>()],
      verify: (_) {
        verifyInOrder([
          () => timerService.stop(),
          () => audioService.stopAllSounds(),
        ]);
        verify(() => analyticsService.trackEvent(any())).called(1);
      },
    );

    blocTest<MeditationBloc, MeditationState>(
      'completes meditation when time is up',
      build: () => createBloc(timerService, audioService, analyticsService),
      seed: () => MeditationActive(
        session: MeditationSession(
          id: testId,
          duration: const Duration(minutes: 10),
          currentTime: const Duration(minutes: 9),
          status: MeditationStatus.running,
        ),
        soundSettings: const {},
      ),
      act: (bloc) => bloc.add(UpdateTime(const Duration(minutes: 10))),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        isA<MeditationCompleted>().having(
          (state) => state.session,
          'session',
          isA<MeditationSession>()
              .having((s) => s.status, 'status', MeditationStatus.completed)
              .having(
                  (s) => s.duration, 'duration', const Duration(minutes: 10))
              .having((s) => s.currentTime, 'currentTime',
                  const Duration(minutes: 10)),
        ),
      ],
      verify: (_) {
        verifyInOrder([
          () => audioService.stopAllSounds(),
          () => timerService.stop(),
        ]);
        verify(() => analyticsService.trackEvent(any())).called(1);
      },
    );
  });
}

MeditationBloc createBloc(
  TimerService timerService,
  AudioService audioService,
  AnalyticsService analyticsService,
) {
  return MeditationBloc(
    timerService: timerService,
    audioService: audioService,
    analyticsService: analyticsService,
    sessionId: 'test application session id',
  );
}
