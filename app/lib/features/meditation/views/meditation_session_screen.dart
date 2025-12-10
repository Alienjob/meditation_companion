import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import '../../voice_assistant/services/audio_recorder.dart';
import '../widgets/chat_assistant_widget.dart';
import '../widgets/chat_bottom_sheet_widget.dart';
import '../widgets/ambient_sounds_bottom_sheet_widget.dart';
import '../widgets/ambient_sounds_panel.dart';
import '../../voice_assistant/widgets/global_mic_slider.dart';

class MeditationSessionScreen extends StatelessWidget {
  const MeditationSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeditationBloc, MeditationState>(
      listener: (context, state) {
        // Handle any notifications or side effects here
      },
      builder: (context, _) {
        final isWideScreen = MediaQuery.of(context).size.width > 800;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Meditation Session'),
            actions: [
              if (!isWideScreen)
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () => ChatBottomSheetWidget.show(context),
                ),
              IconButton(
                icon: const Icon(Icons.music_note),
                tooltip: 'Ambient sounds',
                onPressed: () => AmbientSoundsBottomSheetWidget.show(context),
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Sign out',
                onPressed: () =>
                    context.read<AuthBloc>().add(SignOutRequested()),
              ),
            ],
          ),
          body: isWideScreen
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(
                      flex: 1,
                      child: _MicSurface(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ChatAssistantWidget(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _AmbientPanelSurface(),
                    ),
                  ],
                )
              : const _MicSurface(),
          floatingActionButton: !isWideScreen
              ? FloatingActionButton(
                  onPressed: () => ChatBottomSheetWidget.show(context),
                  child: const Icon(Icons.chat),
                )
              : null,
        );
      },
    );
  }
}

class _MicSurface extends StatelessWidget {
  const _MicSurface();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            _SimpleMicDemo(),
          ],
        ),
      ),
    );
  }
}

class _SimpleMicDemo extends StatefulWidget {
  const _SimpleMicDemo();

  @override
  State<_SimpleMicDemo> createState() => _SimpleMicDemoState();
}

class _SimpleMicDemoState extends State<_SimpleMicDemo> {
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

class _AmbientPanelSurface extends StatelessWidget {
  const _AmbientPanelSurface();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: const AmbientSoundsPanel(),
        ),
      ),
    );
  }
}
