import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/chat_message.dart';
import '../repository/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepository;
  StreamSubscription<ChatMessage>? _chatSubscription;
  final List<ChatMessage> _messages = [];

  ChatBloc(this._chatRepository) : super(ChatInitial()) {
    on<ChatStreamConnected>(_onChatStreamConnected);
    on<ChatStreamDisconnected>(_onChatStreamDisconnected);
    on<ChatMessageReceived>(_onChatMessageReceived);
    on<SendChatMessage>(_onSendChatMessage);
    on<ChatError>(_onChatError);
  }

  void _onChatStreamConnected(
    ChatStreamConnected event,
    Emitter<ChatState> emit,
  ) async {
    await _setupMessageStream();
    final messages = await _chatRepository.getMessages();
    _messages.addAll(messages);
    emit(ChatConnected(_messages));
  }

  void _onChatStreamDisconnected(
    ChatStreamDisconnected event,
    Emitter<ChatState> emit,
  ) {
    _chatSubscription?.cancel();
    emit(ChatDisconnected(_messages));
  }

  void _onChatMessageReceived(
    ChatMessageReceived event,
    Emitter<ChatState> emit,
  ) {
    final index = _messages.indexWhere((msg) => msg.id == event.message.id);
    if (index == -1) {
      _messages.add(event.message);
    } else {
      _messages[index] = event.message;
    }
    emit(ChatConnected(List.from(_messages)));
  }

  Future<void> _onSendChatMessage(
    SendChatMessage event,
    Emitter<ChatState> emit,
  ) async {
    ChatMessage? pendingMessage;
    try {
      emit(MessageSending(List.from(_messages)));

      pendingMessage = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        content: event.content,
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
        status: MessageStatus.pending,
      );

      _messages.add(pendingMessage);
      emit(MessageSent(List.from(_messages)));

      // After MessageSent state is emitted, send the message to repository
      await _chatRepository.sendMessage(pendingMessage);

      _updateMessage(pendingMessage.id, status: MessageStatus.completed, emit: emit);

      // AI response will be handled through the message stream
    } catch (e) {
      if (pendingMessage != null) {
        _messages.removeWhere((msg) => msg.id == pendingMessage!.id);
      }
      emit(ChatFailure(
        message: 'Failed to send message: $e',
        messages: List.from(_messages),
      ));
    }
  }

  void _onChatError(
    ChatError event,
    Emitter<ChatState> emit,
  ) {
    emit(ChatFailure(
      message: event.message,
      messages: List.from(_messages),
    ));
  }

  Future<void> _setupMessageStream() async {
    _chatSubscription?.cancel();

    _chatSubscription = _chatRepository.getMessageStream().listen(
          (message) => add(ChatMessageReceived(message)),
          onError: (error) => add(ChatError('Message stream error: $error')),
        );
  }

  @override
  Future<void> close() {
    _chatSubscription?.cancel();
    return super.close();
  }

  void _updateMessage(
    String messageId, {
    String? content,
    MessageStatus? status,
    required Emitter<ChatState> emit,
  }) {
    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index == -1) return;
    var updated = _messages[index];
    if (content != null) {
      updated = updated.copyWith(content: content);
    }
    if (status != null) {
      updated = updated.copyWith(status: status);
    }
    _messages[index] = updated;
    emit(ChatConnected(List.from(_messages)));
  }
}
