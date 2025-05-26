import 'dart:async';
import 'dart:developer';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../../chat/models/chat_message.dart';
import '../../chat/repository/chat_repository.dart';

class VoiceAssistantRepository implements IChatRepository {
  final RealtimeClient _client;
  final _messagesController = StreamController<ChatMessage>.broadcast();
  final List<ChatMessage> _messages = [];
  final Map<String, ChatMessage> _inProgressMessages = {};

  VoiceAssistantRepository(this._client);

  @override
  Stream<ChatMessage> getMessageStream() {
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    _messages.add(message);
    _messagesController.add(message);

    await _client.sendUserMessageContent([
      ContentPart.inputText(text: message.content),
    ]);
  }

  void handleConversationUpdated(RealtimeEventConversationUpdated event) {
    log('OpenAI Realtime Conversation updated: ${event.result}');

    final item = event.result.item;
    if (item == null) return;

    final delta = event.result.delta;

    if (item.item case final ItemMessage message) {
      final isUser = message.role == ItemRole.user;
      final messageId = item.item.id;

      if (!_inProgressMessages.containsKey(messageId)) {
        final text = message.content
                .firstWhere(
                  (part) =>
                      part is ContentPartText || part is ContentPartInputText,
                  orElse: () => ContentPart.text(text: ''),
                )
                .mapOrNull(
                  text: (part) => part.text,
                  inputText: (part) => part.text,
                ) ??
            '';

        final chatMessage = ChatMessage(
          id: messageId,
          content: text,
          senderId: isUser ? 'user' : 'assistant',
          timestamp: DateTime.now(),
          isUser: isUser,
        );
        _inProgressMessages[messageId] = chatMessage;
        _messages.add(chatMessage);
        _messagesController.add(chatMessage);
      } else if (delta?.transcript != null) {
        final existingMessage = _inProgressMessages[messageId]!;
        final updatedMessage = existingMessage.copyWith(
          content: existingMessage.content + delta!.transcript!,
        );
        _inProgressMessages[messageId] = updatedMessage;

        // Update the message in the list
        final index = _messages.indexOf(existingMessage);
        if (index != -1) {
          _messages[index] = updatedMessage;
          _messagesController.add(updatedMessage);
        }
      }
    }
  }

  void handleConversationItemAppended(
      RealtimeEventConversationItemAppended event) {
    final item = event.item;
    if (item.item case final ItemMessage message) {
      final isUser = message.role == ItemRole.user;
      final messageId = item.item.id;

      final text = message.content
              .firstWhere(
                (part) =>
                    part is ContentPartText || part is ContentPartInputText,
                orElse: () => ContentPart.text(text: ''),
              )
              .mapOrNull(
                text: (part) => part.text,
                inputText: (part) => part.text,
              ) ??
          '';

      final chatMessage = ChatMessage(
        id: messageId,
        content: text,
        senderId: isUser ? 'user' : 'assistant',
        timestamp: DateTime.now(),
        isUser: isUser,
      );
      _inProgressMessages[messageId] = chatMessage;

      // Add to messages list if not already present
      if (!_messages.any((m) => m.id == messageId)) {
        _messages.add(chatMessage);
        _messagesController.add(chatMessage);
      }
    }
  }

  void handleConversationItemCompleted(
      RealtimeEventConversationItemCompleted event) {
    final item = event.item;
    if (item.item case final ItemMessage message) {
      _inProgressMessages.remove(item.item.id);
    }
  }

  void dispose() {
    _messagesController.close();
  }
}
