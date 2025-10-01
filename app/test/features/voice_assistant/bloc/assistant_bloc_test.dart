import 'dart:async';
import 'dart:typed_data';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_state.dart';

class MockChatBloc extends Mock implements ChatBloc {}

class MockAudioService extends Mock implements AudioService {}

class MockAudioRecorder extends Mock implements AudioRecorder {}

class MockRealtimeClient extends Mock implements RealtimeClient {}

void main() {
  late MockChatBloc chatBloc;
  late MockAudioService audioService;
  late MockAudioRecorder recorder;
  late MockRealtimeClient client;

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    chatBloc = MockChatBloc();
    audioService = MockAudioService();
    recorder = MockAudioRecorder();
    client = MockRealtimeClient();

    // Default stub for stream methods
    when(() => audioService.voiceStreamState)
        .thenAnswer((_) => Stream.value(VoiceStreamState.idle));
    when(() => audioService.appendVoiceChunk(any(), any()))
        .thenAnswer((_) async {});
    when(() => audioService.stopVoice()).thenAnswer((_) async {});

    when(() => recorder.audioStream).thenAnswer((_) => const Stream.empty());
    when(() => recorder.startStreaming()).thenAnswer((_) async {});
    when(() => recorder.stopStreaming()).thenAnswer((_) async {});
    when(() => client.appendInputAudio(any())).thenAnswer((_) async => true);
    when(() => client.createResponse()).thenAnswer((_) async => true);

    // Stub the client methods properly
    when(() => client.sendUserMessageContent(any()))
        .thenAnswer((_) async => true);
    when(() => client.cancelResponse(any(), any()))
        .thenAnswer((_) async => null);
  });

  group('Assistant Bloc Tests', () {
    test('initial state is correct', () {
      final bloc = AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      );
      expect(bloc.state, const AssistantState());
      bloc.close();
    });

    blocTest<AssistantBloc, AssistantState>(
      'emits ready state when client connects',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      act: (bloc) => bloc.add(ClientConnected()),
      expect: () => [
        const AssistantState(clientStatus: ClientStatus.ready),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'toggles streaming mode on and off',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      act: (bloc) {
        bloc
          ..add(const ToggleStreamingMode(true))
          ..add(const ToggleStreamingMode(false));
      },
      expect: () => [
        const AssistantState(streamingEnabled: true),
        const AssistantState(streamingEnabled: false),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles client error',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      act: (bloc) => bloc.add(const ClientError('Connection failed')),
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.error,
          lastError: 'Connection failed',
        ),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles recording start and duration updates in buffered mode',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => const AssistantState(clientStatus: ClientStatus.ready),
      act: (bloc) async {
        when(() => recorder.startRecording()).thenAnswer((_) async {});

        bloc.add(StartRecordingUserAudioInput());
        // Simulate timer events
        bloc.add(const UpdateRecordingDuration());
        bloc.add(const UpdateRecordingDuration());
      },
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.recording,
          recordingDuration: Duration.zero,
        ),
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.recording,
          recordingDuration: Duration(milliseconds: 100),
        ),
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.recording,
          recordingDuration: Duration(milliseconds: 200),
        ),
      ],
    );

    test('streams audio chunks when streaming mode enabled', () async {
      final controller = StreamController<Uint8List>.broadcast();
      when(() => recorder.audioStream).thenAnswer((_) => controller.stream);

      final bloc = AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      );

      final emittedStates = <AssistantState>[];
      final subscription = bloc.stream.listen(emittedStates.add);

      bloc.add(ClientConnected());
      await pumpEventQueue();
      bloc.add(const ToggleStreamingMode(true));
      await pumpEventQueue();

      bloc.add(StartRecordingUserAudioInput());
      await pumpEventQueue();

      controller.add(Uint8List.fromList([1, 2, 3]));
      await pumpEventQueue();

      bloc.add(StopRecordingUserAudioInput());
      await pumpEventQueue();

      expect(
        emittedStates.any((s) => s.userInput == UserInputState.recording),
        isTrue,
      );
      expect(bloc.state.userInput, UserInputState.idle);
      expect(bloc.state.streamingEnabled, isTrue);

      verify(() => recorder.startStreaming()).called(1);
      verify(() => recorder.stopStreaming()).called(1);
      verify(() => client.appendInputAudio(any())).called(1);
      verify(() => client.createResponse()).called(1);

      await subscription.cancel();
      await bloc.close();
      await controller.close();
    });

    blocTest<AssistantBloc, AssistantState>(
      'handles sending recorded audio',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
        recordedAudio: Uint8List.fromList([0]),
      ),
      act: (bloc) => bloc.add(SendRecordedAudio()),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready)
            .having((s) => s.userInput, 'userInput', UserInputState.idle)
            .having((s) => s.recordedAudio, 'recordedAudio', null)
            .having(
                (s) => s.recordingDuration, 'recordingDuration', Duration.zero),
      ],
      verify: (_) {
        verify(() => client.sendUserMessageContent(any())).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles audio receiving and playback',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => const AssistantState(clientStatus: ClientStatus.ready),
      act: (bloc) async {
        when(() => audioService.appendVoiceChunk(any(), any()))
            .thenAnswer((_) async {});
        bloc.add(ResponseAudioReceived(
          itemId: 'test_id',
          audioData: Uint8List.fromList([0]),
        ));
      },
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          responseState: ResponseState.responding,
        ),
      ],
      verify: (_) {
        verify(() => audioService.appendVoiceChunk(any(), any())).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles response interruption',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => const AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      ),
      act: (bloc) async {
        when(() => audioService.stopVoice()).thenAnswer((_) async {});
        when(() => client.cancelResponse(any(), any()))
            .thenAnswer((_) async => null);
        bloc.add(InterruptResponse());
      },
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          responseState: ResponseState.idle,
        ),
      ],
      verify: (_) {
        verify(() => audioService.stopVoice()).called(1);
        verify(() => client.cancelResponse(any(), any())).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles response completion',
      build: () => AssistantBloc(
        chatBloc: chatBloc,
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => const AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      ),
      act: (bloc) => bloc.add(const ResponseCompleted('test_id')),
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          responseState: ResponseState.idle,
        ),
      ],
    );
  });
}
