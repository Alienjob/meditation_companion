import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/assistant_bloc.dart';
import './bloc/assistant_event.dart';
import './bloc/assistant_state.dart';

class VoiceAssistantWidget extends StatelessWidget {
  const VoiceAssistantWidget({super.key});

  // Define test keys as static constants
  static const Key micButtonKey = Key('voice_assistant_mic_button');
  static const Key stopButtonKey = Key('voice_assistant_stop_button');
  static const Key sendButtonKey = Key('voice_assistant_send_button');
  static const Key deleteButtonKey = Key('voice_assistant_delete_button');
  static const Key interruptButtonKey = Key('voice_assistant_interrupt_button');
  static const Key streamingToggleKey = Key('voice_assistant_stream_toggle');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantBloc, AssistantState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  key: streamingToggleKey,
                  tooltip: state.streamingEnabled
                      ? 'Disable streaming'
                      : 'Enable streaming',
                  icon: Icon(
                    state.streamingEnabled
                        ? Icons.wifi_tethering
                        : Icons.wifi_tethering_off,
                  ),
                  color: state.streamingEnabled ? Colors.deepPurple : null,
                  onPressed: () => context.read<AssistantBloc>().add(
                        ToggleStreamingMode(!state.streamingEnabled),
                      ),
                ),
                if (state.responseState == ResponseState.responding)
                  TextButton(
                    key: interruptButtonKey,
                    onPressed: () => context.read<AssistantBloc>().add(
                          InterruptResponse(),
                        ),
                    child: const Text('Interrupt'),
                  )
                else if (state.userInput == UserInputState.idle &&
                    state.canRecord)
                  IconButton(
                    key: micButtonKey,
                    icon: const Icon(Icons.mic),
                    onPressed: () => context.read<AssistantBloc>().add(
                          StartRecordingUserAudioInput(),
                        ),
                  )
                else if (state.userInput == UserInputState.idle &&
                    !state.canRecord)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                else if (state.userInput == UserInputState.recording)
                  IconButton(
                    key: stopButtonKey,
                    icon: const Icon(Icons.stop),
                    onPressed: () => context.read<AssistantBloc>().add(
                          StopRecordingUserAudioInput(),
                        ),
                  )
                else if (state.userInput == UserInputState.recorded)
                  Row(
                    children: [
                      IconButton(
                        key: sendButtonKey,
                        icon: const Icon(Icons.send),
                        onPressed: () => context.read<AssistantBloc>().add(
                              SendRecordedAudio(),
                            ),
                      ),
                      IconButton(
                        key: deleteButtonKey,
                        icon: const Icon(Icons.delete),
                        onPressed: () => context.read<AssistantBloc>().add(
                              ClearRecordedAudio(),
                            ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
