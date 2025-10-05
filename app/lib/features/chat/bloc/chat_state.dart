import 'package:equatable/equatable.dart';
import '../models/chat_message.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatConnected extends ChatState {
  final List<ChatMessage> messages;
  final int timestamp;

  ChatConnected(this.messages)
      : timestamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => [messages, timestamp];

  ChatConnected copyWith({
    List<ChatMessage>? messages,
  }) {
    return ChatConnected(
      messages ?? this.messages,
    );
  }
}

class ChatDisconnected extends ChatState {
  final List<ChatMessage> messages;

  const ChatDisconnected(this.messages);

  @override
  List<Object> get props => [messages];
}

class ChatFailure extends ChatState {
  final String message;
  final List<ChatMessage> messages;

  const ChatFailure({
    required this.message,
    required this.messages,
  });

  @override
  List<Object> get props => [message, messages];
}

class MessageSending extends ChatState {
  final List<ChatMessage> messages;

  const MessageSending(this.messages);

  @override
  List<Object> get props => [messages];
}

class MessageSent extends ChatState {
  final List<ChatMessage> messages;

  const MessageSent(this.messages);

  @override
  List<Object> get props => [messages];
}
