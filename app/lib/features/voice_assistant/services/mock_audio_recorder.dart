import 'dart:typed_data';
import './audio_recorder.dart';

/// Mock implementation of AudioRecorder for testing and development
class MockAudioRecorder implements AudioRecorder {
  bool _isRecording = false;

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
  Future<void> dispose() async {
    _isRecording = false;
  }
}
