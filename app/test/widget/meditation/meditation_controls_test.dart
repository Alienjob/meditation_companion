import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

// Import our mock implementations
import 'mocks/mock_audio_service_wrapper.dart';
import 'mocks/mock_chat_bottom_sheet_widget.dart';

class MockMeditationBloc extends Mock implements MeditationBloc {
  final _controller = StreamController<MeditationState>.broadcast();
  MeditationState _state = MeditationInitial();

  @override
  Stream<MeditationState> get stream => _controller.stream;

  @override
  MeditationState get state => _state;

  void emit(MeditationState state) {
    _state = state;
    if (!_controller.isClosed) {
      _controller.add(state);
    }
  }

  @override
  Future<void> close() async {
    await _controller.close();
    return Future.value();
  }
}

void main() {
  const testId = 'test-session-id';
  late MockMeditationBloc bloc;

  setUpAll(() {
    registerFallbackValue(const AdjustVolume(soundId: 'rain', volume: 0.5));
  });

  setUp(() {
    bloc = MockMeditationBloc();
  });

  tearDown(() {
    bloc.close();
  });

  Widget createSubject() {
    return MaterialApp(
      home: Provider<AudioService>(
        create: (_) => MockAudioServiceForTests(),
        child: BlocProvider<MeditationBloc>.value(
          value: bloc,
          child: const MeditationSessionScreen(),
        ),
      ),
    );
  }

  group('MeditationSessionScreen meditation controls', () {
    testWidgets('pause button pauses meditation', (tester) async {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      when(() => bloc.add(any())).thenReturn(null);
      bloc.emit(MeditationActive(session: session, soundSettings: const {}));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Find and tap the pause button
      await tester.tap(find.byIcon(Icons.pause_circle_filled));
      await tester.pumpAndSettle();

      // Verify the correct event was added to the bloc
      verify(() => bloc.add(const PauseMeditation())).called(1);
    });

    testWidgets('play button resumes meditation', (tester) async {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.paused,
      );

      when(() => bloc.add(any())).thenReturn(null);
      bloc.emit(MeditationActive(session: session, soundSettings: const {}));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Find and tap the play button
      await tester.tap(find.byIcon(Icons.play_circle_filled));
      await tester.pumpAndSettle();

      // Verify the correct event was added to the bloc
      verify(() => bloc.add(const ResumeMeditation())).called(1);
    });

    testWidgets('stop button stops meditation', (tester) async {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      when(() => bloc.add(any())).thenReturn(null);
      bloc.emit(MeditationActive(session: session, soundSettings: const {}));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Find and tap the stop button
      await tester.tap(find.byIcon(Icons.stop_circle));
      await tester.pumpAndSettle();

      // Verify the correct event was added to the bloc
      verify(() => bloc.add(const StopMeditation())).called(1);
    });

    testWidgets('start new session button resets meditation', (tester) async {
      final session = MeditationSession(
        id: testId,
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 10),
        status: MeditationStatus.completed,
      );

      when(() => bloc.add(any())).thenReturn(null);
      bloc.emit(MeditationCompleted(session: session));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Find and verify completed UI elements
      expect(find.text('Meditation session completed!'), findsOneWidget);
      expect(find.byIcon(Icons.check_circle), findsOneWidget);

      // Find and tap the start new session button
      await tester.tap(find.text('Start New Session'));
      await tester.pumpAndSettle();

      // Verify the correct event was added to the bloc
      verify(() => bloc.add(const StopMeditation())).called(1);
    });
  });
}
