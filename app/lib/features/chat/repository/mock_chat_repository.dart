import 'dart:async';
import '../models/chat_message.dart';
import 'chat_repository.dart';

class MockChatRepository implements IChatRepository {
  final _messagesController = StreamController<ChatMessage>.broadcast();
  final List<ChatMessage> _messages = [];

  // Simulated delay for async operations
  final Duration _delay;

  MockChatRepository([this._delay = const Duration(milliseconds: 500)]) {
    // Initialize the controller with existing messages
    _initializeStream();
  }

  void _initializeStream() async {
    for (final message in _messages) {
      await Future.delayed(_delay);
      if (!_messagesController.isClosed) {
        _messagesController.add(message);
      }
    }
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    // Add user message without delay to maintain test ordering
    _messages.add(message);
    _messagesController.add(message);

    // Simulate an AI response with a small delay
    if (message.isUser) {
      await Future.delayed(_delay);
      final aiResponse = ChatMessage(
        id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
        content: _generateAIResponse(message.content),
        senderId: 'ai',
        timestamp: DateTime.now(),
        isUser: false,
      );

      _messages.add(aiResponse);
      _messagesController.add(aiResponse);
    }
  }

  @override
  Stream<ChatMessage> getMessageStream() {
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  String _generateAIResponse(String userMessage) {
    // Simple response generation logic
    if (userMessage.toLowerCase().contains('hello')) {
      return 'Hello! How can I assist you with your meditation today?';
    } else if (userMessage.toLowerCase().contains('meditate')) {
      return 'Would you like to start a meditation session? I can guide you through it.';
    } else if (userMessage.toLowerCase().contains('stress') ||
        userMessage.toLowerCase().contains('anxious')) {
      return 'I understand. Let\'s try a simple breathing exercise to help you relax.';
    } else {
      return 'I\'m here to support your meditation journey. How can I help?';
    }
  }

  void dispose() {
    _messagesController.close();
  }
}
