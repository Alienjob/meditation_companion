import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:record/record.dart' as record_pkg;

import 'audio_recorder.dart';

enum _RecorderMode { none, buffered, streaming }

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
              bitRate: kIsWeb ? 384000 : 128000,
              sampleRate: 24000,
              numChannels: 1,
              streamBufferSize: streamBufferSize ?? (kIsWeb ? 4096 : null),
            );

  final record_pkg.AudioRecorder _audioRecorder;
  final record_pkg.RecordConfig _recordConfig;

  StreamSubscription<Uint8List>? _recordingSubscription;
  BytesBuilder? _bytesBuilder;
  Completer<void>? _recordingClosed;
  StreamController<Uint8List>? _streamController;
  _RecorderMode _mode = _RecorderMode.none;

  @override
  Future<void> startRecording() async {
    if (_mode != _RecorderMode.none) {
      throw const AudioRecorderException('Recorder already active');
    }
    _bytesBuilder = BytesBuilder(copy: false);
    await _startCapture(_RecorderMode.buffered);
  }

  @override
  Future<Uint8List> stopRecording() async {
    if (_mode != _RecorderMode.buffered) {
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
  Future<void> startStreaming() async {
    if (_mode != _RecorderMode.none) {
      throw const AudioRecorderException('Recorder already active');
    }
    _ensureStreamController();
    debugPrint('RealAudioRecorder: startStreaming()');
    await _startCapture(_RecorderMode.streaming);
  }

  @override
  Future<void> stopStreaming() async {
    if (_mode != _RecorderMode.streaming) {
      throw const AudioRecorderException('Recorder is not currently running');
    }

    final completer = _recordingClosed;
    final subscription = _recordingSubscription;

    try {
      debugPrint('RealAudioRecorder: stopStreaming()');
      final stopResult = _audioRecorder.stop();
      if (completer != null) {
        await completer.future;
      }
      await stopResult;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to stop streaming: $error'),
        stackTrace,
      );
    } finally {
      await subscription?.cancel();
      _recordingSubscription = null;
      _resetBuffer();
    }
  }

  @override
  Stream<Uint8List> get audioStream {
    return _ensureStreamController().stream;
  }

  @override
  Future<void> dispose() async {
    await _recordingSubscription?.cancel();
    _resetBuffer();
    await _streamController?.close();
    await _audioRecorder.dispose();
  }

  void _resetBuffer() {
    _bytesBuilder = null;
    _recordingClosed = null;
    _mode = _RecorderMode.none;
  }

  StreamController<Uint8List> _ensureStreamController() {
    return _streamController ??=
        StreamController<Uint8List>.broadcast(sync: true);
  }

  Future<void> _startCapture(_RecorderMode mode) async {
    if (await _audioRecorder.isRecording()) {
      throw const AudioRecorderException('Recorder already active');
    }

    if (!await _audioRecorder.hasPermission()) {
      throw const AudioRecorderException('Microphone permission not granted');
    }

    try {
      final stream = await _audioRecorder.startStream(_recordConfig);

      _mode = mode;
      _recordingClosed = Completer<void>();
      debugPrint(
          'RealAudioRecorder: recorder.startStream resolved (mode=$mode)');

      _recordingSubscription = stream.listen(
        (chunk) {
          switch (_mode) {
            case _RecorderMode.buffered:
              final builder = _bytesBuilder;
              if (builder == null) return;
              builder.add(chunk);
              break;
            case _RecorderMode.streaming:
              final controller = _streamController;
              if (controller != null && !controller.isClosed) {
                // debugPrint(
                // 'RealAudioRecorder: streaming chunk size=${chunk.length}');
                controller.add(chunk);
              }
              break;
            case _RecorderMode.none:
              break;
          }
        },
        cancelOnError: true,
        onError: (error, stackTrace) {
          debugPrint('RealAudioRecorder: stream error $error');
          if (_recordingClosed?.isCompleted ?? true) return;
          _recordingClosed?.completeError(error, stackTrace);
        },
        onDone: () {
          debugPrint('RealAudioRecorder: stream done (mode=$_mode)');
          if (!(_recordingClosed?.isCompleted ?? true)) {
            _recordingClosed?.complete();
          }
        },
      );
    } catch (error, stackTrace) {
      debugPrint('RealAudioRecorder: failed to start capture $error');
      await _audioRecorder.cancel();
      _resetBuffer();
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to start recording: $error'),
        stackTrace,
      );
    }
  }
}

class AudioRecorderException implements Exception {
  const AudioRecorderException(this.message);

  final String message;

  @override
  String toString() => 'AudioRecorderException: $message';
}
