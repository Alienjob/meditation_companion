import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../meditation/services/audio_service.dart';
import '../chat/bloc/chat_bloc.dart';
import '../chat/repository/chat_repository.dart';
import '../chat/views/chat_widget.dart';
import './bloc/assistant_bloc.dart';
import './bloc/assistant_event.dart';
import './bloc/assistant_state.dart';
import './services/mock_audio_recorder.dart';

class VoiceAssistantWidget extends StatelessWidget {
  const VoiceAssistantWidget({super.key});

  // Define test keys as static constants
  static const Key micButtonKey = Key('voice_assistant_mic_button');
  static const Key stopButtonKey = Key('voice_assistant_stop_button');
  static const Key sendButtonKey = Key('voice_assistant_send_button');
  static const Key deleteButtonKey = Key('voice_assistant_delete_button');
  static const Key interruptButtonKey = Key('voice_assistant_interrupt_button');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantBloc, AssistantState>(
      builder: (context, state) {
        return Column(
          children: [
            // Show interrupt button when responding (takes priority)
            if (state.responseState == ResponseState.responding) ...[
              TextButton(
                key: interruptButtonKey,
                onPressed: () => context.read<AssistantBloc>().add(
                      InterruptResponse(),
                    ),
                child: const Text('Interrupt'),
              ),
            ]
            // Only show other buttons when NOT responding
            else ...[
              if (state.userInput == UserInputState.idle &&
                  state.canRecord) ...[
                IconButton(
                  key: micButtonKey,
                  icon: const Icon(Icons.mic),
                  onPressed: () => context.read<AssistantBloc>().add(
                        StartRecordingUserAudioInput(),
                      ),
                ),
              ],
              if (state.userInput == UserInputState.idle &&
                  !state.canRecord) ...[
                CircularProgressIndicator(),
              ],
              if (state.userInput == UserInputState.recording) ...[
                IconButton(
                  key: stopButtonKey,
                  icon: const Icon(Icons.stop),
                  onPressed: () => context.read<AssistantBloc>().add(
                        StopRecordingUserAudioInput(),
                      ),
                ),
              ],
              if (state.userInput == UserInputState.recorded) ...[
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
            ],
          ],
        );
      },
    );
  }
}
