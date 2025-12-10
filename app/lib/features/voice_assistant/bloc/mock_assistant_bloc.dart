import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
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

  MockAssistantBloc() : super(const AssistantState()) {
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
  Future<void> close() {
    _responseTimer?.cancel();
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
      userInput: UserInputState.idle,
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

    emit(state.copyWith(
      userInput: UserInputState.recording,
      recordingDuration: Duration.zero,
    ));

    // In streaming mode, simulate VAD after some time
    if (state.streamingDesired) {
      add(ServerVadSpeechStarted());
    }
  }

  void _onStopRecording(
    StopRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) {
    if (state.userInput != UserInputState.recording) {
      return;
    }

    // Simulate processing and response
    emit(state.copyWith(
      userInput: UserInputState.idle,
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
  ) {
    emit(state.copyWith(
      streamingDesired: event.enabled,
      streamingActive:
          event.enabled && state.userInput == UserInputState.recording,
    ));
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
    if (state.streamingDesired && state.userInput == UserInputState.recording) {
      Future.delayed(const Duration(seconds: 2), () {
        if (!isClosed && state.userInput == UserInputState.recording) {
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
    if (state.streamingDesired && state.userInput == UserInputState.recording) {
      add(const StopRecordingUserAudioInput(userRequested: false));
    }
  }

  // Stub handlers for remaining events
  void _onClearRecordedAudio(
    ClearRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(
      userInput: UserInputState.idle,
      recordedAudio: () => null,
    ));
  }

  void _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    // Simulate sending buffered audio
    if (state.userInput == UserInputState.recorded) {
      emit(state.copyWith(
        userInput: UserInputState.idle,
        responseState: ResponseState.responding,
      ));
      _simulateResponse();
    }
  }

  void _onStreamingActivityChanged(
    StreamingActivityChanged event,
    Emitter<AssistantState> emit,
  ) {
    emit(state.copyWith(streamingActive: event.isActive));
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
      userInput: UserInputState.idle,
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
      userInput: UserInputState.idle,
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
      userInput: UserInputState.idle,
      responseState: ResponseState.idle,
      lastError: () => null,
    ));
  }
}
