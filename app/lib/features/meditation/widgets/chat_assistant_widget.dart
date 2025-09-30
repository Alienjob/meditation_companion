import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../../chat/bloc/chat_bloc.dart';
import '../../chat/bloc/chat_event.dart';
import '../../chat/models/chat_message.dart';
import '../../chat/repository/chat_repository.dart';
import '../../chat/views/chat_widget.dart';
import '../../voice_assistant/bloc/assistant_bloc.dart';
import '../../voice_assistant/repository/voice_assistant_repository.dart';
import '../../voice_assistant/services/mock_audio_recorder.dart';
import '../../voice_assistant/voice_assistant_widget.dart';
import '../services/audio_service.dart';

class ChatAssistantWidget extends StatelessWidget {
  const ChatAssistantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildChatWithVoiceAssistant(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.assistant, color: Colors.deepPurple),
          SizedBox(width: 8),
          Text(
            'Meditation Assistant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatWithVoiceAssistant(BuildContext context) {
    final chatRepository = InMemoryChatRepository();
    final chatBloc = ChatBloc(chatRepository);

    return BlocProvider(
      create: (context) {
        chatBloc.add(ChatStreamConnected());
        bool welcomeMessageAdded = false;
        chatBloc.stream.listen((state) {
          if (state is ChatConnected && !welcomeMessageAdded) {
            // Add welcome message only once chat is properly connected

            final welcomeMessage = ChatMessage(
              id: 'welcome-${DateTime.now().millisecondsSinceEpoch}',
              content:
                  'Hello! I\'m your meditation assistant. Press the mic button to start talking.',
              senderId: 'assistant',
              timestamp: DateTime.now(),
              isUser: false,
            );
            chatBloc.add(ChatMessageReceived(welcomeMessage));
            welcomeMessageAdded = true;
          }
        });

        return chatBloc;
      },
      child: Builder(
        builder: (context) => BlocProvider(
          create: (context) {
            final client = RealtimeClient(
              apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
              dangerouslyAllowAPIKeyInBrowser: true,
            );

            // Add this configuration before connecting
            client.updateSession(
              instructions:
                  'You are a friendly meditation assistant. Help users with meditation and mindfulness.',
              voice: Voice.alloy, // Use alloy voice for responses
              turnDetection: TurnDetection(
                type: TurnDetectionType
                    .serverVad, // Server-side voice activity detection
              ),
              inputAudioTranscription: InputAudioTranscriptionConfig(
                model: 'whisper-1',
              ),
            );

            final repository = VoiceAssistantRepository(client);
            final chatBloc = context.read<ChatBloc>();

            // client.on(RealtimeEventType.all, (event) {
            //   log('Received OpenAI event: ${event.runtimeType}');

            // });

            // Подключаем обработчики
            client.on(RealtimeEventType.conversationUpdated, (event) {
              log('OpenAI Realtime Conversation updated: ${(event as RealtimeEventConversationUpdated).result}');
              repository.handleConversationUpdated(
                  event as RealtimeEventConversationUpdated);
            });

            client.on(RealtimeEventType.conversationItemAppended, (event) {
              log('OpenAI Realtime Conversation item appended: ${(event as RealtimeEventConversationItemAppended).item}');
              repository.handleConversationItemAppended(
                  event as RealtimeEventConversationItemAppended);
            });

            client.on(RealtimeEventType.conversationItemCompleted, (event) {
              log('OpenAI Realtime Conversation item completed: ${(event as RealtimeEventConversationItemCompleted).item}');
              repository.handleConversationItemCompleted(
                  event as RealtimeEventConversationItemCompleted);
            });

            client.on(RealtimeEventType.error, (event) {
              log('OpenAI Realtime error: ${(event as RealtimeEventError).error}');
              // Attempt to reconnect
              // client.connect();
            });

            // Подключаем стрим
            repository.getMessageStream().listen((message) {
              chatBloc.add(ChatMessageReceived(message));
            });

            final assistantBloc = AssistantBloc(
              chatBloc: chatBloc,
              audioService: context.read<AudioService>(),
              recorder: MockAudioRecorder(),
              client: client,
            );

            client.on(RealtimeEventType.close, (event) {
              log('OpenAI Realtime closed, attempting to reconnect...');
              // Attempt to reconnect with a small delay
              Future.delayed(const Duration(seconds: 1), () {
                if (!client.isConnected()) {
                  client.connect();
                }
              });
            });

            // Initial connect
            client.connect().then((_) {
              log('Connected to OpenAI Realtime: ${client.isConnected()}');
              assistantBloc.add(ClientConnected());
            });

            return assistantBloc;
          },
          child: const Column(
            children: [
              Expanded(child: ChatWidget()),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: VoiceAssistantWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
