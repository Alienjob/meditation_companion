import 'package:flutter/material.dart';
import '../../services/mock_audio_recorder.dart';
import 'global_mic_slider.dart';

/// Demo widget that uses MockAudioRecorder to simulate mic button states
///
/// This is a prototype implementation that doesn't connect to real
/// AI services. It uses MockAudioRecorder with delays to simulate state
/// transitions for UI development and testing purposes.
///
/// In production, this should be replaced with a wrapper that connects
/// to real AssistantBloc and production AudioRecorder.
class SimpleMicDemo extends StatefulWidget {
  const SimpleMicDemo({super.key});

  @override
  State<SimpleMicDemo> createState() => _SimpleMicDemoState();
}

class _SimpleMicDemoState extends State<SimpleMicDemo> {
  late final MockAudioRecorder _recorder;

  @override
  void initState() {
    super.initState();
    _recorder = MockAudioRecorder(
      stateTransitionDelay: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalMicSlider(
      stateStream: _recorder.stateStream,
      initialState: _recorder.currentState,
      onTurnOnRecording: _recorder.startRecording,
      onTurnOffRecording: () async {
        await _recorder.stopRecording();
      },
      onTurnOnStreaming: _recorder.startStreaming,
      onTurnOffStreaming: _recorder.stopStreaming,
      onRetry: () {
        // Reset handled by recorder returning to idle
      },
    );
  }
}
