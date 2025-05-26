import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) {
        final chatBloc = ChatBloc(InMemoryChatRepository());
        chatBloc.add(ChatStreamConnected());
        return chatBloc;
      },
      child: Builder(
        builder: (context) => BlocProvider(
          create: (context) {
            final client = RealtimeClient(
              apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
            );

            final repository = VoiceAssistantRepository(client);
            final chatBloc = context.read<ChatBloc>();

            // Подключаем обработчики
            client.on(RealtimeEventType.conversationUpdated, (event) {
              repository.handleConversationUpdated(
                  event as RealtimeEventConversationUpdated);
            });

            client.on(RealtimeEventType.conversationItemAppended, (event) {
              repository.handleConversationItemAppended(
                  event as RealtimeEventConversationItemAppended);
            });

            client.on(RealtimeEventType.conversationItemCompleted, (event) {
              repository.handleConversationItemCompleted(
                  event as RealtimeEventConversationItemCompleted);
            });

            // Подключаем стрим
            repository.getMessageStream().listen((message) {
              chatBloc.add(ChatMessageReceived(message));
            });

            // Подключаемся к серверу
            client.connect().then((_) {
              log('Connected to OpenAI Realtime: ${client.isConnected()}');

              // Добавляем приветственное сообщение
              Future.delayed(const Duration(milliseconds: 100), () {
                final welcomeMessage = ChatMessage(
                  id: 'welcome-${DateTime.now().millisecondsSinceEpoch}',
                  content:
                      'Hello! I\'m your meditation assistant. Press the mic button to start talking.',
                  senderId: 'assistant',
                  timestamp: DateTime.now(),
                  isUser: false,
                );
                chatBloc.add(ChatMessageReceived(welcomeMessage));
              });
            });

            return AssistantBloc(
              chatBloc: chatBloc,
              audioService: context.read<AudioService>(),
              recorder: MockAudioRecorder(),
              client: client,
            );
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
