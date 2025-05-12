import 'package:flutter/widgets.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';

class VoiceAssistantWidget extends StatefulWidget {
  const VoiceAssistantWidget({super.key});

  @override
  State<VoiceAssistantWidget> createState() => _VoiceAssistantWidgetState();
}

class _VoiceAssistantWidgetState extends State<VoiceAssistantWidget> {
  late final RealtimeClient _client;

  @override
  void initState() {
    super.initState();
    _client = RealtimeClient(
      apiKey: EnvConfig.openApiKey,
      dangerouslyAllowAPIKeyInBrowser: true,
      debug: true,
    );
  }

  @override
  Future<void> didChangeDependencies() async {
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

    // Set up event handling
    _client.on(RealtimeEventType.conversationUpdated, (event) {
      // item is the current item being updated
      final result = (event as RealtimeEventConversationUpdated).result;
      final item = result.item;
      final delta = result.delta;
      // you can fetch a full list of items at any time
      final items = _client.conversation.getItems();
    });

    // Connect to Realtime API
    await _client.connect();

    // Send a item and triggers a generation
    await _client.sendUserMessageContent([
      const ContentPart.inputText(text: 'How are you?'),
    ]);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
