import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';

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

  static const _domain = 'Voice Assistant';
  static const _featureRecording = 'AssistantBloc Recording';
  static const _featureStreaming = 'AssistantBloc Streaming';
  static const _featureMode = 'AssistantBloc Mode';
  static const _featureResponse = 'AssistantBloc Response';

  void _debug(String feature, String message) {
    logDebug(
      message,
      domain: _domain,
      feature: feature,
      context: AssistantBloc,
    );
  }

  void _info(String feature, String message) {
    logInfo(
      message,
      domain: _domain,
      feature: feature,
      context: AssistantBloc,
    );
  }

  AssistantBloc({
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

  Future<void> _beginStreamingCapture() async {
    final stream = _recorder.audioStream;
    await _recorder.startStreaming();
    await _micStreamSubscription?.cancel();
    _micStreamSubscription = stream.listen(
      (chunk) {
        if (chunk.isEmpty) return;
        unawaited(
          _client.appendInputAudio(chunk).catchError(
            (error, stackTrace) {
              add(ClientError('Failed to send audio: $error'));
              return false;
            },
          ),
        );
      },
      onError: (error, stackTrace) {
        add(ClientError('Streaming error: $error'));
      },
    );
  }

  Future<void> _upgradeRecordingToStreaming(
    Emitter<AssistantState> emit,
  ) async {
    _debug(_featureStreaming, 'Promoting buffered capture to streaming mode');
    try {
      await _recorder.stopRecording();
    } on AudioRecorderException catch (error) {
      _debug(
        _featureStreaming,
        'Buffered recording stop during upgrade reported: ${error.message}',
      );
    } catch (error) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => 'Failed to switch to streaming: $error',
      ));
      return;
    }

    try {
      await _beginStreamingCapture();
    } catch (error) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => 'Failed to start streaming: $error',
        streamingEnabled: false,
      ));
      return;
    }

    emit(state.copyWith(
      userInput: UserInputState.recording,
      recordedAudio: () => null,
      streamingEnabled: true,
    ));
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
    _debug(
      _featureRecording,
      'Start recording requested; streaming=${state.streamingEnabled} canRecord=${state.canRecord}',
    );
    if (!state.canRecord) {
      _debug(
        _featureRecording,
        'Start recording ignored because canRecord=false',
      );
      return;
    }

    try {
      if (state.streamingEnabled) {
        _debug(_featureStreaming, 'Starting streaming recorder');
        await _beginStreamingCapture();
      } else {
        _debug(_featureRecording, 'Starting buffered recorder');
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
        _debug(_featureStreaming, 'Stopping streaming recorder');
        await _recorder.stopStreaming();
        _debug(_featureResponse, 'Requesting response after streaming');
        await _client.createResponse();
        emit(state.copyWith(
          userInput: UserInputState.idle,
          recordedAudio: () => null,
          recordingDuration: Duration.zero,
          streamingEnabled: false,
        ));
      } else {
        _debug(_featureRecording, 'Stopping buffered recorder');
        final audioData = await _recorder.stopRecording();
        emit(state.copyWith(
          userInput: UserInputState.recorded,
          recordedAudio: () => audioData,
        ));
        add(SendRecordedAudio());
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

  Future<void> _onToggleStreamingMode(
    ToggleStreamingMode event,
    Emitter<AssistantState> emit,
  ) async {
    _info(_featureMode, 'Streaming mode set to ${event.enabled}');

    final upgradingDuringHold = event.enabled &&
        !state.streamingEnabled &&
        state.userInput == UserInputState.recording;

    if (upgradingDuringHold) {
      await _upgradeRecordingToStreaming(emit);
      return;
    }

    emit(state.copyWith(streamingEnabled: event.enabled));
  }

  void _onServerVadSpeechStarted(
    ServerVadSpeechStarted event,
    Emitter<AssistantState> emit,
  ) {
    _debug(_featureStreaming, 'Server VAD detected speech start');
  }

  void _onServerVadSpeechStopped(
    ServerVadSpeechStopped event,
    Emitter<AssistantState> emit,
  ) {
    _debug(_featureStreaming, 'Server VAD detected speech stop');
    if (state.streamingEnabled && state.userInput == UserInputState.recording) {
      add(StopRecordingUserAudioInput());
    }
  }

  Future<void> _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) async {
    _debug(
      _featureResponse,
      'Sending recorded audio: ${state.recordedAudio?.length} bytes',
    );
    if (!state.canSendRecording) return;

    try {
      final base64Audio = base64Encode(state.recordedAudio!);

      await _client.sendUserMessageContent([
        ContentPart.inputAudio(audio: base64Audio),
      ]);
      await _client.createResponse();

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
