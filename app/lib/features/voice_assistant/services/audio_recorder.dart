import 'dart:typed_data';

abstract class AudioRecorder {
  Future<void> startRecording();
  Future<Uint8List> stopRecording();
  Future<void> startStreaming();
  Future<void> stopStreaming();
  Stream<Uint8List> get audioStream;
  Future<void> dispose();
}
