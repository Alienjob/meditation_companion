import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../../chat/bloc/chat_bloc.dart';
import '../../audio/services/stream_timeline.dart';
import '../../meditation/services/audio_service.dart';
import '../services/audio_recorder.dart';
import 'assistant_event.dart';
import 'assistant_state.dart';

class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  final AudioService _audioService;
  final AudioRecorder _recorder;
  final RealtimeClient _client;
  final StreamTimeline _positionTracker;

  Timer? _recordingTimer;
  StreamSubscription<Uint8List>? _micStreamSubscription;

  AssistantBloc({
    required ChatBloc chatBloc,
    required AudioService audioService,
    required AudioRecorder recorder,
    required RealtimeClient client,
  })  : _audioService = audioService,
        _recorder = recorder,
        _client = client,
        _positionTracker = StreamTimeline(24000), // 24kHz for voice
        super(const AssistantState()) {
    on<ClientConnected>(_onClientConnected);
    on<ClientError>(_onClientError);
    on<StartRecordingUserAudioInput>(_onStartRecording);
    on<StopRecordingUserAudioInput>(_onStopRecording);
    on<ClearRecordedAudio>(_onClearRecording);
    on<SendRecordedAudio>(_onSendRecordedAudio);
    on<ToggleStreamingMode>(_onToggleStreamingMode);
    on<ServerVadSpeechStarted>(_onServerVadSpeechStarted);
    on<ServerVadSpeechStopped>(_onServerVadSpeechStopped);
    on<UserMessageTranscribed>(_onUserMessageTranscribed);
    on<ResponseTextReceived>(_onResponseTextReceived);
    on<ResponseAudioReceived>(_onResponseAudioReceived);
    on<ResponseAudioStreamEnded>(_onResponseAudioStreamEnded);
    on<InterruptResponse>(_onInterruptResponse);
    on<ResponseCompleted>(_onResponseCompleted);
    on<UpdateRecordingDuration>(_onUpdateRecordingDuration);
  }

  void _onClientConnected(
    ClientConnected event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(clientStatus: ClientStatus.ready));
  }

  void _onClientError(
    ClientError event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.error,
      lastError: () => event.error,
    ));
  }

  Future<void> _onStartRecording(
    StartRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) async {
    log('Start recording requested; streaming=${state.streamingEnabled} canRecord=${state.canRecord}');
    if (!state.canRecord) {
      log('Start recording ignored because canRecord=false');
      return;
    }

    try {
      if (state.streamingEnabled) {
        final stream = _recorder.audioStream;
        log('Starting streaming recorder');
        await _recorder.startStreaming();
        await _micStreamSubscription?.cancel();
        _micStreamSubscription = stream.listen(
          (chunk) {
            if (chunk.isEmpty) return;
            log('Streaming chunk appended: ${chunk.length} bytes');
            unawaited(
              _client.appendInputAudio(chunk).catchError(
                (error, stackTrace) {
                  add(ClientError('Failed to send audio: $error'));
                },
              ),
            );
          },
          onError: (error, stackTrace) {
            add(ClientError('Streaming error: $error'));
          },
        );
      } else {
        log('Starting buffered recorder');
        await _recorder.startRecording();
      }
      emit(state.copyWith(
        userInput: UserInputState.recording,
        recordingDuration: Duration.zero,
      ));

      _recordingTimer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) {
          add(const UpdateRecordingDuration());
        },
      );
    } catch (e) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => e.toString(),
      ));
    }
  }

  Future<void> _onStopRecording(
    StopRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) async {
    _recordingTimer?.cancel();
    _recordingTimer = null;

    if (state.userInput != UserInputState.recording) return;

    try {
      if (state.streamingEnabled) {
        await _micStreamSubscription?.cancel();
        _micStreamSubscription = null;
        log('Stopping streaming recorder');
        await _recorder.stopStreaming();
        log('Requesting response after streaming');
        await _client.createResponse();
        emit(state.copyWith(
          userInput: UserInputState.idle,
          recordedAudio: () => null,
          recordingDuration: Duration.zero,
        ));
      } else {
        log('Stopping buffered recorder');
        final audioData = await _recorder.stopRecording();
        emit(state.copyWith(
          userInput: UserInputState.recorded,
          recordedAudio: () => audioData,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => e.toString(),
      ));
    }
  }

  void _onUpdateRecordingDuration(
    UpdateRecordingDuration event,
    Emitter<AssistantState> emit,
  ) {
    // Only update if still recording
    if (state.userInput != UserInputState.recording) return;

    final newDuration =
        state.recordingDuration + const Duration(milliseconds: 100);

    if (newDuration >= AssistantState.maxRecordingDuration) {
      add(StopRecordingUserAudioInput());
    } else {
      emit(state.copyWith(recordingDuration: newDuration));
    }
  }

  void _onClearRecording(
    ClearRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      userInput: UserInputState.idle,
      recordedAudio: null,
      recordingDuration: Duration.zero,
    ));
  }

  void _onToggleStreamingMode(
    ToggleStreamingMode event,
    Emitter<AssistantState> emit,
  ) {
    log('Streaming mode set to ${event.enabled}');

    final shouldStartStreaming = event.enabled &&
        state.canRecord &&
        state.userInput == UserInputState.idle;
    final shouldStopStreaming =
        !event.enabled && state.userInput == UserInputState.recording;

    emit(state.copyWith(streamingEnabled: event.enabled));

    if (shouldStartStreaming) {
      log('Auto-starting streaming after toggle');
      add(StartRecordingUserAudioInput());
    } else if (shouldStopStreaming) {
      log('Auto-stopping streaming after toggle off');
      add(StopRecordingUserAudioInput());
    }
  }

  void _onServerVadSpeechStarted(
    ServerVadSpeechStarted event,
    Emitter<AssistantState> emit,
  ) {
    log('Server VAD detected speech start');
  }

  void _onServerVadSpeechStopped(
    ServerVadSpeechStopped event,
    Emitter<AssistantState> emit,
  ) {
    log('Server VAD detected speech stop');
    if (state.streamingEnabled && state.userInput == UserInputState.recording) {
      add(StopRecordingUserAudioInput());
    }
  }

  Future<void> _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) async {
    log('Sending recorded audio: ${state.recordedAudio?.length} bytes');
    if (!state.canSendRecording) return;

    try {
      final base64Audio = base64Encode(state.recordedAudio!);

      await _client.sendUserMessageContent([
        ContentPart.inputAudio(audio: base64Audio), // Keep the base64 encoding
      ]);

      emit(state.copyWith(
        userInput: UserInputState.idle,
        recordedAudio: () => null,
        recordingDuration: Duration.zero,
      ));
    } catch (e) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => e.toString(),
      ));
    }
  }

  void _onUserMessageTranscribed(
    UserMessageTranscribed event,
    Emitter<AssistantState> emit,
  ) {
    // Handled by ChatBloc
  }

  void _onResponseTextReceived(
    ResponseTextReceived event,
    Emitter<AssistantState> emit,
  ) {
    if (state.responseState != ResponseState.responding) {
      emit(state.copyWith(responseState: ResponseState.responding));
    }
  }

  Future<void> _onResponseAudioReceived(
    ResponseAudioReceived event,
    Emitter<AssistantState> emit,
  ) async {
    _positionTracker.addChunk(event.itemId, event.audioData.length);
    await _audioService.appendVoiceChunk(event.itemId, event.audioData);

    if (state.responseState != ResponseState.responding) {
      emit(state.copyWith(responseState: ResponseState.responding));
    }
  }

  Future<void> _onResponseAudioStreamEnded(
    ResponseAudioStreamEnded event,
    Emitter<AssistantState> emit,
  ) async {
    await _audioService.appendVoiceChunk(event.itemId, Uint8List(0));
  }

  Future<void> _onInterruptResponse(
    InterruptResponse event,
    Emitter<AssistantState> emit,
  ) async {
    if (state.responseState != ResponseState.responding) return;

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final result = _positionTracker.getInterruptionState(timestamp);

    await _audioService.stopVoice();
    await _client.cancelResponse(result.itemId, result.sampleCount);

    emit(state.copyWith(responseState: ResponseState.idle));
    _positionTracker.reset();
  }

  void _onResponseCompleted(
    ResponseCompleted event,
    Emitter<AssistantState> emit,
  ) {
    unawaited(_audioService.stopVoice());
    emit(state.copyWith(responseState: ResponseState.idle));
    _positionTracker.reset();
  }

  @override
  Future<void> close() async {
    _recordingTimer?.cancel();
    await _micStreamSubscription?.cancel();
    await super.close();
  }
}
