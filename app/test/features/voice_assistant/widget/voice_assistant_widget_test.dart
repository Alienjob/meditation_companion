import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_event.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/chat/repository/chat_repository.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_state.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:meditation_companion/features/voice_assistant/voice_assistant_widget.dart';

import 'package:openai_realtime_dart/openai_realtime_dart.dart'; // Add this import

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

  setUpAll(() {
    registerFallbackValue(const ContentPart.inputText(text: 'test'));
  });

  setUp(() {
    chatBloc = MockChatBloc();
    assistantBloc = MockAssistantBloc();
    audioService = MockAudioService();
    chatRepository = MockChatRepository();

    // Default stream states
    when(() => audioService.voiceStreamState)
        .thenAnswer((_) => Stream.value(VoiceStreamState.idle));
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
      const idleState = AssistantState();

      whenListen(
        assistantBloc,
        Stream.value(idleState),
        initialState: idleState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byKey(VoiceAssistantWidget.micButtonKey), findsOneWidget);
      expect(find.byKey(VoiceAssistantWidget.stopButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.sendButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.deleteButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.interruptButtonKey), findsNothing);
    });

    testWidgets('shows stop button when recording', (tester) async {
      const recordingState = AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recording,
      );

      whenListen(
        assistantBloc,
        Stream.value(recordingState),
        initialState: recordingState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byKey(VoiceAssistantWidget.stopButtonKey), findsOneWidget);
      expect(find.byKey(VoiceAssistantWidget.micButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.sendButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.deleteButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.interruptButtonKey), findsNothing);
    });

    testWidgets('shows send and delete buttons when recorded', (tester) async {
      const recordedState = AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
      );

      whenListen(
        assistantBloc,
        Stream.value(recordedState),
        initialState: recordedState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.byKey(VoiceAssistantWidget.sendButtonKey), findsOneWidget);
      expect(find.byKey(VoiceAssistantWidget.deleteButtonKey), findsOneWidget);
      expect(find.byKey(VoiceAssistantWidget.micButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.stopButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.interruptButtonKey), findsNothing);
    });

    testWidgets('shows interrupt button when responding', (tester) async {
      const respondingState = AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      );

      whenListen(
        assistantBloc,
        Stream.value(respondingState),
        initialState: respondingState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(
          find.byKey(VoiceAssistantWidget.interruptButtonKey), findsOneWidget);
      expect(find.byKey(VoiceAssistantWidget.micButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.stopButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.sendButtonKey), findsNothing);
      expect(find.byKey(VoiceAssistantWidget.deleteButtonKey), findsNothing);
    });

    testWidgets('handles mic button tap', (tester) async {
      const idleState = AssistantState(
        clientStatus: ClientStatus.ready,
      );

      whenListen(
        assistantBloc,
        Stream.value(idleState),
        initialState: idleState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byKey(VoiceAssistantWidget.micButtonKey));
      await tester.pump();

      verify(() => assistantBloc.add(StartRecordingUserAudioInput())).called(1);
    });

    testWidgets('handles stop recording tap', (tester) async {
      const recordingState = AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recording,
      );

      whenListen(
        assistantBloc,
        Stream.value(recordingState),
        initialState: recordingState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byKey(VoiceAssistantWidget.stopButtonKey));
      await tester.pump();

      verify(() => assistantBloc.add(StopRecordingUserAudioInput())).called(1);
    });

    testWidgets('handles send button tap', (tester) async {
      const recordedState = AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
      );

      whenListen(
        assistantBloc,
        Stream.value(recordedState),
        initialState: recordedState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byKey(VoiceAssistantWidget.sendButtonKey));
      await tester.pump();

      verify(() => assistantBloc.add(SendRecordedAudio())).called(1);
    });

    testWidgets('handles delete button tap', (tester) async {
      const recordedState = AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
      );

      whenListen(
        assistantBloc,
        Stream.value(recordedState),
        initialState: recordedState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byKey(VoiceAssistantWidget.deleteButtonKey));
      await tester.pump();

      verify(() => assistantBloc.add(ClearRecordedAudio())).called(1);
    });

    testWidgets('handles interrupt tap', (tester) async {
      const respondingState = AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      );

      whenListen(
        assistantBloc,
        Stream.value(respondingState),
        initialState: respondingState,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      await tester.tap(find.byKey(VoiceAssistantWidget.interruptButtonKey));
      await tester.pump();

      verify(() => assistantBloc.add(InterruptResponse())).called(1);
    });
  });
}
