import 'dart:typed_data';

enum AudioRecorderMode { none, buffered, streaming }

enum AudioRecorderStatus {
  idle,
  preparingBuffered,
  recordingBuffered,
  finalizingBuffered,
  preparingStreaming,
  streamingActive,
  finalizingStreaming,
  error,
}

class AudioRecorderState {
  AudioRecorderState({
    required this.status,
    required this.mode,
    this.message,
    this.recordingDuration,
    this.recordedData,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  AudioRecorderState.idle()
      : status = AudioRecorderStatus.idle,
        mode = AudioRecorderMode.none,
        message = null,
        recordingDuration = null,
        recordedData = null,
        timestamp = DateTime.now();

  final AudioRecorderStatus status;
  final AudioRecorderMode mode;
  final String? message;
  final Duration? recordingDuration;
  final Uint8List? recordedData;
  final DateTime timestamp;

  bool get isBusy =>
      status != AudioRecorderStatus.idle && status != AudioRecorderStatus.error;

  bool get isActiveCapture =>
      status == AudioRecorderStatus.recordingBuffered ||
      status == AudioRecorderStatus.streamingActive;

  AudioRecorderState copyWith({
    AudioRecorderStatus? status,
    AudioRecorderMode? mode,
    String? message,
    bool clearMessage = false,
    Duration? recordingDuration,
    bool clearDuration = false,
    Uint8List? recordedData,
    bool clearRecordedData = false,
  }) {
    return AudioRecorderState(
      status: status ?? this.status,
      mode: mode ?? this.mode,
      message: clearMessage ? null : (message ?? this.message),
      recordingDuration:
          clearDuration ? null : (recordingDuration ?? this.recordingDuration),
      recordedData:
          clearRecordedData ? null : (recordedData ?? this.recordedData),
      timestamp: DateTime.now(),
    );
  }
}

abstract class AudioRecorder {
  AudioRecorderState get currentState;
  Stream<AudioRecorderState> get stateStream;

  Future<void> startRecording();
  Future<Uint8List> stopRecording();
  Future<void> startStreaming();
  Future<void> stopStreaming();
  Future<void> pauseStreaming();
  Future<void> resumeStreaming();
  Stream<Uint8List> get audioStream;
  Future<void> dispose();
}

class AudioRecorderException implements Exception {
  const AudioRecorderException(this.message);

  final String message;

  @override
  String toString() => 'AudioRecorderException: $message';
}
