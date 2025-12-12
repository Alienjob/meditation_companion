import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:record/record.dart' as record_pkg;

import 'audio_recorder.dart';

const _recorderDomain = 'Voice Assistant';
const _recorderFeature = 'Audio Recorder';

void _recorderDebug(String message) {
  logDebug(
    message,
    domain: _recorderDomain,
    feature: _recorderFeature,
    context: RealAudioRecorder,
  );
}

void _recorderError(String message, {Object? error, StackTrace? stackTrace}) {
  logError(
    message,
    domain: _recorderDomain,
    feature: _recorderFeature,
    error: error,
    stackTrace: stackTrace,
    context: RealAudioRecorder,
  );
}

/// Concrete [AudioRecorder] that captures microphone input using the
/// `record` plugin and returns raw bytes or stream chunks.
class RealAudioRecorder implements AudioRecorder {
  RealAudioRecorder({
    record_pkg.AudioRecorder? audioRecorder,
    record_pkg.RecordConfig? bufferedRecordConfig,
    record_pkg.RecordConfig? streamingRecordConfig,
    int? streamBufferSize,
  })  : _audioRecorder = audioRecorder ?? record_pkg.AudioRecorder(),
        _bufferedRecordConfig = bufferedRecordConfig ??
            record_pkg.RecordConfig(
              encoder: record_pkg.AudioEncoder.pcm16bits,
              bitRate: 384000,
              sampleRate: 24000,
              numChannels: 1,
              streamBufferSize: streamBufferSize ?? 4096,
            ),
        _streamingRecordConfig = streamingRecordConfig ??
            record_pkg.RecordConfig(
              // The record plugin only supports PCM output when streaming on iOS,
              // so default to a raw PCM encoder to avoid runtime failures.
              encoder: record_pkg.AudioEncoder.pcm16bits,
              bitRate: 384000,
              sampleRate: 24000,
              numChannels: 1,
              streamBufferSize: streamBufferSize ?? 4096,
            );

  final record_pkg.AudioRecorder _audioRecorder;
  final record_pkg.RecordConfig _bufferedRecordConfig;
  final record_pkg.RecordConfig _streamingRecordConfig;

  final _stateController =
      StreamController<AudioRecorderState>.broadcast(sync: true);
  AudioRecorderState _state = AudioRecorderState.idle();
  final bool _useFileBuffer = !kIsWeb;

  StreamSubscription<Uint8List>? _recordingSubscription;
  Completer<void>? _recordingClosed;
  StreamController<Uint8List>? _streamController;
  AudioRecorderMode _activeMode = AudioRecorderMode.none;
  String? _currentRecordingPath;
  BytesBuilder? _bytesBuilder;

  Stopwatch? _recordingStopwatch;
  DateTime? _lastDurationUpdate;

  @override
  AudioRecorderState get currentState => _state;

  @override
  Stream<AudioRecorderState> get stateStream => _stateController.stream;

  @override
  Future<void> startRecording() async {
    if (_activeMode != AudioRecorderMode.none) {
      throw const AudioRecorderException('Recorder already active');
    }

    _emitState(
      _state.copyWith(
        status: AudioRecorderStatus.preparingBuffered,
        mode: AudioRecorderMode.buffered,
        clearMessage: true,
      ),
    );

    if (_useFileBuffer) {
      await _startBufferedCaptureFile();
    } else {
      _bytesBuilder = BytesBuilder(copy: false);
      await _startBufferedCaptureStream();
    }
  }

  @override
  Future<Uint8List> stopRecording() async {
    if (_activeMode != AudioRecorderMode.buffered) {
      throw const AudioRecorderException('Recorder is not currently running');
    }

    final completer = _recordingClosed;
    final subscription = _recordingSubscription;

    try {
      _emitState(
        _state.copyWith(status: AudioRecorderStatus.finalizingBuffered),
      );
      final stopResult = _audioRecorder.stop();
      if (completer != null) {
        await completer.future;
      }
      Uint8List data;

      if (_useFileBuffer) {
        final recordedPath = await stopResult ?? _currentRecordingPath;
        _activeMode = AudioRecorderMode.none;

        if (recordedPath == null || recordedPath.isEmpty) {
          throw const AudioRecorderException('No audio data was captured');
        }

        final file = File(recordedPath);
        if (!await file.exists()) {
          throw AudioRecorderException(
            'Recorded file not found at $recordedPath',
          );
        }

        final rawData = await file.readAsBytes();
        if (rawData.isEmpty) {
          throw const AudioRecorderException('Recorded audio was empty');
        }

        data = _extractPcmBytes(rawData);
        unawaited(file.delete());
      } else {
        _activeMode = AudioRecorderMode.none;
        final builder = _bytesBuilder;
        if (builder == null) {
          throw const AudioRecorderException('No audio data was captured');
        }
        data = builder.takeBytes();
        if (data.isEmpty) {
          throw const AudioRecorderException('Recorded audio was empty');
        }
      }

      final finalDuration = _recordingStopwatch?.elapsed;
      _recordingStopwatch?.stop();
      _recordingStopwatch = null;
      _lastDurationUpdate = null;

      // Emit state with recorded data before transitioning to idle
      _emitState(
        AudioRecorderState(
          status: AudioRecorderStatus.finalizingBuffered,
          mode: AudioRecorderMode.buffered,
          recordedData: data,
          recordingDuration: finalDuration,
        ),
      );

      _emitState(AudioRecorderState.idle());
      _resetBuffer();
      return data;
    } catch (error, stackTrace) {
      _emitError('Failed to stop recording: $error');
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to stop recording: $error'),
        stackTrace,
      );
    } finally {
      await subscription?.cancel();
      _recordingSubscription = null;
    }
  }

  @override
  Future<void> startStreaming() async {
    if (_activeMode != AudioRecorderMode.none) {
      throw const AudioRecorderException('Recorder already active');
    }

    _ensureStreamController();
    _recorderDebug('RealAudioRecorder: startStreaming()');
    _emitState(
      _state.copyWith(
        status: AudioRecorderStatus.preparingStreaming,
        mode: AudioRecorderMode.streaming,
        clearMessage: true,
      ),
    );

    await _startStreamingCapture();
  }

  @override
  Future<void> stopStreaming() async {
    if (_activeMode != AudioRecorderMode.streaming) {
      throw const AudioRecorderException('Recorder is not currently running');
    }

    final completer = _recordingClosed;
    final subscription = _recordingSubscription;

    try {
      _recorderDebug('RealAudioRecorder: stopStreaming()');
      _emitState(
        _state.copyWith(status: AudioRecorderStatus.finalizingStreaming),
      );
      final stopResult = _audioRecorder.stop();
      if (completer != null) {
        await completer.future;
      }
      await stopResult;
    } catch (error, stackTrace) {
      _emitError('Failed to stop streaming: $error');
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to stop streaming: $error'),
        stackTrace,
      );
    } finally {
      await subscription?.cancel();
      _recordingSubscription = null;
      _recordingStopwatch?.stop();
      _recordingStopwatch = null;
      _lastDurationUpdate = null;
      _resetBuffer();
    }

    _emitState(AudioRecorderState.idle());
  }

  @override
  Stream<Uint8List> get audioStream {
    return _ensureStreamController().stream;
  }

  @override
  Future<void> pauseStreaming() async {
    // Not implemented in real recorder
    // This method is only used in mock for testing
    _recorderDebug('pauseStreaming() not implemented in RealAudioRecorder');
  }

  @override
  Future<void> resumeStreaming() async {
    // Not implemented in real recorder
    // This method is only used in mock for testing
    _recorderDebug('resumeStreaming() not implemented in RealAudioRecorder');
  }

  @override
  Future<void> dispose() async {
    await _recordingSubscription?.cancel();
    _resetBuffer();
    await _streamController?.close();
    await _audioRecorder.dispose();
    if (!_stateController.isClosed) {
      await _stateController.close();
    }
  }

  void _resetBuffer() {
    _recordingClosed = null;
    _activeMode = AudioRecorderMode.none;
    _currentRecordingPath = null;
    _bytesBuilder = null;
  }

  StreamController<Uint8List> _ensureStreamController() {
    return _streamController ??=
        StreamController<Uint8List>.broadcast(sync: true);
  }

  Future<void> _startBufferedCaptureFile() async {
    if (!await _audioRecorder.hasPermission()) {
      throw const AudioRecorderException('Microphone permission not granted');
    }

    try {
      final directory = Directory.systemTemp;
      final fileName =
          'voice_assistant_${DateTime.now().microsecondsSinceEpoch}.wav';
      final targetPath = '${directory.path}/$fileName';
      _currentRecordingPath = targetPath;

      await _audioRecorder.start(
        _bufferedRecordConfig,
        path: targetPath,
      );
      _activeMode = AudioRecorderMode.buffered;
      _recordingStopwatch = Stopwatch()..start();
      _lastDurationUpdate = DateTime.now();
      _emitState(
        _state.copyWith(
          status: AudioRecorderStatus.recordingBuffered,
          mode: AudioRecorderMode.buffered,
          recordingDuration: Duration.zero,
        ),
      );
    } catch (error, stackTrace) {
      _recorderError(
        'RealAudioRecorder: failed to start buffered capture $error',
        error: error,
        stackTrace: stackTrace,
      );
      await _audioRecorder.cancel();
      _emitError('Failed to start recording: $error');
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to start recording: $error'),
        stackTrace,
      );
    }
  }

  Future<void> _startBufferedCaptureStream() async {
    if (await _audioRecorder.isRecording()) {
      throw const AudioRecorderException('Recorder already active');
    }

    if (!await _audioRecorder.hasPermission()) {
      throw const AudioRecorderException('Microphone permission not granted');
    }

    try {
      final stream = await _audioRecorder.startStream(_bufferedRecordConfig);

      _activeMode = AudioRecorderMode.buffered;
      _recordingClosed = Completer<void>();
      _recordingStopwatch = Stopwatch()..start();
      _lastDurationUpdate = DateTime.now();
      _recorderDebug(
        'RealAudioRecorder: buffered recorder startStream resolved',
      );

      _recordingSubscription = stream.listen(
        (chunk) {
          final builder = _bytesBuilder;
          if (builder == null) return;
          builder.add(chunk);
          _updateRecordingDuration();
        },
        cancelOnError: true,
        onError: (error, stackTrace) {
          _recorderError(
            'RealAudioRecorder: buffered stream error $error',
            error: error,
            stackTrace: stackTrace,
          );
          if (_recordingClosed?.isCompleted ?? true) return;
          _recordingClosed?.completeError(error, stackTrace);
          _emitError('Recorder stream error: $error');
        },
        onDone: () {
          _recorderDebug('RealAudioRecorder: buffered stream done');
          if (!(_recordingClosed?.isCompleted ?? true)) {
            _recordingClosed?.complete();
          }
        },
      );

      _emitState(
        _state.copyWith(
          status: AudioRecorderStatus.recordingBuffered,
          mode: AudioRecorderMode.buffered,
          recordingDuration: Duration.zero,
        ),
      );
    } catch (error, stackTrace) {
      _recorderError(
        'RealAudioRecorder: failed to start capture $error',
        error: error,
        stackTrace: stackTrace,
      );
      await _audioRecorder.cancel();
      _resetBuffer();
      _emitError('Failed to start recording: $error');
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to start recording: $error'),
        stackTrace,
      );
    }
  }

  Future<void> _startStreamingCapture() async {
    if (await _audioRecorder.isRecording()) {
      throw const AudioRecorderException('Recorder already active');
    }

    if (!await _audioRecorder.hasPermission()) {
      throw const AudioRecorderException('Microphone permission not granted');
    }

    try {
      final stream = await _audioRecorder.startStream(_streamingRecordConfig);

      _activeMode = AudioRecorderMode.streaming;
      _recordingClosed = Completer<void>();
      _recordingStopwatch = Stopwatch()..start();
      _lastDurationUpdate = DateTime.now();
      _recorderDebug(
        'RealAudioRecorder: recorder.startStream resolved (mode=$_activeMode)',
      );

      _recordingSubscription = stream.listen(
        (chunk) {
          final controller = _streamController;
          if (controller != null && !controller.isClosed) {
            controller.add(chunk);
          }
          _updateRecordingDuration();
        },
        cancelOnError: true,
        onError: (error, stackTrace) {
          _recorderError(
            'RealAudioRecorder: stream error $error',
            error: error,
            stackTrace: stackTrace,
          );
          if (_recordingClosed?.isCompleted ?? true) return;
          _recordingClosed?.completeError(error, stackTrace);
          _emitError('Recorder stream error: $error');
        },
        onDone: () {
          _recorderDebug('RealAudioRecorder: stream done (mode=$_activeMode)');
          if (!(_recordingClosed?.isCompleted ?? true)) {
            _recordingClosed?.complete();
          }
        },
      );

      _emitState(
        _state.copyWith(
          status: AudioRecorderStatus.streamingActive,
          mode: AudioRecorderMode.streaming,
          recordingDuration: Duration.zero,
        ),
      );
    } catch (error, stackTrace) {
      _recorderError(
        'RealAudioRecorder: failed to start capture $error',
        error: error,
        stackTrace: stackTrace,
      );
      await _audioRecorder.cancel();
      _resetBuffer();
      _emitError('Failed to start recording: $error');
      Error.throwWithStackTrace(
        AudioRecorderException('Failed to start recording: $error'),
        stackTrace,
      );
    }
  }

  void _updateRecordingDuration() {
    final stopwatch = _recordingStopwatch;
    final lastUpdate = _lastDurationUpdate;
    if (stopwatch == null || lastUpdate == null) return;

    final now = DateTime.now();
    final timeSinceLastUpdate = now.difference(lastUpdate);

    // Throttle updates to once per 100ms
    if (timeSinceLastUpdate.inMilliseconds < 100) return;

    _lastDurationUpdate = now;
    final elapsed = stopwatch.elapsed;

    if (_activeMode != AudioRecorderMode.none) {
      _emitState(_state.copyWith(recordingDuration: elapsed));
    }
  }

  void _emitState(AudioRecorderState state) {
    _state = state;
    if (!_stateController.isClosed) {
      _stateController.add(state);
    }
  }

  void _emitError(String message) {
    _emitState(
      AudioRecorderState(
        status: AudioRecorderStatus.error,
        mode: AudioRecorderMode.none,
        message: message,
      ),
    );
  }

  Uint8List _extractPcmBytes(Uint8List data) {
    const minimumHeaderLength = 44;
    if (data.length <= minimumHeaderLength) {
      return data;
    }

    final isRiff = data[0] == 0x52 &&
        data[1] == 0x49 &&
        data[2] == 0x46 &&
        data[3] == 0x46;
    final isWave = data[8] == 0x57 &&
        data[9] == 0x41 &&
        data[10] == 0x56 &&
        data[11] == 0x45;

    if (!isRiff || !isWave) {
      return data;
    }

    // Standard PCM WAV header is 44 bytes; skip it to return raw PCM samples.
    return Uint8List.fromList(data.sublist(minimumHeaderLength));
  }
}
