import 'package:equatable/equatable.dart';

enum MessageStatus { pending, streaming, completed }

class ChatMessage extends Equatable {
  final String id;
  final String content;
  final String senderId;
  final DateTime timestamp;
  final bool isUser;
  final MessageStatus status;

  const ChatMessage({
    required this.id,
    required this.content,
    required this.senderId,
    required this.timestamp,
    required this.isUser,
    this.status = MessageStatus.completed,
  });

  @override
  List<Object> get props => [id, content, senderId, timestamp, isUser, status];

  ChatMessage copyWith({
    String? id,
    String? content,
    String? senderId,
    DateTime? timestamp,
    bool? isUser,
    MessageStatus? status,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      senderId: senderId ?? this.senderId,
      timestamp: timestamp ?? this.timestamp,
      isUser: isUser ?? this.isUser,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'senderId': senderId,
      'timestamp': timestamp.toIso8601String(),
      'isUser': isUser,
      'status': status.name,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isUser: json['isUser'] as bool,
      status: MessageStatus.values.firstWhere(
        (s) => s.name == json['status'],
        orElse: () => MessageStatus.completed,
      ),
    );
  }
}
