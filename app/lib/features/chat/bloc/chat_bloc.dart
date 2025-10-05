import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';

import '../models/chat_message.dart';
import '../repository/chat_repository.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepository;
  StreamSubscription<ChatMessage>? _chatSubscription;
  final List<ChatMessage> _messages = [];

  static const _domain = 'Chat';
  static const _featureLifecycle = 'ChatBloc Lifecycle';
  static const _featureStream = 'ChatBloc Stream';
  static const _featureProcessing = 'ChatBloc Message Processing';
  static const _featureSyncCheck = 'ChatBloc - SYNC CHECK';
  static const _featureUi = 'ChatBloc UI';

  void _debug(String feature, String message) {
    logDebug(
      message,
      domain: _domain,
      feature: feature,
      context: ChatBloc,
    );
  }

  void _error(String feature, String message, {Object? error}) {
    logError(
      message,
      domain: _domain,
      feature: feature,
      error: error,
      context: ChatBloc,
    );
  }

  ChatBloc(this._chatRepository) : super(ChatInitial()) {
    _debug(
      _featureLifecycle,
      'ChatBloc - Constructor initialized at ${DateTime.now().toIso8601String()}',
    );
    on<ChatStreamConnected>(_onChatStreamConnected);
    on<ChatStreamDisconnected>(_onChatStreamDisconnected);
    on<ChatMessageReceived>(_onChatMessageReceived);
    on<SendChatMessage>(_onSendChatMessage);
    on<ChatError>(_onChatError);
    _debug(
      _featureLifecycle,
      'ChatBloc - Event handlers registered at ${DateTime.now().toIso8601String()}',
    );
  }

  void _onChatStreamConnected(
    ChatStreamConnected event,
    Emitter<ChatState> emit,
  ) async {
    _debug(
      _featureStream,
      'ChatBloc - ChatStreamConnected event received at ${DateTime.now().toIso8601String()}',
    );
    _debug(_featureStream, 'ChatBloc - Setting up message stream...');
    await _setupMessageStream();
    _debug(
      _featureStream,
      'ChatBloc - Message stream setup completed at ${DateTime.now().toIso8601String()}',
    );

    final messages = await _chatRepository.getMessages();
    _debug(
      _featureLifecycle,
      'ChatBloc - Retrieved ${messages.length} existing messages from repository',
    );

    _messages.addAll(messages);
    _debug(
      _featureLifecycle,
      'ChatBloc - Added messages to local list, total count: ${_messages.length}',
    );

    emit(ChatConnected(_messages));
    _debug(
      _featureUi,
      'ChatBloc - Emitted ChatConnected state with ${_messages.length} messages at ${DateTime.now().toIso8601String()}',
    );
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
    _debug(
      _featureStream,
      'ChatBloc - MESSAGE STREAM RECEIVED: id=${event.message.id}, content="${event.message.content.length > 30 ? event.message.content.substring(0, 30) + '...' : event.message.content}", isUser=${event.message.isUser}, status=${event.message.status.name} at $timestamp',
    );
    _debug(
      _featureProcessing,
      'ChatBloc - MESSAGE PROCESSING START: About to process ${event.message.isUser ? 'USER' : 'ASSISTANT'} message for UI display',
    );

    _debug(
      _featureSyncCheck,
      'ChatBloc - SYNC CHECK: Looking for message id=${event.message.id} in ${_messages.length} existing messages',
    );
    for (int i = 0; i < _messages.length; i++) {
      _debug(
        _featureSyncCheck,
        'ChatBloc - SYNC CHECK: Index $i - id=${_messages[i].id}, content="${_messages[i].content.length > 20 ? _messages[i].content.substring(0, 20) + '...' : _messages[i].content}"',
      );
    }

    final existingIndex = _messages.indexWhere((m) => m.id == event.message.id);
    if (existingIndex != -1) {
      _debug(
        _featureProcessing,
        'ChatBloc - FOUND EXISTING: Updating message at index $existingIndex',
      );
      final oldContent = _messages[existingIndex].content;
      _messages[existingIndex] = event.message;
      _debug(
        _featureProcessing,
        'ChatBloc - Message updated: "${oldContent.length > 30 ? oldContent.substring(0, 30) + '...' : oldContent}" -> "${event.message.content.length > 30 ? event.message.content.substring(0, 30) + '...' : event.message.content}"',
      );
    } else {
      _debug(_featureProcessing,
          'ChatBloc - NOT FOUND: Adding new message to list');
      _messages.add(event.message);
    }

    _debug(_featureProcessing,
        'ChatBloc - Total messages in list: ${_messages.length}');
    emit(ChatConnected(List.from(_messages)));
    _debug(
      _featureProcessing,
      'ChatBloc - MESSAGE PROCESSING COMPLETE: Emitted ChatConnected state with ${_messages.length} messages at ${DateTime.now().toIso8601String()}',
    );
    _debug(_featureUi,
        'ChatBloc - UI UPDATE: Chat UI should now display the updated message list');
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
    _debug(
      _featureStream,
      'ChatBloc - _setupMessageStream called at ${DateTime.now().toIso8601String()}',
    );

    _chatSubscription?.cancel();
    _debug(
        _featureStream, 'ChatBloc - Previous subscription cancelled (if any)');

    _chatSubscription = _chatRepository.getMessageStream().listen(
      (message) {
        _debug(
          _featureStream,
          'ChatBloc - Message received from stream: id=${message.id}, content="${message.content.length > 50 ? message.content.substring(0, 50) + '...' : message.content}", isUser=${message.isUser}, status=${message.status.name} at ${DateTime.now().toIso8601String()}',
        );
        add(ChatMessageReceived(message));
      },
      onError: (error) {
        _error(
          _featureStream,
          'ChatBloc - Stream error: $error at ${DateTime.now().toIso8601String()}',
          error: error,
        );
      },
      onDone: () {
        _debug(
          _featureStream,
          'ChatBloc - Message stream closed at ${DateTime.now().toIso8601String()}',
        );
      },
    );

    _debug(
      _featureStream,
      'ChatBloc - Message stream subscription created at ${DateTime.now().toIso8601String()}',
    );
  }

  @override
  Future<void> close() {
    _debug(_featureLifecycle,
        'ChatBloc - Disposing at ${DateTime.now().toIso8601String()}');
    _chatSubscription?.cancel();
    _debug(
      _featureLifecycle,
      'ChatBloc - Message stream subscription cancelled',
    );
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
