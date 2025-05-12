import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../chat/bloc/chat_bloc.dart';
import '../chat/bloc/chat_event.dart';
import '../chat/views/chat_widget.dart';
import 'repository/voice_assistant_repository.dart';

class VoiceAssistantWidget extends StatefulWidget {
  const VoiceAssistantWidget({super.key});

  @override
  State<VoiceAssistantWidget> createState() => _VoiceAssistantWidgetState();
}

class _VoiceAssistantWidgetState extends State<VoiceAssistantWidget> {
  late final RealtimeClient _client;
  late final VoiceAssistantRepository _repository;
  late final ChatBloc _chatBloc;

  @override
  void initState() {
    super.initState();
    _client = RealtimeClient(
      apiKey: EnvConfig.openApiKey,
      dangerouslyAllowAPIKeyInBrowser: true,
      debug: true,
    );
    _repository = VoiceAssistantRepository(_client);
    _chatBloc = ChatBloc(_repository)..add(ChatStreamConnected());
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    await _client.updateSession(
        instructions: 'You are a great, upbeat friend.');
    await _client.updateSession(voice: Voice.alloy);
    await _client.updateSession(
      turnDetection: TurnDetection(
        type: TurnDetectionType.serverVad,
      ),
      inputAudioTranscription: InputAudioTranscriptionConfig(
        model: 'whisper-1',
      ),
    );

    _client.on(RealtimeEventType.error, (event) {
      final error = (event as RealtimeEventError).error;
      // Show error in UI if needed
      debugPrint('Realtime error: $error');
    });

    _client.on(RealtimeEventType.conversationInterrupted, (event) {
      // Handle interruption if needed
      debugPrint('Conversation interrupted: ${event.toString()}');
    });

    _client.on(RealtimeEventType.conversationUpdated, (event) {
      _repository.handleConversationUpdated(
        event as RealtimeEventConversationUpdated,
      );
    });

    _client.on(RealtimeEventType.conversationItemAppended, (event) {
      _repository.handleConversationItemAppended(
        event as RealtimeEventConversationItemAppended,
      );
    });

    _client.on(RealtimeEventType.conversationItemCompleted, (event) {
      _repository.handleConversationItemCompleted(
        event as RealtimeEventConversationItemCompleted,
      );
    });

    await _client.connect();

    // Initial greeting
    await _client.sendUserMessageContent([
      const ContentPart.inputText(
        text: 'Hi! I\'m here to help with your meditation practice.',
      ),
    ]);
  }

  @override
  void dispose() {
    _chatBloc.close();
    _repository.dispose();
    _client.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _chatBloc,
      child: const Scaffold(
        body: SafeArea(
          child: ChatWidget(),
        ),
      ),
    );
  }
}
