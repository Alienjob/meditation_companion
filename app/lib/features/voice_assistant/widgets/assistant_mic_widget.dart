import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/assistant_event.dart';
import '../bloc/assistant_state.dart';
import '../services/audio_recorder.dart';
import 'mic_button/global_mic_slider.dart';

/// Widget that connects GlobalMicSlider to AssistantBloc (production or mock)
///
/// This widget acts as a coordinator between the UI (GlobalMicSlider)
/// and the business logic (AssistantBloc or MockAssistantBloc). It translates
/// slider callbacks into AssistantEvent events and passes recorder state to the slider.
///
/// Works with both AssistantBloc and MockAssistantBloc through their common
/// Bloc<AssistantEvent, AssistantState> interface.
///
/// Usage:
/// ```dart
/// AssistantMicWidget() // Expects Bloc<AssistantEvent, AssistantState> and AudioRecorder in context
/// ```
class AssistantMicWidget extends StatelessWidget {
  const AssistantMicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final recorder = context.read<AudioRecorder>();
    // Read bloc through common interface - works for both Mock and Production
    final bloc = context.read<Bloc<AssistantEvent, AssistantState>>();

    return GlobalMicSlider(
      stateStream: recorder.stateStream,
      initialState: recorder.currentState,
      onTurnOnRecording: () {
        bloc.add(StartRecordingUserAudioInput());
      },
      onTurnOffRecording: () {
        bloc.add(const StopRecordingUserAudioInput());
      },
      onTurnOnStreaming: () {
        bloc.add(const ToggleStreamingMode(true));
      },
      onTurnOffStreaming: () {
        bloc.add(const ToggleStreamingMode(false));
      },
      onRetry: () {
        // Retry by clearing error state and reconnecting if needed
        // The recorder will automatically return to idle on error,
        // so user can try again
      },
    );
  }
}
