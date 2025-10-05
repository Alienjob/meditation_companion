import 'dart:async';
import 'dart:developer';
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
    log('ChatBloc - Constructor initialized at ${DateTime.now().toIso8601String()}');
    on<ChatStreamConnected>(_onChatStreamConnected);
    on<ChatStreamDisconnected>(_onChatStreamDisconnected);
    on<ChatMessageReceived>(_onChatMessageReceived);
    on<SendChatMessage>(_onSendChatMessage);
    on<ChatError>(_onChatError);
    log('ChatBloc - Event handlers registered at ${DateTime.now().toIso8601String()}');
  }

  void _onChatStreamConnected(
    ChatStreamConnected event,
    Emitter<ChatState> emit,
  ) async {
    log('ChatBloc - ChatStreamConnected event received at ${DateTime.now().toIso8601String()}');
    log('ChatBloc - Setting up message stream...');
    await _setupMessageStream();
    log('ChatBloc - Message stream setup completed at ${DateTime.now().toIso8601String()}');

    final messages = await _chatRepository.getMessages();
    log('ChatBloc - Retrieved ${messages.length} existing messages from repository');

    _messages.addAll(messages);
    log('ChatBloc - Added messages to local list, total count: ${_messages.length}');

    emit(ChatConnected(_messages));
    log('ChatBloc - Emitted ChatConnected state with ${_messages.length} messages at ${DateTime.now().toIso8601String()}');
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
    final timestamp = DateTime.now().toIso8601String();
    log('ChatBloc - MESSAGE STREAM RECEIVED: id=${event.message.id}, content="${event.message.content.length > 30 ? event.message.content.substring(0, 30) + '...' : event.message.content}", isUser=${event.message.isUser}, status=${event.message.status.name} at $timestamp');
    log('ChatBloc - MESSAGE PROCESSING START: About to process ${event.message.isUser ? 'USER' : 'ASSISTANT'} message for UI display');

    log('ChatBloc - SYNC CHECK: Looking for message id=${event.message.id} in ${_messages.length} existing messages');
    for (int i = 0; i < _messages.length; i++) {
      log('ChatBloc - SYNC CHECK: Index $i - id=${_messages[i].id}, content="${_messages[i].content.length > 20 ? _messages[i].content.substring(0, 20) + '...' : _messages[i].content}"');
    }

    final existingIndex = _messages.indexWhere((m) => m.id == event.message.id);
    if (existingIndex != -1) {
      log('ChatBloc - FOUND EXISTING: Updating message at index $existingIndex');
      final oldContent = _messages[existingIndex].content;
      _messages[existingIndex] = event.message;
      log('ChatBloc - Message updated: "${oldContent.length > 30 ? oldContent.substring(0, 30) + '...' : oldContent}" -> "${event.message.content.length > 30 ? event.message.content.substring(0, 30) + '...' : event.message.content}"');
    } else {
      log('ChatBloc - NOT FOUND: Adding new message to list');
      _messages.add(event.message);
    }

    log('ChatBloc - Total messages in list: ${_messages.length}');
    emit(ChatConnected(List.from(_messages)));
    log('ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with ${_messages.length} messages at ${DateTime.now().toIso8601String()}');
    log('ChatBloc - UI UPDATE: Chat UI should now display the updated message list');
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

      _updateMessage(pendingMessage.id,
          status: MessageStatus.completed, emit: emit);

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
    log('ChatBloc - _setupMessageStream called at ${DateTime.now().toIso8601String()}');

    _chatSubscription?.cancel();
    log('ChatBloc - Previous subscription cancelled (if any)');

    _chatSubscription = _chatRepository.getMessageStream().listen(
      (message) {
        log('ChatBloc - Message received from stream: id=${message.id}, content="${message.content.length > 50 ? message.content.substring(0, 50) + '...' : message.content}", isUser=${message.isUser}, status=${message.status.name} at ${DateTime.now().toIso8601String()}');
        add(ChatMessageReceived(message));
      },
      onError: (error) {
        log('ChatBloc - Stream error: $error at ${DateTime.now().toIso8601String()}');
      },
      onDone: () {
        log('ChatBloc - Message stream closed at ${DateTime.now().toIso8601String()}');
      },
    );

    log('ChatBloc - Message stream subscription created at ${DateTime.now().toIso8601String()}');
  }

  @override
  Future<void> close() {
    log('ChatBloc - Disposing at ${DateTime.now().toIso8601String()}');
    _chatSubscription?.cancel();
    log('ChatBloc - Message stream subscription cancelled');
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
