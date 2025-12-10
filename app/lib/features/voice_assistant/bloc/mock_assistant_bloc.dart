import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/audio_recorder.dart';
import '../services/mock_audio_recorder.dart';
import 'assistant_event.dart';
import 'assistant_state.dart';
import 'debug_assistant_event.dart';

/// Mock implementation of AssistantBloc for debugging and testing
///
/// This bloc provides simplified logic for state transitions without
/// real audio/AI service integration. It responds to the same events
/// and emits the same states as the production AssistantBloc.
///
/// Use this with DebugAssistantPanel to manually control assistant states
/// and test coordinator behavior.
class MockAssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  Timer? _responseTimer;
  final Random _random = Random();
  final MockAudioRecorder _recorder = MockAudioRecorder();
  StreamSubscription<void>? _recorderSubscription;

  MockAssistantBloc() : super(AssistantState()) {
    on<ClientConnected>(_onClientConnected);
    on<ClientError>(_onClientError);
    on<StartRecordingUserAudioInput>(_onStartRecording);
    on<StopRecordingUserAudioInput>(_onStopRecording);
    on<ToggleStreamingMode>(_onToggleStreamingMode);
    on<InterruptResponse>(_onInterruptResponse);
    on<ResponseCompleted>(_onResponseCompleted);
    on<ResponseTextReceived>(_onResponseTextReceived);
    on<ResponseAudioReceived>(_onResponseAudioReceived);
    on<ServerVadSpeechStarted>(_onServerVadSpeechStarted);
    on<ServerVadSpeechStopped>(_onServerVadSpeechStopped);
    on<ClearRecordedAudio>(_onClearRecordedAudio);
    on<SendRecordedAudio>(_onSendRecordedAudio);
    on<StreamingActivityChanged>(_onStreamingActivityChanged);
    on<UserMessageTranscribed>(_onUserMessageTranscribed);
    on<UpdateRecordingDuration>(_onUpdateRecordingDuration);
    on<RecorderStateChanged>(_onRecorderStateChanged);

    // Subscribe to recorder state changes
    _recorderSubscription = _recorder.stateStream.listen((recorderState) {
      add(RecorderStateChanged(recorderState));
    });

    // Debug events
    on<DebugConnect>(_onDebugConnect);
    on<DebugConnectionError>(_onDebugConnectionError);
    on<DebugNetworkTimeout>(_onDebugNetworkTimeout);
    on<DebugRateLimit>(_onDebugRateLimit);
    on<DebugStartResponding>(_onDebugStartResponding);
    on<DebugFinishResponding>(_onDebugFinishResponding);
    on<DebugForceReady>(_onDebugForceReady);

    // Start in ready state
    add(ClientConnected());
  }

  @override
  Future<void> close() async {
    _responseTimer?.cancel();
    await _recorderSubscription?.cancel();
    await _recorder.dispose();
    return super.close();
  }

  void _onClientConnected(
    ClientConnected event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.ready,
      lastError: () => null,
    ));
  }

  void _onClientError(
    ClientError event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.error,
      lastError: () => event.error,
      responseState: ResponseState.idle,
    ));
  }

  void _onStartRecording(
    StartRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) {
    if (!state.canRecord) {
      return;
    }

    // Recorder will emit state changes via stream
    if (state.recorderState.mode == AudioRecorderMode.streaming) {
      _recorder.startStreaming();
      // Simulate VAD after some time
      add(ServerVadSpeechStarted());
    } else {
      _recorder.startRecording();
    }
  }

  void _onStopRecording(
    StopRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) {
    if (!state.recorderState.isActiveCapture) {
      return;
    }

    // Stop recorder - state will be updated via stream
    if (state.recorderState.mode == AudioRecorderMode.streaming) {
      _recorder.stopStreaming();
    } else {
      _recorder.stopRecording();
    }

    // Simulate processing and response
    emit(state.copyWith(
      responseState: ResponseState.responding,
    ));

    // Simulate response after 1 second
    _responseTimer?.cancel();
    _responseTimer = Timer(const Duration(seconds: 1), () {
      _simulateResponse();
    });
  }

  void _simulateResponse() {
    final itemId = 'mock_${DateTime.now().millisecondsSinceEpoch}';

    // Send mock text
    add(ResponseTextReceived(
      itemId: itemId,
      text: 'This is a mock response from the assistant.',
    ));

    // Generate and send mock audio (white noise, 10 seconds at 24kHz)
    final audioData = _generateWhiteNoise(
      durationSeconds: 10,
      sampleRate: 24000,
    );
    add(ResponseAudioReceived(
      itemId: itemId,
      audioData: audioData,
    ));

    // Complete response after audio
    Future.delayed(const Duration(seconds: 10), () {
      add(ResponseCompleted(itemId));
    });
  }

  Uint8List _generateWhiteNoise({
    required int durationSeconds,
    required int sampleRate,
  }) {
    final numSamples = durationSeconds * sampleRate;
    final samples = Int16List(numSamples);

    for (var i = 0; i < numSamples; i++) {
      // Generate random value between -32768 and 32767 (16-bit audio)
      samples[i] = (_random.nextDouble() * 65536 - 32768).round();
    }

    return samples.buffer.asUint8List();
  }

  void _onToggleStreamingMode(
    ToggleStreamingMode event,
    Emitter<AssistantState> emit,
  ) async {
    if (event.enabled) {
      // Switch to streaming mode
      // If currently recording in buffered mode, upgrade to streaming
      if (state.recorderState.status == AudioRecorderStatus.recordingBuffered) {
        await _recorder.stopRecording();
        await _recorder.startStreaming();
      }
      // VAD flag will be updated when recording starts
    } else {
      // Disable streaming mode
      if (state.recorderState.mode == AudioRecorderMode.streaming &&
          state.recorderState.isActiveCapture) {
        await _recorder.stopStreaming();
        emit(state.copyWith(
          streamedSoundContainsVoice: false,
          responseState: ResponseState.responding,
        ));
        _simulateResponse();
      } else {
        emit(state.copyWith(streamedSoundContainsVoice: false));
      }
    }
  }

  void _onInterruptResponse(
    InterruptResponse event,
    Emitter<AssistantState> emit,
  ) {
    if (state.responseState != ResponseState.responding) {
      return;
    }

    emit(state.copyWith(
      responseState: ResponseState.idle,
    ));
  }

  void _onResponseCompleted(
    ResponseCompleted event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      responseState: ResponseState.idle,
    ));
  }

  void _onResponseTextReceived(
    ResponseTextReceived event,
    Emitter<AssistantState> emit,
  ) {
    // Text received, state stays as responding
  }

  void _onResponseAudioReceived(
    ResponseAudioReceived event,
    Emitter<AssistantState> emit,
  ) {
    // Audio received, state stays as responding
  }

  void _onServerVadSpeechStarted(
    ServerVadSpeechStarted event,
    Emitter<AssistantState> emit,
  ) {
    // In streaming mode, simulate VAD detecting speech start after 2 seconds
    if (state.recorderState.mode == AudioRecorderMode.streaming &&
        state.recorderState.isActiveCapture) {
      Future.delayed(const Duration(seconds: 2), () {
        if (!isClosed && state.recorderState.isActiveCapture) {
          add(ServerVadSpeechStopped());
        }
      });
    }
  }

  void _onServerVadSpeechStopped(
    ServerVadSpeechStopped event,
    Emitter<AssistantState> emit,
  ) {
    // VAD detected end of speech - auto-stop recording and get response
    if (state.recorderState.mode == AudioRecorderMode.streaming &&
        state.recorderState.isActiveCapture) {
      add(const StopRecordingUserAudioInput(userRequested: false));
    }
  }

  // Stub handlers for remaining events
  void _onClearRecordedAudio(
    ClearRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    // Emit state without recorded data
    emit(state.copyWith(
      recorderState: state.recorderState.copyWith(
        clearRecordedData: true,
      ),
    ));
  }

  void _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    // Simulate sending buffered audio
    if (state.recorderState.recordedData != null) {
      emit(state.copyWith(
        responseState: ResponseState.responding,
      ));
      _simulateResponse();
    }
  }

  void _onStreamingActivityChanged(
    StreamingActivityChanged event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(streamedSoundContainsVoice: event.isActive));
  }

  void _onUserMessageTranscribed(
    UserMessageTranscribed event,
    Emitter<AssistantState> emit,
  ) {
    // Transcription received, no state change needed
  }

  void _onUpdateRecordingDuration(
    UpdateRecordingDuration event,
    Emitter<AssistantState> emit,
  ) {
    // Mock doesn't track real duration
  }

  // Debug event handlers
  void _onDebugConnect(
    DebugConnect event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.connecting,
    ));
    Future.delayed(const Duration(seconds: 1), () {
      add(ClientConnected());
    });
  }

  void _onDebugConnectionError(
    DebugConnectionError event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.error,
      lastError: () => event.message,
      responseState: ResponseState.idle,
    ));
  }

  void _onDebugNetworkTimeout(
    DebugNetworkTimeout event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.error,
      lastError: () => 'Network timeout',
      responseState: ResponseState.idle,
    ));
  }

  void _onDebugRateLimit(
    DebugRateLimit event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.rateLimited,
      lastError: () => 'Rate limit exceeded',
    ));
  }

  void _onDebugStartResponding(
    DebugStartResponding event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      responseState: ResponseState.responding,
    ));
  }

  void _onDebugFinishResponding(
    DebugFinishResponding event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      responseState: ResponseState.idle,
    ));
  }

  void _onDebugForceReady(
    DebugForceReady event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      clientStatus: ClientStatus.ready,
      responseState: ResponseState.idle,
      lastError: () => null,
    ));
  }

  void _onRecorderStateChanged(
    RecorderStateChanged event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(recorderState: event.recorderState));
  }
}
