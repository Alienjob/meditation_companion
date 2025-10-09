import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';

import '../../chat/bloc/chat_bloc.dart';
import '../../chat/bloc/chat_event.dart';
import '../../chat/models/chat_message.dart';
import '../../chat/views/chat_widget.dart';
import '../../voice_assistant/repository/voice_assistant_repository.dart';

const _chatAssistantDomain = 'Chat';
const _chatAssistantLifecycle = 'Chat Assistant Widget Lifecycle';
const _chatAssistantState = 'Chat Assistant State';
void _chatAssistantDebug(String feature, String message) {
  logDebug(
    message,
    domain: _chatAssistantDomain,
    feature: feature,
  );
}

class ChatAssistantWidget extends StatelessWidget {
  const ChatAssistantWidget({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

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
    final repository = context.read<VoiceAssistantRepository>();

    return BlocProvider(
      create: (context) {
        _chatAssistantDebug(
          _chatAssistantLifecycle,
          'ChatAssistantWidget - Creating ChatBloc with shared VoiceAssistantRepository at ${DateTime.now().toIso8601String()}',
        );
        final chatBloc = ChatBloc(repository);
        chatBloc.add(ChatStreamConnected());

        bool welcomeMessageAdded = false;
        chatBloc.stream.listen((state) {
          final messageCount = switch (state) {
            ChatConnected(messages: final msgs) => msgs.length,
            ChatDisconnected(messages: final msgs) => msgs.length,
            MessageSending(messages: final msgs) => msgs.length,
            MessageSent(messages: final msgs) => msgs.length,
            ChatFailure(messages: final msgs) => msgs.length,
            _ => 0,
          };
          _chatAssistantDebug(
            _chatAssistantState,
            'ChatAssistantWidget - ChatBloc state ${state.runtimeType} messages=$messageCount at ${DateTime.now().toIso8601String()}',
          );
          if (state is ChatConnected && !welcomeMessageAdded) {
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
      child: ChatWidget(scrollController: scrollController),
    );
  }
}
