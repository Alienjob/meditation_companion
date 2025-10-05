import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../../chat/models/chat_message.dart';
import '../../chat/repository/chat_repository.dart';

String _clipLogText(String value, {bool fromEnd = false}) {
  if (value.isEmpty) return '<empty>';
  const maxLength = 80;
  return value.length <= maxLength
      ? value
      : fromEnd
          ? '...${value.substring(value.length - maxLength)}'
          : '${value.substring(0, maxLength)}...';
}

void _logMessageSnapshot(
  String prefix,
  ItemMessage message,
  FormattedProperty? formatted, {
  Delta? delta,
}) {
  final text = formatted?.text ?? '';
  final transcript = formatted?.transcript ?? '';
  final audioBytes = formatted?.audio.length ?? 0;
  final deltaText = delta?.text ?? '';
  final deltaTranscriptLen = delta?.transcript?.length ?? 0;
  final deltaAudioBytes = delta?.audio?.length ?? 0;

  log(
    '$prefix role=${message.role.name} '
    'text="${_clipLogText(text)}" '
    'transcriptLen=${transcript.length} '
    'transcript="${_clipLogText(transcript, fromEnd: true)}" '
    'audioBytes=$audioBytes '
    'deltaTextLen=${deltaText.length} '
    'deltaTranscriptLen=$deltaTranscriptLen '
    'deltaAudioBytes=$deltaAudioBytes',
  );
}

String? _initialAssistantText(FormattedProperty? formatted) {
  if (formatted == null) return null;
  if (formatted.text.isNotEmpty) return formatted.text;
  if (formatted.transcript.isNotEmpty) return formatted.transcript;
  return null;
}

String? _deltaText(Delta? delta) {
  if (delta == null) return null;
  if (delta.text != null && delta.text!.isNotEmpty) return delta.text;
  if (delta.transcript != null && delta.transcript!.isNotEmpty) {
    return delta.transcript;
  }
  return null;
}

class VoiceAssistantRepository implements IChatRepository {
  final RealtimeClient _client;
  final _messagesController = StreamController<ChatMessage>.broadcast();
  final List<ChatMessage> _messages = [];
  final Map<String, ChatMessage> _inProgressMessages = {};
  final Map<String, int> _processedAudioBytes = {};
  final Map<String, ChatMessage> _inProgressUserMessages = {};

  VoiceAssistantRepository(this._client) {
    log('VoiceAssistantRepository - Constructor initialized at ${DateTime.now().toIso8601String()}');
    log('VoiceAssistantRepository - Client connected: ${_client.isConnected()}');
  }

  @override
  Stream<ChatMessage> getMessageStream() {
    log('VoiceAssistantRepository - getMessageStream called at ${DateTime.now().toIso8601String()}');
    log('VoiceAssistantRepository - Stream controller is closed: ${_messagesController.isClosed}');
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    log('VoiceAssistantRepository - sendMessage called: id=${message.id}, content="${message.content.length > 50 ? message.content.substring(0, 50) + '...' : message.content}", isUser=${message.isUser} at ${DateTime.now().toIso8601String()}');

    if (!message.isUser) {
      _messages.add(message);
      log('VoiceAssistantRepository - Added assistant message to local list');
      _messagesController.add(message);
      log('VoiceAssistantRepository - Emitted assistant message to stream');
    } else {
      // For user messages, add to chat immediately but also track for API event matching
      _messages.add(message);
      log('VoiceAssistantRepository - Added user message to local list');
      _messagesController.add(message);
      log('VoiceAssistantRepository - Emitted user message to stream');
      // Store for potential transcript updates from API events
      _inProgressUserMessages[message.content] = message;
      log('VoiceAssistantRepository - Stored user message for API matching: key="${message.content}"');
    }

    log('VoiceAssistantRepository - Total messages in list: ${_messages.length}');
    log('VoiceAssistantRepository - Stream controller closed: ${_messagesController.isClosed}');
    log('VoiceAssistantRepository - Sending message, client connected: ${_client.isConnected()}');

    await _client.sendUserMessageContent([
      ContentPart.inputText(text: message.content),
    ]);
    log('VoiceAssistantRepository - Message sent to OpenAI client at ${DateTime.now().toIso8601String()}');
  }

  void handleConversationUpdated(RealtimeEventConversationUpdated event) {
    final item = event.result.item;
    if (item == null) return;

    final delta = event.result.delta;

    if (item.item case final ItemMessage message) {
      final isUser = message.role == ItemRole.user;
      final messageId = item.item.id;
      _logMessageSnapshot(
        'OpenAI conversation updated',
        message,
        item.formatted,
        delta: delta,
      );

      if (isUser) {
        _upsertUserMessage(
          messageId,
          transcript: item.formatted?.transcript,
          deltaTranscript: delta?.transcript,
          markCompleted: false,
        );
        return;
      }

      _upsertAssistantMessage(
        messageId,
        initialText: _initialAssistantText(item.formatted),
        appendText: _deltaText(delta),
        markCompleted: false,
      );
    }
  }

  void handleConversationItemAppended(
      RealtimeEventConversationItemAppended event) {
    final item = event.item;
    if (item.item case final ItemMessage message) {
      final isUser = message.role == ItemRole.user;
      final messageId = item.item.id;
      _logMessageSnapshot(
        'OpenAI conversation item appended',
        message,
        item.formatted,
      );

      if (isUser) {
        _upsertUserMessage(
          messageId,
          transcript: item.formatted?.transcript,
          deltaTranscript: null,
          markCompleted: false,
        );
        return;
      }

      _upsertAssistantMessage(
        messageId,
        initialText: _initialAssistantText(item.formatted),
        appendText: null,
        markCompleted: false,
      );
    }
  }

  void handleConversationItemCompleted(
      RealtimeEventConversationItemCompleted event) {
    final item = event.item;
    if (item.item case final ItemMessage message) {
      _logMessageSnapshot(
        'OpenAI conversation item completed',
        message,
        item.formatted,
      );
      final isUser = message.role == ItemRole.user;
      if (isUser) {
        _upsertUserMessage(
          message.id,
          transcript: item.formatted?.transcript,
          deltaTranscript: null,
          markCompleted: true,
        );
        return;
      }
      _upsertAssistantMessage(
        message.id,
        initialText: _initialAssistantText(item.formatted),
        appendText: null,
        markCompleted: true,
      );
      _processedAudioBytes.remove(message.id);
    }
  }

  void handleResponseTextDelta(RealtimeEventResponseTextDelta event) {
    final delta = event.delta;
    if (delta.isEmpty) return;

    _upsertAssistantMessage(
      event.itemId,
      appendText: delta,
      markCompleted: false,
    );

    log(
      'OpenAI response text delta: item=${event.itemId} '
      'deltaLen=${delta.length}',
    );
  }

  void handleResponseTextDone(RealtimeEventResponseTextDone event) {
    _upsertAssistantMessage(
      event.itemId,
      initialText: event.text,
      appendText: null,
      markCompleted: true,
    );
    log(
      'OpenAI response text done: item=${event.itemId} '
      'textLen=${event.text.length}',
    );
  }

  void _upsertAssistantMessage(
    String messageId, {
    String? initialText,
    String? appendText,
    required bool markCompleted,
  }) {
    log('VoiceAssistantRepository - _upsertAssistantMessage: messageId=$messageId, initialText="${initialText ?? '<null>'}", appendText="${appendText ?? '<null>'}", markCompleted=$markCompleted at ${DateTime.now().toIso8601String()}');

    final existing = _inProgressMessages[messageId];

    if (existing == null) {
      if ((initialText == null || initialText.isEmpty) &&
          (appendText == null || appendText.isEmpty) &&
          !markCompleted) {
        return;
      }

      final initialContent = (initialText ?? appendText) ?? '';
      final status =
          markCompleted ? MessageStatus.completed : MessageStatus.streaming;
      // Don't use placeholder text - let empty content show as streaming
      final content = initialContent;

      final message = ChatMessage(
        id: messageId,
        content: content,
        senderId: 'assistant',
        timestamp: DateTime.now(),
        isUser: false,
        status: status,
      );

      log('VoiceAssistantRepository - Creating new assistant message: content="${content.length > 50 ? content.substring(0, 50) + '...' : content}", status=${status.name}');
      _inProgressMessages[messageId] = message;

      final index = _messages.indexWhere((m) => m.id == messageId);
      if (index == -1) {
        _messages.add(message);
        log('VoiceAssistantRepository - Added new assistant message to list (index=${_messages.length - 1})');
      } else {
        _messages[index] = message;
        log('VoiceAssistantRepository - Updated existing assistant message at index $index');
      }

      log('VoiceAssistantRepository - Emitting assistant message to stream: id=$messageId');
      _messagesController.add(message);
      log('VoiceAssistantRepository - Assistant message emitted, stream closed: ${_messagesController.isClosed}');
      return;
    }

    var content = existing.content;
    if (initialText != null && initialText.isNotEmpty) {
      content = initialText;
    }
    if (appendText != null && appendText.isNotEmpty) {
      content += appendText;
    }
    if (markCompleted && content.isEmpty) {
      content = '[voice response]';
    }

    final status =
        markCompleted ? MessageStatus.completed : MessageStatus.streaming;

    final updated = existing.copyWith(
      content: content,
      status: status,
    );

    log('VoiceAssistantRepository - Updating existing assistant message: old content="${existing.content.length > 30 ? existing.content.substring(0, 30) + '...' : existing.content}" -> new content="${content.length > 30 ? content.substring(0, 30) + '...' : content}", status=${status.name}');
    _inProgressMessages[messageId] = updated;

    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index == -1) {
      _messages.add(updated);
      log('VoiceAssistantRepository - Added updated assistant message to list (new index=${_messages.length - 1})');
    } else {
      _messages[index] = updated;
      log('VoiceAssistantRepository - Updated assistant message at index $index');
    }

    log('VoiceAssistantRepository - Emitting updated assistant message to stream: id=$messageId');
    _messagesController.add(updated);
    log('VoiceAssistantRepository - Updated assistant message emitted, stream closed: ${_messagesController.isClosed}');
  }

  void _upsertUserMessage(
    String messageId, {
    String? transcript,
    String? deltaTranscript,
    required bool markCompleted,
  }) {
    log('VoiceAssistantRepository - _upsertUserMessage: messageId=$messageId, transcript="${transcript ?? '<null>'}", deltaTranscript="${deltaTranscript ?? '<null>'}", markCompleted=$markCompleted at ${DateTime.now().toIso8601String()}');

    // Try to find existing user message by content/transcript match
    final transcriptText = transcript ?? deltaTranscript;
    if (transcriptText == null || transcriptText.isEmpty) {
      log('VoiceAssistantRepository - No transcript text provided, skipping user message upsert');
      return;
    }

    log('VoiceAssistantRepository - Looking for existing user message with transcript: "$transcriptText"');
    log('VoiceAssistantRepository - Current _inProgressUserMessages count: ${_inProgressUserMessages.length}');

    // Look for existing user message in _inProgressUserMessages first
    ChatMessage? existingMessage;
    String? existingKey;

    // Skip very short transcripts that are likely noise or partial updates
    if (transcriptText.trim().length <= 1) {
      log('VoiceAssistantRepository - Skipping very short transcript: "$transcriptText"');
      return;
    }

    for (final entry in _inProgressUserMessages.entries) {
      // More precise matching: either exact match or one is a meaningful substring of the other
      final existingContent = entry.value.content.trim();
      final newContent = transcriptText.trim();

      // Skip if one of the strings is too short to be a meaningful match
      if (existingContent.length <= 1 || newContent.length <= 1) {
        continue;
      }

      // Check if they are related: either exact match or one is substantially contained in the other
      if (existingContent == newContent ||
          (existingContent.length > 5 &&
              newContent.contains(existingContent)) ||
          (newContent.length > 5 && existingContent.contains(newContent))) {
        existingMessage = entry.value;
        existingKey = entry.key;
        break;
      }
    }

    if (existingMessage != null && existingKey != null) {
      // Update existing message with full transcript
      log('VoiceAssistantRepository - Found existing user message to update: key="$existingKey"');
      final updated = existingMessage.copyWith(
        content: transcript ?? existingMessage.content,
        status:
            markCompleted ? MessageStatus.completed : MessageStatus.streaming,
      );

      log('VoiceAssistantRepository - Updating user message: old content="${existingMessage.content}" -> new content="${updated.content}", status=${updated.status.name}');

      final index = _messages.indexWhere((m) => m.id == existingMessage!.id);
      if (index != -1) {
        _messages[index] = updated;
        log('VoiceAssistantRepository - Updated user message at index $index');
        _messagesController.add(updated);
        log('VoiceAssistantRepository - Emitted updated user message to stream');
      } else {
        log('VoiceAssistantRepository - Warning: Could not find user message in _messages list for update');
      }

      if (markCompleted) {
        _inProgressUserMessages.remove(existingKey);
        log('VoiceAssistantRepository - Removed completed user message from _inProgressUserMessages');
      } else {
        _inProgressUserMessages[existingKey] = updated;
        log('VoiceAssistantRepository - Updated user message in _inProgressUserMessages');
      }
    } else if (!markCompleted) {
      // Create new user message from API event (for voice input without pre-existing text)
      log('VoiceAssistantRepository - No existing user message found, creating new one from API transcript');
      final message = ChatMessage(
        id: messageId,
        content: transcriptText,
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
        status: MessageStatus.streaming,
      );

      log('VoiceAssistantRepository - Created new user message from API: content="$transcriptText", status=${message.status.name}');
      _messages.add(message);
      log('VoiceAssistantRepository - Added new user message to list (index=${_messages.length - 1})');
      _messagesController.add(message);
      log('VoiceAssistantRepository - Emitted new user message to stream');
      _inProgressUserMessages[transcriptText] = message;
      log('VoiceAssistantRepository - Stored new user message in _inProgressUserMessages with key="$transcriptText"');
    } else {
      log('VoiceAssistantRepository - No existing user message found and markCompleted=true, skipping message creation');
    }
  }

  Uint8List? takeNewAudioChunk(String messageId, Uint8List? formattedAudio) {
    if (formattedAudio == null) {
      return null;
    }

    final totalBytes = formattedAudio.length;
    final processedBytes = _processedAudioBytes[messageId] ?? 0;
    _processedAudioBytes[messageId] = totalBytes;

    if (totalBytes <= processedBytes) {
      return null;
    }

    return Uint8List.fromList(formattedAudio.sublist(processedBytes));
  }

  void dispose() {
    log('VoiceAssistantRepository - Disposing resources');
    _messagesController.close();
    _inProgressMessages.clear();
    _inProgressUserMessages.clear();
    _processedAudioBytes.clear();
  }
}
