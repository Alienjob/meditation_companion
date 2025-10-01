import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:record/record.dart' as record_pkg;

import 'audio_recorder.dart';

/// Concrete [AudioRecorder] that captures microphone input using the
/// `record` plugin and returns the raw bytes of the recorded file.
class RealAudioRecorder implements AudioRecorder {
  RealAudioRecorder({
    record_pkg.AudioRecorder? audioRecorder,
    record_pkg.RecordConfig? recordConfig,
    int? streamBufferSize,
  })  : _audioRecorder = audioRecorder ?? record_pkg.AudioRecorder(),
        _recordConfig = recordConfig ??
            record_pkg.RecordConfig(
              encoder: kIsWeb
                  ? record_pkg.AudioEncoder.pcm16bits
                  : record_pkg.AudioEncoder.aacLc,
              bitRate: kIsWeb ? 705600 : 128000,
              sampleRate: kIsWeb ? 44100 : 44100,
              numChannels: 1,
              streamBufferSize: streamBufferSize ?? (kIsWeb ? 4096 : null),
            );

  final record_pkg.AudioRecorder _audioRecorder;
  final record_pkg.RecordConfig _recordConfig;

  StreamSubscription<Uint8List>? _recordingSubscription;
  BytesBuilder? _bytesBuilder;
  Completer<void>? _recordingClosed;

  @override
  Future<void> startRecording() async {
    if (await _audioRecorder.isRecording()) {
      return;
    }

    if (!await _audioRecorder.hasPermission()) {
      throw const AudioRecorderException('Microphone permission not granted');
    }

    try {
      final stream = await _audioRecorder.startStream(
        _recordConfig,
      );

      _bytesBuilder = BytesBuilder(copy: false);
      _recordingClosed = Completer<void>();

      _recordingSubscription = stream.listen(
        (chunk) {
          final builder = _bytesBuilder;
          if (builder == null) return;
          builder.add(chunk);
        },
        cancelOnError: true,
        onError: (error, stackTrace) {
          if (_recordingClosed?.isCompleted ?? true) return;
          _recordingClosed?.completeError(error, stackTrace);
        },
        onDone: () {
          if (!(_recordingClosed?.isCompleted ?? true)) {
            _recordingClosed?.complete();
          }
        },
      );
    } catch (error, stackTrace) {
      await _audioRecorder.cancel();
      _resetBuffer();
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to start recording: $error'),
        stackTrace,
      );
    }
  }

  @override
  Future<Uint8List> stopRecording() async {
    if (!await _audioRecorder.isRecording()) {
      throw const AudioRecorderException('Recorder is not currently running');
    }

    final completer = _recordingClosed;
    final subscription = _recordingSubscription;

    try {
      final stopResult = _audioRecorder.stop();
      if (completer != null) {
        await completer.future;
      }
      await stopResult;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to stop recording: $error'),
        stackTrace,
      );
    } finally {
      await subscription?.cancel();
      _recordingSubscription = null;
    }

    final builder = _bytesBuilder;
    _resetBuffer();

    if (builder == null) {
      throw const AudioRecorderException('No audio data was captured');
    }

    final data = builder.takeBytes();
    if (data.isEmpty) {
      throw const AudioRecorderException('Recorded audio was empty');
    }

    return data;
  }

  @override
  Future<void> dispose() async {
    await _recordingSubscription?.cancel();
    _resetBuffer();
    await _audioRecorder.dispose();
  }

  void _resetBuffer() {
    _bytesBuilder = null;
    _recordingClosed = null;
  }
}

class AudioRecorderException implements Exception {
  const AudioRecorderException(this.message);

  final String message;

  @override
  String toString() => 'AudioRecorderException: $message';
}
