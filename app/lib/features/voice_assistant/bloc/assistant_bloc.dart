import 'dart:async';
import 'dart:math';
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

  final Set<String> _responsesWithAudio = <String>{};
  String? _activeResponseItemId;

  Timer? _recordingTimer;
  StreamSubscription<Uint8List>? _micStreamSubscription;
  StreamSubscription<AudioRecorderState>? _recorderStateSubscription;
  Completer<void>? _recordingStartCompleter;
  bool _isStartingRecording = false;
  bool _shuttingDownStream = false;
  bool _hasStreamingAudio = false;

  static const _domain = 'Voice Assistant';
  static const _featureRecording = 'AssistantBloc Recording';
  static const _featureStreaming = 'AssistantBloc Streaming';
  static const _featureMode = 'AssistantBloc Mode';
  static const _featureResponse = 'AssistantBloc Response';
  static const _featurePlayback = 'AssistantBloc Playback';

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

  void _error(
    String feature,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    logError(
      message,
      domain: _domain,
      feature: feature,
      error: error,
      stackTrace: stackTrace,
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
        super(AssistantState()) {
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
    on<StreamingActivityChanged>(_onStreamingActivityChanged);
    on<RecorderStateChanged>(_onRecorderStateChanged);

    // Subscribe to recorder state changes
    _recorderStateSubscription = _recorder.stateStream.listen((recorderState) {
      add(RecorderStateChanged(recorderState));
    });
  }

  Future<void> _beginStreamingCapture() async {
    _debug(_featureStreaming, 'Beginning streaming capture');
    final stream = _recorder.audioStream;
    await _recorder.startStreaming();
    _hasStreamingAudio = false;
    _debug(_featureStreaming,
        'Recorder.startStreaming() completed, subscribing to audioStream');
    await _micStreamSubscription?.cancel();
    _shuttingDownStream = false;
    _micStreamSubscription = stream.listen(
      (chunk) {
        if (chunk.isEmpty) return;
        _hasStreamingAudio = true;
        add(const StreamingActivityChanged.active());
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
      onDone: () {
        _debug(
          _featureStreaming,
          'Streaming recorder onDone (shuttingDown=$_shuttingDownStream)',
        );
        add(const StreamingActivityChanged.inactive());
        if (!_shuttingDownStream &&
            state.recorderState.mode == AudioRecorderMode.streaming) {
          add(const StopRecordingUserAudioInput(userRequested: false));
        }
      },
    );
    _debug(_featureStreaming, 'Audio stream subscription active');
  }

  Future<void> _stopStreamingCapture() async {
    _shuttingDownStream = true;
    await _micStreamSubscription?.cancel();
    _micStreamSubscription = null;
    await _recorder.stopStreaming();
    add(const StreamingActivityChanged.inactive());
  }

  Future<void> _restartStreaming() async {
    _debug(
        _featureStreaming, 'Restarting streaming after auto-stop (delay 50ms)');
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      await _beginStreamingCapture();
      _debug(_featureStreaming, 'Streaming restarted successfully');
    } catch (error, stackTrace) {
      _error(
        _featureStreaming,
        'Failed to restart streaming: $error',
        error: error,
        stackTrace: stackTrace,
      );
      add(ClientError('Failed to restart streaming: $error'));
    }
  }

  Future<void> _sendBufferedAudioAsStream(Uint8List audioData) async {
    const chunkSize = 4096;
    final totalLength = audioData.length;
    var offset = 0;

    while (offset < totalLength) {
      final remaining = totalLength - offset;
      final length = min(chunkSize, remaining);
      final chunk = Uint8List.view(
          audioData.buffer, audioData.offsetInBytes + offset, length);
      await _client.appendInputAudio(chunk);
      offset += length;
    }
    _hasStreamingAudio = true;
  }

  Future<void> _commitPendingAudioBuffer() async {
    final pending = _client.inputAudioBuffer;
    if (pending.isEmpty) return;
    await _client.realtime.send(
      RealtimeEvent.inputAudioBufferCommit(
        eventId: 'manual-commit-${DateTime.now().microsecondsSinceEpoch}',
      ),
    );
    _client.conversation.queueInputAudio(pending);
    _client.inputAudioBuffer = Uint8List(0);
    _hasStreamingAudio = false;
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
        streamedSoundContainsVoice: false,
      ));
      return;
    }

    // Recorder state will be updated via stateStream
    emit(state.copyWith(
      streamedSoundContainsVoice: false,
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
      'Start recording requested; mode=${state.recorderState.mode} canRecord=${state.canRecord}',
    );
    if (!state.canRecord) {
      _debug(
        _featureRecording,
        'Start recording ignored because canRecord=false',
      );
      return;
    }

    if (_isStartingRecording) {
      _debug(
        _featureRecording,
        'Start recording ignored because another start is in progress',
      );
      return;
    }

    _isStartingRecording = true;
    final startCompleter = Completer<void>();
    _recordingStartCompleter = startCompleter;

    try {
      if (state.recorderState.mode == AudioRecorderMode.streaming) {
        _debug(_featureStreaming, 'Starting streaming recorder');
        await _beginStreamingCapture();
      } else {
        _debug(_featureRecording, 'Starting buffered recorder');
        await _recorder.startRecording();
      }
      // Recorder will emit state change via stateStream
      emit(state.copyWith(
        streamedSoundContainsVoice: false,
      ));

      _recordingTimer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) {
          add(const UpdateRecordingDuration());
        },
      );

      if (!startCompleter.isCompleted) {
        startCompleter.complete();
      }
    } catch (error, stackTrace) {
      if (!startCompleter.isCompleted) {
        startCompleter.complete();
      }
      _error(
        _featureRecording,
        'Failed to start recorder: $error',
        error: error,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => error.toString(),
        streamedSoundContainsVoice: false,
      ));
    } finally {
      if (!startCompleter.isCompleted) {
        startCompleter.complete();
      }
      if (identical(_recordingStartCompleter, startCompleter)) {
        _recordingStartCompleter = null;
      }
      _isStartingRecording = false;
    }
  }

  Future<void> _onStopRecording(
    StopRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) async {
    _recordingTimer?.cancel();
    _recordingTimer = null;

    if (!state.recorderState.isActiveCapture) return;

    try {
      if (state.recorderState.mode == AudioRecorderMode.streaming) {
        final shouldRestart =
            state.recorderState.mode == AudioRecorderMode.streaming &&
                !event.userRequested;

        if (event.userRequested) {
          _debug(_featureStreaming,
              'User requested stop - calling _stopStreamingCapture()');
          await _stopStreamingCapture();
        } else {
          _debug(_featureStreaming,
              'Auto-stop (VAD/onDone) - canceling subscription only, keeping recorder alive');
          await _micStreamSubscription?.cancel();
          _micStreamSubscription = null;
        }

        _debug(_featureStreaming, 'Streaming recorder stop handled');
        _debug(_featureResponse, 'Requesting response after streaming');

        final hasBufferedAudio = _hasStreamingAudio ||
            _client.inputAudioBuffer.isNotEmpty ||
            state.recorderState.recordedData != null;

        // Recorder will emit state change via stateStream
        emit(state.copyWith(
          streamedSoundContainsVoice: false,
          responseState:
              hasBufferedAudio ? ResponseState.responding : state.responseState,
        ));
        if (hasBufferedAudio) {
          await _commitPendingAudioBuffer();
          await _client.createResponse();
          _hasStreamingAudio = false;
        }
        if (shouldRestart) {
          unawaited(_restartStreaming());
        }
      } else {
        _debug(_featureRecording, 'Stopping buffered recorder');
        final audioData = await _recorder.stopRecording();
        // Recorder will emit state change via stateStream
        // Send audio data directly without storing in state
        await _sendBufferedAudioAsStream(audioData);
        emit(state.copyWith(
          responseState: ResponseState.responding,
        ));
        await _commitPendingAudioBuffer();
        await _client.createResponse();
      }
    } catch (error, stackTrace) {
      _error(
        state.recorderState.mode == AudioRecorderMode.streaming
            ? _featureStreaming
            : _featureRecording,
        'Failed to stop recorder: $error',
        error: error,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => error.toString(),
        responseState: ResponseState.idle,
        streamedSoundContainsVoice: false,
      ));
      if (state.recorderState.mode == AudioRecorderMode.streaming &&
          !event.userRequested) {
        unawaited(_restartStreaming());
      }
    }
  }

  void _onUpdateRecordingDuration(
    UpdateRecordingDuration event,
    Emitter<AssistantState> emit,
  ) {
    // Only update if still recording
    if (!state.recorderState.isActiveCapture) return;

    final newDuration =
        (state.recorderState.recordingDuration ?? Duration.zero) +
            const Duration(milliseconds: 100);

    if (newDuration >= AssistantState.maxRecordingDuration) {
      add(StopRecordingUserAudioInput());
    }
    // Duration is tracked by recorder, no need to emit here
  }

  void _onRecorderStateChanged(
    RecorderStateChanged event,
    Emitter<AssistantState> emit,
  ) {
    final recorderState = event.recorderState;

    _debug(
      _featureRecording,
      'Recorder state changed: status=${recorderState.status} mode=${recorderState.mode} duration=${recorderState.recordingDuration}',
    );

    emit(state.copyWith(recorderState: recorderState));

    // Business rules based on recorder state
    if (recorderState.recordingDuration != null &&
        recorderState.recordingDuration! >=
            AssistantState.maxRecordingDuration) {
      _debug(
          _featureRecording, 'Max recording duration reached, auto-stopping');
      add(StopRecordingUserAudioInput());
    }

    if (recorderState.status == AudioRecorderStatus.error) {
      _error(
        _featureRecording,
        'Recorder error: ${recorderState.message ?? "unknown"}',
      );
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => recorderState.message ?? 'Recorder error',
      ));
    }
  }

  void _onClearRecording(
    ClearRecordedAudio event,
    Emitter<AssistantState> emit,
  ) {
    // Recorder state will be updated via stateStream
    // No need to emit here
  }

  Future<void> _onToggleStreamingMode(
    ToggleStreamingMode event,
    Emitter<AssistantState> emit,
  ) async {
    _info(_featureMode, 'Streaming mode set to ${event.enabled}');

    if (event.enabled) {
      final pendingStart = _recordingStartCompleter;
      if (pendingStart != null) {
        try {
          await pendingStart.future;
        } catch (_) {
          // Игнорируем: старт уже завершился с ошибкой.
        }
      }

      final recorderState = _recorder.currentState;
      final bufferedActive =
          recorderState.status == AudioRecorderStatus.recordingBuffered ||
              recorderState.status == AudioRecorderStatus.preparingBuffered ||
              recorderState.status == AudioRecorderStatus.finalizingBuffered;

      final upgradingDuringHold =
          state.recorderState.mode != AudioRecorderMode.streaming &&
              (state.recorderState.isActiveCapture ||
                  _isStartingRecording ||
                  bufferedActive);

      if (upgradingDuringHold) {
        await _upgradeRecordingToStreaming(emit);
        return;
      }

      // Mode will be set when starting streaming recorder
      // No need to emit here
      return;
    }

    if (state.streamedSoundContainsVoice) {
      await _stopStreamingCapture();
    }

    final wasRecording = state.recorderState.isActiveCapture;

    if (state.recorderState.mode == AudioRecorderMode.streaming &&
        wasRecording) {
      // Recorder state will be updated via stateStream
      emit(state.copyWith(
        streamedSoundContainsVoice: false,
        responseState: ResponseState.responding,
      ));
      await _commitPendingAudioBuffer();
      await _client.createResponse();
      return;
    }

    emit(state.copyWith(streamedSoundContainsVoice: false));
  }

  void _onServerVadSpeechStarted(
    ServerVadSpeechStarted event,
    Emitter<AssistantState> emit,
  ) {
    _debug(_featureStreaming, 'Server VAD detected speech start');
    if (!state.streamedSoundContainsVoice) {
      emit(state.copyWith(streamedSoundContainsVoice: true));
    }
  }

  void _onServerVadSpeechStopped(
    ServerVadSpeechStopped event,
    Emitter<AssistantState> emit,
  ) {
    _debug(_featureStreaming, 'Server VAD detected speech stop');
    if (state.recorderState.mode == AudioRecorderMode.streaming &&
        state.recorderState.isActiveCapture) {
      _debug(
        _featureStreaming,
        'Server VAD segment ended; committing buffered audio while keeping stream alive',
      );
      emit(state.copyWith(
        responseState: ResponseState.responding,
        streamedSoundContainsVoice: false,
      ));
      unawaited(() async {
        try {
          await _commitPendingAudioBuffer();
          await _client.createResponse();
        } catch (error, stackTrace) {
          _error(
            _featureStreaming,
            'Failed to commit streaming segment: $error',
            error: error,
            stackTrace: stackTrace,
          );
          add(ClientError(error.toString()));
        }
      }());
    }
  }

  Future<void> _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) async {
    _debug(
      _featureResponse,
      'Sending recorded audio: ${state.recorderState.recordedData?.length} bytes',
    );
    if (!state.canSendRecording) return;

    try {
      final audioData = state.recorderState.recordedData!;
      await _sendBufferedAudioAsStream(audioData);

      // Recorder state will be updated via stateStream
      emit(state.copyWith(
        responseState: ResponseState.responding,
      ));

      await _commitPendingAudioBuffer();
      await _client.createResponse();
    } catch (error, stackTrace) {
      _error(
        _featureResponse,
        'Failed to send buffered audio: $error',
        error: error,
        stackTrace: stackTrace,
      );
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
        lastError: () => error.toString(),
        responseState: ResponseState.idle,
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
    final timestamp = DateTime.now().toIso8601String();
    _debug(
      _featurePlayback,
      '[$timestamp] Received audio chunk: item=${event.itemId} bytes=${event.audioData.length}',
    );

    _positionTracker.addChunk(event.itemId, event.audioData.length);
    await _audioService.appendVoiceChunk(event.itemId, event.audioData);

    if (event.audioData.isNotEmpty) {
      _responsesWithAudio.add(event.itemId);
      _activeResponseItemId = event.itemId;
    }

    if (state.responseState != ResponseState.responding) {
      emit(state.copyWith(responseState: ResponseState.responding));
    }
  }

  Future<void> _onResponseAudioStreamEnded(
    ResponseAudioStreamEnded event,
    Emitter<AssistantState> emit,
  ) async {
    final timestamp = DateTime.now().toIso8601String();
    _debug(
      _featurePlayback,
      '[$timestamp] Audio stream ended marker received: item=${event.itemId}',
    );

    await _audioService.appendVoiceChunk(event.itemId, Uint8List(0));
  }

  Future<void> _onInterruptResponse(
    InterruptResponse event,
    Emitter<AssistantState> emit,
  ) async {
    if (state.responseState != ResponseState.responding) return;

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final result = _positionTracker.getInterruptionState(timestamp);

    _debug(
      _featurePlayback,
      '[${DateTime.now().toIso8601String()}] Interrupt requested at sample=${result.sampleCount} for item=${result.itemId}',
    );

    await _audioService.stopVoice();
    if (result.itemId.isEmpty) {
      _debug(
        _featurePlayback,
        '[${DateTime.now().toIso8601String()}] No active response item to cancel; skipping cancelResponse',
      );
    } else {
      await _client.cancelResponse(result.itemId, result.sampleCount);
    }

    if (_activeResponseItemId != null) {
      _responsesWithAudio.remove(_activeResponseItemId!);
      _activeResponseItemId = null;
    }

    emit(state.copyWith(responseState: ResponseState.idle));
    _positionTracker.reset();
  }

  void _onResponseCompleted(
    ResponseCompleted event,
    Emitter<AssistantState> emit,
  ) {
    final timestamp = DateTime.now().toIso8601String();
    final hadAudio = _responsesWithAudio.remove(event.itemId);
    final activeMatch = _activeResponseItemId == event.itemId;

    _debug(
      _featurePlayback,
      '[$timestamp] Response completed: item=${event.itemId} hadAudio=$hadAudio activeMatch=$activeMatch',
    );

    if (!hadAudio) {
      _debug(
        _featurePlayback,
        '[$timestamp] No audio associated with response; stopping voice playback explicitly.',
      );
      unawaited(_audioService.stopVoice());
    }

    if (activeMatch) {
      _activeResponseItemId = null;
    }

    emit(state.copyWith(responseState: ResponseState.idle));
    _positionTracker.reset();
  }

  @override
  Future<void> close() async {
    _recordingTimer?.cancel();
    await _micStreamSubscription?.cancel();
    await _recorderStateSubscription?.cancel();
    await super.close();
  }

  void _onStreamingActivityChanged(
    StreamingActivityChanged event,
    Emitter<AssistantState> emit,
  ) {
    if (event.isActive && !state.streamedSoundContainsVoice) {
      _debug(
        _featureStreaming,
        'Streaming activity detected; marking active',
      );
      emit(state.copyWith(streamedSoundContainsVoice: true));
    } else if (!event.isActive && state.streamedSoundContainsVoice) {
      _debug(
        _featureStreaming,
        'Streaming inactivity reported; marking inactive',
      );
      emit(state.copyWith(streamedSoundContainsVoice: false));
    }
  }
}
