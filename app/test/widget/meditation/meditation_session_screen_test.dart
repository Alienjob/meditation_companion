import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

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
      home: BlocProvider<MeditationBloc>.value(
        value: bloc,
        child: const MeditationSessionScreen(),
      ),
    );
  }

  group('MeditationSessionScreen', () {
    testWidgets('renders initial state correctly', (tester) async {
      await tester.pumpWidget(createSubject());
      await tester.pump();

      expect(find.text('Meditation Session'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
      expect(find.text('Select Duration'), findsOneWidget);
      expect(find.text('5 min'), findsOneWidget);
      expect(find.text('10 min'), findsOneWidget);
      expect(find.text('15 min'), findsOneWidget);
      expect(find.text('20 min'), findsOneWidget);
    });

    testWidgets('starts meditation when duration selected', (tester) async {
      await tester.pumpWidget(createSubject());
      await tester.pump();

      await tester.tap(find.text('10 min'));
      await tester.pumpAndSettle();

      verify(() =>
              bloc.add(StartMeditation(duration: const Duration(minutes: 10))))
          .called(1);
    });

    testWidgets('shows controls when meditation is active', (tester) async {
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      bloc.emit(MeditationActive(session: session, soundSettings: const {}));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      expect(find.text('05:00'), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsOneWidget);
      expect(find.text('Ambient Sounds'), findsOneWidget);
    });

    testWidgets('shows ambient sound controls', (tester) async {
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );

      when(() => bloc.add(any())).thenReturn(null);

      bloc.emit(MeditationActive(
        session: session,
        soundSettings: {
          'rain': const AmbientSoundSettings(isActive: true, volume: 0.5),
          'forest': const AmbientSoundSettings(),
        },
      ));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      expect(find.text('Rain'), findsOneWidget);
      expect(find.text('Forest'), findsOneWidget);

      final switches = find.byType(Switch);
      expect(switches, findsNWidgets(2));

      // Test sound toggle
      await tester.tap(switches.first);
      await tester.pumpAndSettle();

      verify(() => bloc.add(const ToggleSound(soundId: 'rain', active: false)))
          .called(1);
      verifyNever(() => bloc.add(any<AdjustVolume>()));
    });

    testWidgets('shows play button when meditation is paused', (tester) async {
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.paused,
      );

      bloc.emit(MeditationActive(session: session, soundSettings: const {}));

      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      expect(find.text('05:00'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsOneWidget);
    });

    testWidgets('shows completed state', (tester) async {
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 10),
        status: MeditationStatus.completed,
      );

      await tester.pumpWidget(createSubject());
      bloc.emit(MeditationCompleted(session: session));
      await tester.pumpAndSettle();

      expect(find.text('Meditation session completed!'), findsOneWidget);
      expect(find.text('Start New Session'), findsOneWidget);
    });
  });
}
