import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_event.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/chat/repository/chat_repository.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_state.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:meditation_companion/features/voice_assistant/voice_assistant_widget.dart';

class MockChatBloc extends MockBloc<ChatEvent, ChatState> implements ChatBloc {
  MockChatBloc() {
    when(() => state).thenReturn(const ChatConnected([]));
  }
}

class MockAssistantBloc extends MockBloc<AssistantEvent, AssistantState>
    implements AssistantBloc {}

class MockAudioService extends Mock implements AudioService {}

class MockChatRepository extends Mock implements IChatRepository {}

void main() {
  late MockChatBloc chatBloc;
  late MockAssistantBloc assistantBloc;
  late MockAudioService audioService;
  late MockChatRepository chatRepository;

  setUp(() {
    chatBloc = MockChatBloc();
    assistantBloc = MockAssistantBloc();
    audioService = MockAudioService();
    chatRepository = MockChatRepository();

    // Default stream states
    when(() => audioService.voiceStreamState)
        .thenAnswer((_) => Stream.value(VoiceStreamState.idle));
    when(() => assistantBloc.state).thenReturn(const AssistantState());
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AudioService>.value(value: audioService),
          RepositoryProvider<IChatRepository>.value(value: chatRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ChatBloc>.value(value: chatBloc),
            BlocProvider<AssistantBloc>.value(value: assistantBloc),
          ],
          child: const VoiceAssistantWidget(),
        ),
      ),
    );
  }

  group('VoiceAssistantWidget', () {
    testWidgets('shows mic button when idle', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byIcon(Icons.mic), findsOneWidget);
      expect(find.byIcon(Icons.stop), findsNothing);
      expect(find.byIcon(Icons.send), findsNothing);
    });

    testWidgets('shows stop button when recording', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recording,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byIcon(Icons.stop), findsOneWidget);
      expect(find.byIcon(Icons.mic), findsNothing);
    });

    testWidgets('shows send and delete buttons when recorded', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byIcon(Icons.send), findsOneWidget);
      expect(find.byIcon(Icons.delete), findsOneWidget);
      expect(find.byIcon(Icons.mic), findsNothing);
    });

    testWidgets('shows interrupt button when responding', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Interrupt'), findsOneWidget);
      expect(find.byIcon(Icons.mic), findsNothing);
    });

    testWidgets('handles mic button tap', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.mic));
      await tester.pump();

      verify(() => assistantBloc.add(StartRecordingUserAudioInput())).called(1);
    });

    testWidgets('handles stop recording tap', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recording,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byIcon(Icons.stop));
      await tester.pump();

      verify(() => assistantBloc.add(StopRecordingUserAudioInput())).called(1);
    });

    testWidgets('handles interrupt tap', (tester) async {
      when(() => assistantBloc.state).thenReturn(const AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      ));

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.text('Interrupt'));
      await tester.pump();

      verify(() => assistantBloc.add(InterruptResponse())).called(1);
    });
  });
}
