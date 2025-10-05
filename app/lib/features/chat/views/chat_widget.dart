import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../bloc/chat_state.dart';
import '../models/chat_message.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        // LOG UI STATE CHANGES
        dev.log(
            '[ChatWidget] UI REBUILD: State changed to ${state.runtimeType} at ${DateTime.now().toIso8601String()}');
        return Column(
          children: [
            Expanded(
              child: _buildMessageList(state),
            ),
            _buildInputField(context),
          ],
        );
      },
    );
  }

  Widget _buildMessageList(ChatState state) {
    final messages = switch (state) {
      ChatConnected(messages: final msgs) => msgs,
      ChatDisconnected(messages: final msgs) => msgs,
      MessageSending(messages: final msgs) => msgs,
      MessageSent(messages: final msgs) => msgs,
      ChatFailure(messages: final msgs) => msgs,
      _ => <ChatMessage>[],
    };

    // LOG UI MESSAGES
    dev.log(
        '[ChatWidget] UI RENDER: About to render ${messages.length} messages at ${DateTime.now().toIso8601String()}');
    for (int i = 0; i < messages.length; i++) {
      final msg = messages[i];
      dev.log(
          '[ChatWidget] UI RENDER: Index $i - id=${msg.id}, isUser=${msg.isUser}, content="${msg.content.length > 30 ? msg.content.substring(0, 30) + '...' : msg.content}", status=${msg.status.name}');
    }

    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemBuilder: (context, index) {
        final message = messages[messages.length - 1 - index];
        return _MessageBubble(message: message);
      },
    );
  }

  Widget _buildInputField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: const _MessageInput(),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;
    final colorScheme = Theme.of(context).colorScheme;
    final displayText = switch (message.status) {
      MessageStatus.streaming ||
      MessageStatus.pending =>
        message.content.isEmpty
            ? (message.isUser ? 'Speaking…' : 'Listening…')
            : '${message.content} …',
      MessageStatus.completed => message.content.isEmpty
          ? (message.isUser ? '' : '[Voice response]')
          : message.content,
    };

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isUser ? colorScheme.primary : colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          displayText,
          style: TextStyle(
            color: isUser ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _MessageInput extends StatefulWidget {
  const _MessageInput();

  @override
  State<_MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<_MessageInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    context.read<ChatBloc>().add(SendChatMessage(message));
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Type a message...',
              border: InputBorder.none,
            ),
            onSubmitted: (_) => _sendMessage(),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: _sendMessage,
        ),
      ],
    );
  }
}
