import 'dart:async';
import '../models/chat_message.dart';

abstract class IChatRepository {
  Future<void> sendMessage(ChatMessage message);
  Stream<ChatMessage> getMessageStream();
  Future<List<ChatMessage>> getMessages();
}

class InMemoryChatRepository implements IChatRepository {
  final _messagesController = StreamController<ChatMessage>.broadcast();
  final List<ChatMessage> _messages = [];

  @override
  Future<void> sendMessage(ChatMessage message) async {
    _messages.add(message);
    _messagesController.add(message);
  }

  @override
  Stream<ChatMessage> getMessageStream() {
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  void dispose() {
    _messagesController.close();
  }
}
