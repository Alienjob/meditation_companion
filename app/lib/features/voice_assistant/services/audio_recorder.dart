import 'dart:typed_data';

abstract class AudioRecorder {
  Future<void> startRecording();
  Future<Uint8List> stopRecording();
  Future<void> dispose();
}
