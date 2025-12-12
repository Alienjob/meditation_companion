import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/assistant_event.dart';
import '../bloc/assistant_state.dart';
import '../bloc/debug_assistant_event.dart';
import '../services/audio_recorder.dart';

/// Debug panel for manually controlling assistant state
///
/// Only visible in debug mode. Provides buttons to simulate various
/// assistant conditions like errors, rate limits, and state transitions.
class DebugAssistantPanel extends StatelessWidget {
  const DebugAssistantPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Bloc<AssistantEvent, AssistantState>, AssistantState>(
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
                _buildStateInfo(context, state),
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
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugForceReady()),
                    ),
                    _buildButton(
                      context,
                      'Connecting',
                      Colors.blue,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugConnect()),
                    ),
                    _buildButton(
                      context,
                      'Error',
                      Colors.red,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(
                            const DebugConnectionError(
                                'Debug connection error'),
                          ),
                    ),
                    _buildButton(
                      context,
                      'Timeout',
                      Colors.orange,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugNetworkTimeout()),
                    ),
                    _buildButton(
                      context,
                      'Rate Limit',
                      Colors.amber,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugRateLimit()),
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
                      state.recorderState.mode == AudioRecorderMode.streaming
                          ? 'Streaming ON'
                          : 'Streaming OFF',
                      state.recorderState.mode == AudioRecorderMode.streaming
                          ? Colors.deepPurple
                          : Colors.blueGrey,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(ToggleStreamingMode(state.recorderState.mode !=
                              AudioRecorderMode.streaming)),
                    ),
                    _buildButton(
                      context,
                      'VAD Speech Start',
                      Colors.cyan,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(ServerVadSpeechStarted()),
                    ),
                    _buildButton(
                      context,
                      'VAD Speech Stop',
                      Colors.lightBlue,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
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
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugStartResponding()),
                    ),
                    _buildButton(
                      context,
                      'Finish Response',
                      Colors.teal,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(DebugFinishResponding()),
                    ),
                    _buildButton(
                      context,
                      'Interrupt',
                      Colors.pink,
                      () => context
                          .read<Bloc<AssistantEvent, AssistantState>>()
                          .add(InterruptResponse()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
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
    if (state.recorderState.isActiveCapture) return Colors.orange;
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
    if (state.recorderState.isActiveCapture) return Icons.mic;
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
    if (state.recorderState.isActiveCapture) {
      if (state.recorderState.mode == AudioRecorderMode.streaming) {
        return 'Recording (Streaming)';
      }
      return 'Recording (Buffered)';
    }
    if (state.clientStatus == ClientStatus.ready) {
      return 'Ready';
    }
    return 'Unknown';
  }

  Widget _buildStateInfo(BuildContext context, AssistantState state) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Recorder Status',
              state.recorderState.status.toString().split('.').last),
          _buildInfoRow('Recorder Mode',
              state.recorderState.mode.toString().split('.').last),
          if (state.recorderState.recordingDuration != null)
            _buildInfoRow('Recording Duration',
                '${state.recorderState.recordingDuration!.inMilliseconds}ms'),
          _buildInfoRow('VAD Speech Detected',
              state.streamedSoundContainsVoice.toString()),
          _buildInfoRow(
              'Response State', state.responseState.toString().split('.').last),
          if (state.lastError != null)
            _buildInfoRow('Error', state.lastError!, isError: true),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: isError ? Colors.red : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
