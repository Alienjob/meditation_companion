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

class VoiceAssistantWidget extends StatefulWidget {
  const VoiceAssistantWidget({super.key});

  @override
  State<VoiceAssistantWidget> createState() => _VoiceAssistantWidgetState();
}

class _VoiceAssistantWidgetState extends State<VoiceAssistantWidget> {
  late final RealtimeClient _client;
  late final ChatBloc _chatBloc;
  late final AssistantBloc _assistantBloc;
  late final AudioService _audioService;
  late final MockAudioRecorder _recorder;

  @override
  void initState() {
    super.initState();

    _client = RealtimeClient(
      apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
      dangerouslyAllowAPIKeyInBrowser: true,
    );

    _audioService = context.read<AudioService>();
    _recorder = MockAudioRecorder();
    final chatRepository = context.read<IChatRepository>();
    _chatBloc = ChatBloc(chatRepository);

    _assistantBloc = AssistantBloc(
      chatBloc: _chatBloc,
      audioService: _audioService,
      recorder: _recorder,
      client: _client,
    );

    _setupAssistant();
  }

  Future<void> _setupAssistant() async {
    await _client.updateSession(
      instructions: 'You are a friendly meditation assistant.',
      voice: Voice.alloy,
    );

    await _client.connect();
    _assistantBloc.add(ClientConnected());
  }

  @override
  void dispose() {
    _assistantBloc.close();
    _chatBloc.close();
    _recorder.dispose();
    _client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: _chatBloc),
            BlocProvider.value(value: _assistantBloc),
          ],
          child: Column(
            children: [
              Expanded(
                child: ChatWidget(),
              ),
              _buildControls(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildControls() {
    return BlocBuilder<AssistantBloc, AssistantState>(
      builder: (context, state) {
        if (state.userInput == UserInputState.recording) {
          return _buildRecordingControls(context, state);
        }

        if (state.userInput == UserInputState.recorded) {
          return _buildSendControls(context);
        }

        if (state.responseState == ResponseState.responding) {
          return _buildInterruptControls(context);
        }

        return _buildMicButton(context, state);
      },
    );
  }

  Widget _buildRecordingControls(BuildContext context, AssistantState state) {
    final progress = state.recordingDuration.inMilliseconds /
        AssistantState.maxRecordingDuration.inMilliseconds;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: progress),
          const SizedBox(width: 16),
          Text('${state.recordingDuration.inSeconds}s'),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.stop),
            onPressed: () => context
                .read<AssistantBloc>()
                .add(StopRecordingUserAudioInput()),
          ),
        ],
      ),
    );
  }

  Widget _buildSendControls(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () =>
                context.read<AssistantBloc>().add(SendRecordedAudio()),
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () =>
                context.read<AssistantBloc>().add(ClearRecordedAudio()),
          ),
        ],
      ),
    );
  }

  Widget _buildInterruptControls(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.pan_tool),
        label: const Text('Interrupt'),
        onPressed: () => context.read<AssistantBloc>().add(InterruptResponse()),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _buildMicButton(BuildContext context, AssistantState state) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IconButton(
        icon: const Icon(Icons.mic),
        onPressed: state.canRecord
            ? () => context
                .read<AssistantBloc>()
                .add(StartRecordingUserAudioInput())
            : null,
        iconSize: 48,
      ),
    );
  }
}
