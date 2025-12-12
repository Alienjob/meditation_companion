import 'dart:async';
import 'dart:typed_data';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_state.dart';

class MockAudioService extends Mock implements AudioService {}

class MockAudioRecorder extends Mock implements AudioRecorder {}

class MockRealtimeClient extends Mock implements RealtimeClient {}

void main() {
  late MockAudioService audioService;
  late MockAudioRecorder recorder;
  late MockRealtimeClient client;

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
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
    when(() => recorder.stateStream).thenAnswer((_) => const Stream.empty());
    when(() => recorder.currentState).thenReturn(AudioRecorderState.idle());
    when(() => recorder.startStreaming()).thenAnswer((_) async {});
    when(() => recorder.stopStreaming()).thenAnswer((_) async {});
    when(() => recorder.pauseStreaming()).thenAnswer((_) async {});
    when(() => recorder.resumeStreaming()).thenAnswer((_) async {});
    when(() => recorder.startRecording()).thenAnswer((_) async {});
    when(() => recorder.stopRecording())
        .thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));
    when(() => client.appendInputAudio(any())).thenAnswer((_) async => true);
    when(() => client.createResponse()).thenAnswer((_) async => true);
    when(() => client.inputAudioBuffer).thenReturn(Uint8List(0));

    // Stub the client methods properly
    when(() => client.sendUserMessageContent(any()))
        .thenAnswer((_) async => true);
    when(() => client.cancelResponse(any(), any()))
        .thenAnswer((_) async => null);
  });

  group('Assistant Bloc Tests', () {
    test('initial state is correct', () {
      final bloc = AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      );
      expect(bloc.state.clientStatus, ClientStatus.connecting);
      expect(bloc.state.responseState, ResponseState.idle);
      expect(bloc.state.recorderState.status, AudioRecorderStatus.idle);
      bloc.close();
    });

    blocTest<AssistantBloc, AssistantState>(
      'emits ready state when client connects',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      act: (bloc) => bloc.add(ClientConnected()),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles client error',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      act: (bloc) => bloc.add(const ClientError('Connection failed')),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.error)
            .having((s) => s.lastError, 'lastError', 'Connection failed'),
      ],
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles recorder state changes from recorder stream',
      build: () {
        final stateController = StreamController<AudioRecorderState>.broadcast();
        when(() => recorder.stateStream)
            .thenAnswer((_) => stateController.stream);
        when(() => recorder.currentState).thenReturn(AudioRecorderState.idle());

        final bloc = AssistantBloc(
          audioService: audioService,
          recorder: recorder,
          client: client,
        );

        // Add state after bloc is created
        Future.microtask(() {
          stateController.add(AudioRecorderState(
            status: AudioRecorderStatus.recordingBuffered,
            mode: AudioRecorderMode.buffered,
            recordingDuration: const Duration(milliseconds: 100),
          ));
        });

        return bloc;
      },
      seed: () => AssistantState(clientStatus: ClientStatus.ready),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.recorderState.status, 'recorder status',
                AudioRecorderStatus.recordingBuffered)
            .having((s) => s.recorderState.recordingDuration, 'duration',
                const Duration(milliseconds: 100)),
      ],
    );

    // Simplified test for streaming mode
    blocTest<AssistantBloc, AssistantState>(
      'enables streaming mode and starts streaming',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(clientStatus: ClientStatus.ready),
      act: (bloc) => bloc.add(const ToggleStreamingMode(true)),
      verify: (_) {
        // Streaming is started automatically when toggle is enabled
        verify(() => recorder.startStreaming()).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles sending recorded audio',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(
        clientStatus: ClientStatus.ready,
        recorderState: AudioRecorderState(
          status: AudioRecorderStatus.idle,
          mode: AudioRecorderMode.buffered,
          recordedData: Uint8List.fromList([0]),
        ),
      ),
      act: (bloc) => bloc.add(SendRecordedAudio()),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready)
            .having((s) => s.responseState, 'responseState',
                ResponseState.responding),
      ],
      verify: (_) {
        // Bloc sends audio via appendInputAudio and then createResponse
        verify(() => client.appendInputAudio(any())).called(1);
        verify(() => client.createResponse(responseConfig: any(named: 'responseConfig'))).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles audio receiving and playback',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(clientStatus: ClientStatus.ready),
      act: (bloc) async {
        when(() => audioService.appendVoiceChunk(any(), any()))
            .thenAnswer((_) async {});
        bloc.add(ResponseAudioReceived(
          itemId: 'test_id',
          audioData: Uint8List.fromList([0]),
        ));
      },
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready)
            .having(
                (s) => s.responseState, 'responseState', ResponseState.responding),
      ],
      verify: (_) {
        verify(() => audioService.appendVoiceChunk(any(), any())).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles response interruption',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(
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
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready)
            .having((s) => s.responseState, 'responseState', ResponseState.idle),
      ],
      verify: (_) {
        verify(() => audioService.stopVoice()).called(1);
      },
    );

    blocTest<AssistantBloc, AssistantState>(
      'handles response completion',
      build: () => AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: client,
      ),
      seed: () => AssistantState(
        clientStatus: ClientStatus.ready,
        responseState: ResponseState.responding,
      ),
      act: (bloc) => bloc.add(const ResponseCompleted('test_id')),
      expect: () => [
        isA<AssistantState>()
            .having((s) => s.clientStatus, 'clientStatus', ClientStatus.ready)
            .having((s) => s.responseState, 'responseState', ResponseState.idle),
      ],
    );
  });
}
