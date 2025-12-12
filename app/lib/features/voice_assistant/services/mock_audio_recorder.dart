import 'dart:async';
import 'dart:typed_data';

import 'package:meditation_companion/core/logging/app_logger.dart';

import './audio_recorder.dart';

/// Mock implementation of AudioRecorder for testing and development
class MockAudioRecorder implements AudioRecorder {
  MockAudioRecorder({
    Duration? stateTransitionDelay,
  }) : _stateTransitionDelay = stateTransitionDelay;

  final Duration? _stateTransitionDelay;
  bool _isRecording = false;
  bool _isStreaming = false;
  final StreamController<Uint8List> _controller =
      StreamController<Uint8List>.broadcast();
  final StreamController<AudioRecorderState> _stateController =
      StreamController<AudioRecorderState>.broadcast();

  AudioRecorderState _state = AudioRecorderState.idle();

  Stopwatch? _recordingStopwatch;
  Timer? _durationUpdateTimer;

  void _emit(AudioRecorderState state) {
    _state = state;
    if (!_stateController.isClosed) {
      _stateController.add(state);
    }
  }

  @override
  AudioRecorderState get currentState => _state;

  @override
  Stream<AudioRecorderState> get stateStream => _stateController.stream;

  @override
  Stream<Uint8List> get audioStream => _controller.stream;

  @override
  Future<void> startRecording() async {
    logDebug('startRecording called',
        domain: 'Voice Assistant', feature: 'MockAudioRecorder');
    if (_isRecording) {
      throw StateError('Recording already in progress');
    }
    _isRecording = true;

    _emit(_state.copyWith(
      status: AudioRecorderStatus.preparingBuffered,
      mode: AudioRecorderMode.buffered,
      clearMessage: true,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    if (_isRecording) {
      _recordingStopwatch = Stopwatch()..start();
      _startDurationUpdates();
      _emit(_state.copyWith(
        status: AudioRecorderStatus.recordingBuffered,
        mode: AudioRecorderMode.buffered,
        recordingDuration: Duration.zero,
      ));
    }
  }

  @override
  Future<Uint8List> stopRecording() async {
    logDebug('stopRecording called',
        domain: 'Voice Assistant', feature: 'MockAudioRecorder');
    if (!_isRecording) {
      throw StateError('No recording in progress');
    }

    final finalDuration = _recordingStopwatch?.elapsed;
    _stopDurationUpdates();
    _isRecording = false;

    // Return mock audio data (empty buffer)
    final mockData = Uint8List(0);

    // Emit finalizingBuffered state with recorded data
    _emit(AudioRecorderState(
      status: AudioRecorderStatus.finalizingBuffered,
      mode: AudioRecorderMode.buffered,
      recordedData: mockData,
      recordingDuration: finalDuration,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    _emit(AudioRecorderState.idle());
    return mockData;
  }

  @override
  Future<void> startStreaming() async {
    if (_isStreaming) {
      throw StateError('Streaming already in progress');
    }
    _isStreaming = true;

    _emit(_state.copyWith(
      status: AudioRecorderStatus.preparingStreaming,
      mode: AudioRecorderMode.streaming,
      clearMessage: true,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    if (_isStreaming) {
      _recordingStopwatch = Stopwatch()..start();
      _startDurationUpdates();
      _emit(_state.copyWith(
        status: AudioRecorderStatus.streamingActive,
        mode: AudioRecorderMode.streaming,
        recordingDuration: Duration.zero,
      ));
    }
  }

  @override
  Future<void> stopStreaming() async {
    if (!_isStreaming) {
      throw StateError('No streaming in progress');
    }

    _emit(_state.copyWith(
      status: AudioRecorderStatus.finalizingStreaming,
      mode: AudioRecorderMode.streaming,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    _stopDurationUpdates();
    _isStreaming = false;
    _emit(AudioRecorderState.idle());
  }

  /// Pause streaming temporarily without going to idle
  /// Used when assistant is responding but stream should resume after
  Future<void> pauseStreaming() async {
    if (!_isStreaming) {
      throw StateError('No streaming in progress');
    }

    _emit(_state.copyWith(
      status: AudioRecorderStatus.finalizingStreaming,
      mode: AudioRecorderMode.streaming,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    // Keep _isStreaming = true, pause duration updates but preserve stopwatch
    _pauseDurationUpdates();
  }

  /// Resume streaming after pause
  Future<void> resumeStreaming() async {
    if (!_isStreaming) {
      throw StateError('No streaming to resume');
    }

    _emit(_state.copyWith(
      status: AudioRecorderStatus.preparingStreaming,
      mode: AudioRecorderMode.streaming,
    ));

    if (_stateTransitionDelay != null) {
      await Future.delayed(_stateTransitionDelay!);
    }

    if (_isStreaming) {
      // Resume or restart stopwatch
      if (_recordingStopwatch == null) {
        _recordingStopwatch = Stopwatch()..start();
      } else {
        _recordingStopwatch!.start();
      }
      _startDurationUpdates();
      _emit(_state.copyWith(
        status: AudioRecorderStatus.streamingActive,
        mode: AudioRecorderMode.streaming,
        recordingDuration: _recordingStopwatch!.elapsed,
      ));
    }
  }

  void _startDurationUpdates() {
    _durationUpdateTimer?.cancel();
    _durationUpdateTimer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) {
        final stopwatch = _recordingStopwatch;
        if (stopwatch != null && stopwatch.isRunning) {
          _emit(_state.copyWith(recordingDuration: stopwatch.elapsed));
        }
      },
    );
  }

  /// Pause duration updates temporarily, preserving stopwatch for continuation
  void _pauseDurationUpdates() {
    _durationUpdateTimer?.cancel();
    _durationUpdateTimer = null;
    _recordingStopwatch?.stop();
    // Keep _recordingStopwatch to continue from same position on resume
  }

  /// Stop duration updates completely and reset stopwatch
  void _stopDurationUpdates() {
    _durationUpdateTimer?.cancel();
    _durationUpdateTimer = null;
    _recordingStopwatch?.stop();
    _recordingStopwatch = null;
  }

  @override
  Future<void> dispose() async {
    _isRecording = false;
    _isStreaming = false;
    _stopDurationUpdates();
    await _controller.close();
    await _stateController.close();
  }
}
