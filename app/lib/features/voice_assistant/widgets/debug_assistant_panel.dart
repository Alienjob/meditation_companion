import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/mock_assistant_bloc.dart';
import '../bloc/assistant_event.dart';
import '../bloc/assistant_state.dart';
import '../bloc/debug_assistant_event.dart';

/// Debug panel for manually controlling assistant state
///
/// Only visible in debug mode. Provides buttons to simulate various
/// assistant conditions like errors, rate limits, and state transitions.
class DebugAssistantPanel extends StatelessWidget {
  const DebugAssistantPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MockAssistantBloc(),
      child: BlocBuilder<MockAssistantBloc, AssistantState>(
        builder: (context, state) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.bug_report, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Debug Assistant Panel',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildStatusRow(context, state),
                  const SizedBox(height: 12),
                  const Text('Client Status:', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _buildButton(
                        context,
                        'Ready',
                        Colors.green,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugForceReady()),
                      ),
                      _buildButton(
                        context,
                        'Connecting',
                        Colors.blue,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugConnect()),
                      ),
                      _buildButton(
                        context,
                        'Error',
                        Colors.red,
                        () => context.read<MockAssistantBloc>().add(
                              const DebugConnectionError(
                                  'Debug connection error'),
                            ),
                      ),
                      _buildButton(
                        context,
                        'Timeout',
                        Colors.orange,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugNetworkTimeout()),
                      ),
                      _buildButton(
                        context,
                        'Rate Limit',
                        Colors.amber,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugRateLimit()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('User Input:', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _buildButton(
                        context,
                        'Start Recording',
                        Colors.red,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(StartRecordingUserAudioInput()),
                      ),
                      _buildButton(
                        context,
                        'Stop Recording',
                        Colors.deepOrange,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(const StopRecordingUserAudioInput()),
                      ),
                      _buildButton(
                        context,
                        'Send Buffered',
                        Colors.indigo,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(SendRecordedAudio()),
                      ),
                      _buildButton(
                        context,
                        'Clear Audio',
                        Colors.grey,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(ClearRecordedAudio()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Streaming & VAD:', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _buildButton(
                        context,
                        state.streamingDesired ? 'Streaming ON' : 'Streaming OFF',
                        state.streamingDesired ? Colors.deepPurple : Colors.blueGrey,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(ToggleStreamingMode(!state.streamingDesired)),
                      ),
                      _buildButton(
                        context,
                        'VAD Speech Start',
                        Colors.cyan,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(ServerVadSpeechStarted()),
                      ),
                      _buildButton(
                        context,
                        'VAD Speech Stop',
                        Colors.lightBlue,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(ServerVadSpeechStopped()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Response:', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: [
                      _buildButton(
                        context,
                        'Start Responding',
                        Colors.purple,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugStartResponding()),
                      ),
                      _buildButton(
                        context,
                        'Finish Response',
                        Colors.teal,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(DebugFinishResponding()),
                      ),
                      _buildButton(
                        context,
                        'Interrupt',
                        Colors.pink,
                        () => context
                            .read<MockAssistantBloc>()
                            .add(InterruptResponse()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatusRow(BuildContext context, AssistantState state) {
    final statusColor = _getStatusColor(state);
    final statusText = _getStatusText(state);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: statusColor, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getStatusIcon(state),
            size: 16,
            color: statusColor,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              statusText,
              style: TextStyle(
                fontSize: 12,
                color: statusColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      child: Text(label),
    );
  }

  Color _getStatusColor(AssistantState state) {
    if (state.clientStatus == ClientStatus.error) return Colors.red;
    if (state.clientStatus == ClientStatus.rateLimited) return Colors.amber;
    if (state.clientStatus == ClientStatus.connecting) return Colors.blue;
    if (state.responseState == ResponseState.responding) return Colors.purple;
    if (state.userInput == UserInputState.recording) return Colors.orange;
    return Colors.green;
  }

  IconData _getStatusIcon(AssistantState state) {
    if (state.clientStatus == ClientStatus.error) return Icons.error;
    if (state.clientStatus == ClientStatus.rateLimited) return Icons.block;
    if (state.clientStatus == ClientStatus.connecting) {
      return Icons.sync;
    }
    if (state.responseState == ResponseState.responding) {
      return Icons.chat_bubble;
    }
    if (state.userInput == UserInputState.recording) return Icons.mic;
    return Icons.check_circle;
  }

  String _getStatusText(AssistantState state) {
    if (state.lastError != null) {
      return 'Error: ${state.lastError}';
    }
    if (state.clientStatus == ClientStatus.rateLimited) {
      return 'Rate Limited';
    }
    if (state.clientStatus == ClientStatus.connecting) {
      return 'Connecting...';
    }
    if (state.responseState == ResponseState.responding) {
      return 'Responding...';
    }
    if (state.userInput == UserInputState.recording) {
      if (state.streamingDesired) {
        return 'Recording (Streaming)';
      }
      return 'Recording (Buffered)';
    }
    if (state.clientStatus == ClientStatus.ready) {
      return 'Ready';
    }
    return 'Unknown';
  }
}
