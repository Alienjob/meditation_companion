import 'package:equatable/equatable.dart';
import '../models/chat_message.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatMessageReceived extends ChatEvent {
  final ChatMessage message;

  const ChatMessageReceived(this.message);

  @override
  List<Object> get props => [message];
}

class SendChatMessage extends ChatEvent {
  final String content;

  const SendChatMessage(this.content);

  @override
  List<Object> get props => [content];
}

class ChatStreamConnected extends ChatEvent {}

class ChatStreamDisconnected extends ChatEvent {}

class ChatError extends ChatEvent {
  final String message;

  const ChatError(this.message);

  @override
  List<Object> get props => [message];
}
