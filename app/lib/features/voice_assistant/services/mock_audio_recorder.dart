import 'dart:async';
import 'dart:typed_data';

import './audio_recorder.dart';

/// Mock implementation of AudioRecorder for testing and development
class MockAudioRecorder implements AudioRecorder {
  bool _isRecording = false;
  bool _isStreaming = false;
  final StreamController<Uint8List> _controller =
      StreamController<Uint8List>.broadcast();
  final StreamController<AudioRecorderState> _stateController =
      StreamController<AudioRecorderState>.broadcast();

  AudioRecorderState _state = AudioRecorderState.idle();

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
    if (_isRecording) {
      throw StateError('Recording already in progress');
    }
    _isRecording = true;
    _emit(_state.copyWith(
      status: AudioRecorderStatus.recordingBuffered,
      mode: AudioRecorderMode.buffered,
      clearMessage: true,
    ));
  }

  @override
  Future<Uint8List> stopRecording() async {
    if (!_isRecording) {
      throw StateError('No recording in progress');
    }
    _isRecording = false;
    _emit(AudioRecorderState.idle());

    // Return mock audio data (empty buffer)
    return Uint8List(0);
  }

  @override
  Future<void> startStreaming() async {
    if (_isStreaming) {
      throw StateError('Streaming already in progress');
    }
    _isStreaming = true;
    _emit(_state.copyWith(
      status: AudioRecorderStatus.streamingActive,
      mode: AudioRecorderMode.streaming,
      clearMessage: true,
    ));
  }

  @override
  Future<void> stopStreaming() async {
    if (!_isStreaming) {
      throw StateError('No streaming in progress');
    }
    _isStreaming = false;
    _emit(AudioRecorderState.idle());
  }

  @override
  Future<void> dispose() async {
    _isRecording = false;
    _isStreaming = false;
    await _controller.close();
    await _stateController.close();
  }
}
