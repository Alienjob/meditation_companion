import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

class MockMeditationBloc extends Mock implements MeditationBloc {}

void main() {
  late MockMeditationBloc bloc;

  setUp(() {
    bloc = MockMeditationBloc();
    when(() => bloc.state).thenReturn(MeditationInitial());
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

      expect(find.text('Meditation Session'), findsOneWidget);
      expect(find.text('00:00'), findsOneWidget);
      expect(find.text('Select Duration'), findsOneWidget);

      // Should show duration buttons
      expect(find.text('5 min'), findsOneWidget);
      expect(find.text('10 min'), findsOneWidget);
      expect(find.text('15 min'), findsOneWidget);
      expect(find.text('20 min'), findsOneWidget);

      // Should not show controls or sounds initially
      expect(find.byIcon(Icons.play_arrow), findsNothing);
      expect(find.byIcon(Icons.pause), findsNothing);
      expect(find.byIcon(Icons.stop), findsNothing);
      expect(find.text('Ambient Sounds'), findsNothing);
    });

    testWidgets('starts meditation when duration selected', (tester) async {
      await tester.pumpWidget(createSubject());

      await tester.tap(find.text('10 min'));
      await tester.pump();

      verify(() =>
              bloc.add(StartMeditation(duration: const Duration(minutes: 10))))
          .called(1);
    });

    testWidgets('shows controls when meditation is active', (tester) async {
      // Arrange
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );
      when(() => bloc.state).thenReturn(
        MeditationActive(session: session, soundSettings: {}),
      );

      // Act
      await tester.pumpWidget(createSubject());

      // Assert
      expect(find.text('05:00'), findsOneWidget);
      expect(find.byIcon(Icons.pause), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsOneWidget);
      expect(find.text('Ambient Sounds'), findsOneWidget);
    });

    testWidgets('shows play button when meditation is paused', (tester) async {
      // Arrange
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.paused,
      );
      when(() => bloc.state).thenReturn(
        MeditationActive(session: session, soundSettings: {}),
      );

      // Act
      await tester.pumpWidget(createSubject());

      // Assert
      expect(find.text('05:00'), findsOneWidget);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsOneWidget);
    });

    testWidgets('controls trigger correct events', (tester) async {
      // Arrange
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );
      when(() => bloc.state).thenReturn(
        MeditationActive(session: session, soundSettings: {}),
      );

      // Act & Assert
      await tester.pumpWidget(createSubject());

      await tester.tap(find.byIcon(Icons.pause));
      verify(() => bloc.add(PauseMeditation())).called(1);

      when(() => bloc.state).thenReturn(
        MeditationActive(
          session: session.copyWith(status: MeditationStatus.paused),
          soundSettings: {},
        ),
      );
      await tester.pump();

      await tester.tap(find.byIcon(Icons.play_arrow));
      verify(() => bloc.add(ResumeMeditation())).called(1);

      await tester.tap(find.byIcon(Icons.stop));
      verify(() => bloc.add(StopMeditation())).called(1);
    });

    testWidgets('shows ambient sound controls', (tester) async {
      // Arrange
      final session = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 5),
        status: MeditationStatus.running,
      );
      when(() => bloc.state).thenReturn(
        MeditationActive(session: session, soundSettings: {
          'rain': const AmbientSoundSettings(isActive: true, volume: 0.5),
        }),
      );

      // Act
      await tester.pumpWidget(createSubject());

      // Assert
      expect(find.text('Rain'), findsOneWidget);
      expect(find.text('Waves'), findsOneWidget);
      expect(find.text('Forest'), findsOneWidget);

      // Test sound toggle
      await tester.tap(find.byType(Switch).first);
      verify(() => bloc.add(ToggleSound(soundId: 'rain', active: false)))
          .called(1);

      // Test volume change
      final slider = find.byType(Slider);
      expect(slider, findsOneWidget);
      await tester.drag(slider, const Offset(20.0, 0.0));

      // Volume change events should be verified, but the exact value depends on the slider size
      verify(() => bloc.add(any<AdjustVolume>())).called(1);
    });

    testWidgets('shows snackbar when meditation completes', (tester) async {
      // Arrange
      final completedSession = MeditationSession(
        duration: const Duration(minutes: 10),
        currentTime: const Duration(minutes: 10),
        status: MeditationStatus.completed,
      );

      whenListen(
        bloc,
        Stream.fromIterable([
          MeditationInitial(),
          MeditationCompleted(session: completedSession),
        ]),
        initialState: MeditationInitial(),
      );

      // Act
      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Meditation session completed!'), findsOneWidget);
    });

    testWidgets('shows error snackbar on error state', (tester) async {
      // Arrange
      whenListen(
        bloc,
        Stream.fromIterable([
          MeditationInitial(),
          const MeditationError(message: 'Test error'),
        ]),
        initialState: MeditationInitial(),
      );

      // Act
      await tester.pumpWidget(createSubject());
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Error: Test error'), findsOneWidget);
    });
  });
}
