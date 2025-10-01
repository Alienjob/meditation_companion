import 'dart:async';
import 'dart:typed_data';

import './audio_recorder.dart';

/// Mock implementation of AudioRecorder for testing and development
class MockAudioRecorder implements AudioRecorder {
  bool _isRecording = false;
  bool _isStreaming = false;
  final StreamController<Uint8List> _controller =
      StreamController<Uint8List>.broadcast();

  @override
  Stream<Uint8List> get audioStream => _controller.stream;

  @override
  Future<void> startRecording() async {
    if (_isRecording) {
      throw StateError('Recording already in progress');
    }
    _isRecording = true;
  }

  @override
  Future<Uint8List> stopRecording() async {
    if (!_isRecording) {
      throw StateError('No recording in progress');
    }
    _isRecording = false;

    // Return mock audio data (empty buffer)
    return Uint8List(0);
  }

  @override
  Future<void> startStreaming() async {
    if (_isStreaming) {
      throw StateError('Streaming already in progress');
    }
    _isStreaming = true;
  }

  @override
  Future<void> stopStreaming() async {
    if (!_isStreaming) {
      throw StateError('No streaming in progress');
    }
    _isStreaming = false;
  }

  @override
  Future<void> dispose() async {
    _isRecording = false;
    _isStreaming = false;
    await _controller.close();
  }
}
