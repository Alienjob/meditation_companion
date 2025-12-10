import 'dart:async';

import 'package:flutter/material.dart';
import '../../services/audio_recorder.dart';
import 'global_mic_slider.dart';

/// Demo widget that simulates mic button states with mock data
///
/// This is a prototype implementation that doesn't connect to real
/// audio recording or AI services. It uses timers to simulate state
/// transitions for UI development and testing purposes.
///
/// In production, this should be replaced with a wrapper that connects
/// to real AssistantBloc and AudioRecorder services.
class SimpleMicDemo extends StatefulWidget {
  const SimpleMicDemo({super.key});

  @override
  State<SimpleMicDemo> createState() => _SimpleMicDemoState();
}

class _SimpleMicDemoState extends State<SimpleMicDemo> {
  late final StreamController<AudioRecorderState> _stateController;
  final List<Timer> _pendingTimers = [];
  Timer? _streamingErrorTimer;
  AudioRecorderState _currentState = AudioRecorderState.idle();

  @override
  void initState() {
    super.initState();
    _stateController = StreamController<AudioRecorderState>.broadcast();
    _emit(_currentState);
  }

  @override
  void dispose() {
    _cancelAllTimers();
    _streamingErrorTimer?.cancel();
    _stateController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalMicSlider(
      stateStream: _stateController.stream,
      initialState: _currentState,
      onTurnOnRecording: _handleStartRecording,
      onTurnOffRecording: _handleStopRecording,
      onTurnOnStreaming: _handleStartStreaming,
      onTurnOffStreaming: _handleStopStreaming,
      onRetry: _handleRetry,
    );
  }

  void _handleStartRecording() {
    _cancelAllTimers();
    _streamingErrorTimer?.cancel();

    _emit(
      AudioRecorderState(
        status: AudioRecorderStatus.preparingBuffered,
        mode: AudioRecorderMode.buffered,
      ),
    );

    _schedule(const Duration(seconds: 2), () {
      _emit(
        AudioRecorderState(
          status: AudioRecorderStatus.recordingBuffered,
          mode: AudioRecorderMode.buffered,
        ),
      );
    });
  }

  void _handleStopRecording() {
    _cancelAllTimers();

    _emit(
      AudioRecorderState(
        status: AudioRecorderStatus.finalizingBuffered,
        mode: AudioRecorderMode.buffered,
      ),
    );

    _schedule(const Duration(seconds: 2), _emitIdle);
  }

  void _handleStartStreaming() {
    _cancelAllTimers();
    _streamingErrorTimer?.cancel();

    _emit(
      AudioRecorderState(
        status: AudioRecorderStatus.preparingStreaming,
        mode: AudioRecorderMode.streaming,
      ),
    );

    _schedule(const Duration(seconds: 2), () {
      _emit(
        AudioRecorderState(
          status: AudioRecorderStatus.streamingActive,
          mode: AudioRecorderMode.streaming,
        ),
      );
      _startStreamingErrorCountdown();
    });
  }

  void _handleStopStreaming() {
    _cancelAllTimers();
    _streamingErrorTimer?.cancel();

    final status = _currentState.status == AudioRecorderStatus.streamingActive
        ? AudioRecorderStatus.finalizingStreaming
        : AudioRecorderStatus.idle;

    if (status == AudioRecorderStatus.finalizingStreaming) {
      _emit(
        AudioRecorderState(
          status: status,
          mode: AudioRecorderMode.streaming,
        ),
      );
      _schedule(const Duration(seconds: 2), _emitIdle);
    } else {
      _emitIdle();
    }
  }

  void _handleRetry() {
    _cancelAllTimers();
    _streamingErrorTimer?.cancel();
    _emitIdle();
  }

  void _startStreamingErrorCountdown() {
    _streamingErrorTimer?.cancel();
    _streamingErrorTimer = Timer(const Duration(seconds: 10), () {
      _emit(
        AudioRecorderState(
          status: AudioRecorderStatus.error,
          mode: AudioRecorderMode.none,
          message: 'Streaming interrupted',
        ),
      );
    });
  }

  void _schedule(Duration delay, VoidCallback action) {
    final timer = Timer(delay, action);
    _pendingTimers.add(timer);
  }

  void _emit(AudioRecorderState state) {
    _currentState = state;
    _stateController.add(state);
  }

  void _emitIdle() {
    _emit(AudioRecorderState.idle());
  }

  void _cancelAllTimers() {
    for (final timer in _pendingTimers) {
      timer.cancel();
    }
    _pendingTimers.clear();
  }
}
