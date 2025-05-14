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

class MockRealtimeClient extends Mock implements RealtimeClient {
  @override
  Future<bool> sendUserMessageContent(List<ContentPart> parts) async => true;
  @override
  Future<ItemMessage?> cancelResponse(
          [String? itemId = null, int? sampleCount]) async =>
      null;
}

void main() {
  late AssistantBloc bloc;
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

    bloc = AssistantBloc(
      chatBloc: chatBloc,
      audioService: audioService,
      recorder: recorder,
      client: client,
    );
  });

  tearDown(() {
    bloc.close();
  });

  group('Assistant Bloc Tests', () {
    test('initial state is correct', () {
      expect(bloc.state, const AssistantState());
    });

    blocTest<AssistantBloc, AssistantState>(
      'emits ready state when client connects',
      build: () => bloc,
      act: (bloc) => bloc.add(ClientConnected()),
      expect: () => [
        const AssistantState(clientStatus: ClientStatus.ready),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles client error',
      build: () => bloc,
      act: (bloc) => bloc.add(const ClientError('Connection failed')),
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.error,
          lastError: 'Connection failed',
        ),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles recording start and stop',
      build: () => bloc,
      seed: () => const AssistantState(clientStatus: ClientStatus.ready),
      act: (bloc) async {
        when(() => recorder.startRecording()).thenAnswer((_) async {});
        when(() => recorder.stopRecording())
            .thenAnswer((_) async => Uint8List.fromList([0]));

        bloc.add(StartRecordingUserAudioInput());
        await Future.delayed(const Duration(milliseconds: 100));
        bloc.add(StopRecordingUserAudioInput());
      },
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.recording,
          recordingDuration: Duration.zero,
        ),
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.recorded,
          recordingDuration: Duration(milliseconds: 100),
        ),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles sending recorded audio',
      build: () => bloc,
      seed: () => AssistantState(
        clientStatus: ClientStatus.ready,
        userInput: UserInputState.recorded,
        recordedAudio: Uint8List.fromList([0]),
      ),
      act: (bloc) => bloc.add(SendRecordedAudio()),
      expect: () => [
        const AssistantState(
          clientStatus: ClientStatus.ready,
          userInput: UserInputState.idle,
        ),
      ],
      verify: (_) {
        verify(() => client.sendUserMessageContent(any())).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles audio receiving and playback',
      build: () => bloc,
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
      build: () => bloc,
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
      build: () => bloc,
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
