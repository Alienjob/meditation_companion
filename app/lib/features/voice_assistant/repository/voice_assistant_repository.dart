import 'dart:async';
import 'dart:typed_data';

import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';

import '../../chat/models/chat_message.dart';
import '../../chat/repository/chat_repository.dart';

const _voiceDomain = 'Voice Assistant';
const _repoLifecycle = 'Voice Assistant Repository Lifecycle';
const _repoStream = 'Voice Assistant Repository Stream';
const _repoUserMessage = 'Voice Assistant Repository User Message';
const _repoAssistantMessage = 'Voice Assistant Repository Assistant Message';
const _repoOpenAi = 'Voice Assistant Repository OpenAI';

void _repoDebug(String feature, String message) {
  logDebug(
    message,
    domain: _voiceDomain,
    feature: feature,
    context: VoiceAssistantRepository,
  );
}

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

  _repoDebug(
    _repoOpenAi,
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
  final Map<String, ChatMessage> _inProgressUserMessagesByConversationId = {};

  VoiceAssistantRepository(this._client) {
    _repoDebug(
      _repoLifecycle,
      'VoiceAssistantRepository - Constructor initialized at ${DateTime.now().toIso8601String()}',
    );
    _repoDebug(
      _repoLifecycle,
      'VoiceAssistantRepository - Client connected: ${_client.isConnected()}',
    );
  }

  @override
  Stream<ChatMessage> getMessageStream() {
    _repoDebug(
      _repoStream,
      'VoiceAssistantRepository - getMessageStream called at ${DateTime.now().toIso8601String()}',
    );
    _repoDebug(
      _repoStream,
      'VoiceAssistantRepository - Stream controller is closed: ${_messagesController.isClosed}',
    );
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    final timestamp = DateTime.now().toIso8601String();
    _repoDebug(
      _repoUserMessage,
      'VoiceAssistantRepository - TEXT MESSAGE SEND START: id=${message.id}, content="${message.content.length > 50 ? message.content.substring(0, 50) + '...' : message.content}", isUser=${message.isUser} at $timestamp',
    );
    _repoDebug(
      _repoUserMessage,
      'VoiceAssistantRepository - TEXT MESSAGE TYPE: This is a text message from UI, should create awaiting message',
    );

    if (!message.isUser) {
      _messages.add(message);
      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Added assistant message to local list',
      );
      _messagesController.add(message);
      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Emitted assistant message to stream',
      );
    } else {
      // For user messages, add to chat immediately but also track for API event matching
      _repoDebug(
        _repoUserMessage,
        'VoiceAssistantRepository - TEXT MESSAGE: Adding to _messages list at ${DateTime.now().toIso8601String()}',
      );
      _messages.add(message);
      _repoDebug(
        _repoUserMessage,
        'VoiceAssistantRepository - TEXT MESSAGE: Added to local list, index=${_messages.length - 1}, total=${_messages.length}',
      );

      _repoDebug(
        _repoUserMessage,
        'VoiceAssistantRepository - TEXT MESSAGE: Emitting to stream at ${DateTime.now().toIso8601String()}',
      );
      _messagesController.add(message);
      _repoDebug(
        _repoUserMessage,
        'VoiceAssistantRepository - TEXT MESSAGE: Emitted to stream, controller closed=${_messagesController.isClosed}',
      );

      // Store for potential transcript updates from API events
      _inProgressUserMessages[message.content] = message;
      _repoDebug(
        _repoUserMessage,
        'VoiceAssistantRepository - TEXT MESSAGE: Stored as awaiting message with key="${message.content}"',
      );
    }

    _repoDebug(
      _repoStream,
      'VoiceAssistantRepository - Total messages in list: ${_messages.length}',
    );
    _repoDebug(
      _repoStream,
      'VoiceAssistantRepository - Stream controller closed: ${_messagesController.isClosed}',
    );
    _repoDebug(
      _repoStream,
      'VoiceAssistantRepository - Sending message, client connected: ${_client.isConnected()}',
    );

    await _client.sendUserMessageContent([
      ContentPart.inputText(text: message.content),
    ]);
    _repoDebug(
      _repoOpenAi,
      'VoiceAssistantRepository - Message sent to OpenAI client at ${DateTime.now().toIso8601String()}',
    );
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
          text: item.formatted?.text,
          deltaText: delta?.text,
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
          text: item.formatted?.text,
          deltaText: null,
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
          text: item.formatted?.text,
          deltaText: null,
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

    _repoDebug(
      _repoOpenAi,
      'OpenAI response text delta: item=${event.itemId} deltaLen=${delta.length}',
    );
  }

  void handleResponseTextDone(RealtimeEventResponseTextDone event) {
    _upsertAssistantMessage(
      event.itemId,
      initialText: event.text,
      appendText: null,
      markCompleted: true,
    );
    _repoDebug(
      _repoOpenAi,
      'OpenAI response text done: item=${event.itemId} textLen=${event.text.length}',
    );
  }

  void _upsertAssistantMessage(
    String messageId, {
    String? initialText,
    String? appendText,
    required bool markCompleted,
  }) {
    _repoDebug(
      _repoAssistantMessage,
      'VoiceAssistantRepository - _upsertAssistantMessage: messageId=$messageId, initialText="${initialText ?? '<null>'}", appendText="${appendText ?? '<null>'}", markCompleted=$markCompleted at ${DateTime.now().toIso8601String()}',
    );

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

      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Creating new assistant message: content="${content.length > 50 ? content.substring(0, 50) + '...' : content}", status=${status.name}',
      );
      _inProgressMessages[messageId] = message;

      final index = _messages.indexWhere((m) => m.id == messageId);
      if (index == -1) {
        _messages.add(message);
        _repoDebug(
          _repoAssistantMessage,
          'VoiceAssistantRepository - Added new assistant message to list (index=${_messages.length - 1})',
        );
      } else {
        _messages[index] = message;
        _repoDebug(
          _repoAssistantMessage,
          'VoiceAssistantRepository - Updated existing assistant message at index $index',
        );
      }

      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Emitting assistant message to stream: id=$messageId',
      );
      _messagesController.add(message);
      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Assistant message emitted, stream closed: ${_messagesController.isClosed}',
      );
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

    _repoDebug(
      _repoAssistantMessage,
      'VoiceAssistantRepository - Updating existing assistant message: old content="${existing.content.length > 30 ? existing.content.substring(0, 30) + '...' : existing.content}" -> new content="${content.length > 30 ? content.substring(0, 30) + '...' : content}", status=${status.name}',
    );
    _inProgressMessages[messageId] = updated;

    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index == -1) {
      _messages.add(updated);
      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Added updated assistant message to list (new index=${_messages.length - 1})',
      );
    } else {
      _messages[index] = updated;
      _repoDebug(
        _repoAssistantMessage,
        'VoiceAssistantRepository - Updated assistant message at index $index',
      );
    }

    _repoDebug(
      _repoAssistantMessage,
      'VoiceAssistantRepository - Emitting updated assistant message to stream: id=$messageId',
    );
    _messagesController.add(updated);
    _repoDebug(
      _repoAssistantMessage,
      'VoiceAssistantRepository - Updated assistant message emitted, stream closed: ${_messagesController.isClosed}',
    );
  }

  void _upsertUserMessage(
    String messageId, {
    String? transcript,
    String? deltaTranscript,
    String? text,
    String? deltaText,
    required bool markCompleted,
  }) {
    final timestamp = DateTime.now().toIso8601String();
    _repoDebug(
      _repoUserMessage,
      'VoiceAssistantRepository - _upsertUserMessage START: messageId=$messageId, transcript="${transcript ?? '<null>'}", deltaTranscript="${deltaTranscript ?? '<null>'}", markCompleted=$markCompleted at $timestamp',
    );
    _repoDebug(
      _repoUserMessage,
      'VoiceAssistantRepository - MESSAGE TYPE CHECK: Is this voice message (should create by ID) or text message (should find awaiting)?',
    );

    final candidateTextRaw = transcript ?? deltaTranscript ?? text ?? deltaText;
    final candidateText = candidateTextRaw?.trim();
    final hasCandidateText = candidateText != null && candidateText.isNotEmpty;

    final String? effectiveCandidateText =
        hasCandidateText ? candidateText : null;

    ChatMessage? existingMessage =
        _inProgressUserMessagesByConversationId[messageId];
    int existingIndex = -1;

    if (existingMessage == null) {
      existingIndex = _messages.indexWhere((m) => m.id == messageId);
      if (existingIndex != -1) {
        existingMessage = _messages[existingIndex];
      }
    } else {
      existingIndex = _messages.indexWhere((m) => m.id == existingMessage!.id);
    }

    String? matchedContentKey;
    if (existingMessage == null && effectiveCandidateText != null) {
      for (final entry in _inProgressUserMessages.entries) {
        final existingContent = entry.value.content.trim();
        final newContent = effectiveCandidateText;
        if (existingContent.isEmpty && newContent.isEmpty) {
          existingMessage = entry.value;
          matchedContentKey = entry.key;
          break;
        }
        if (existingContent.isEmpty || newContent.isEmpty) continue;
        if (existingContent == newContent ||
            (existingContent.length > 5 &&
                newContent.contains(existingContent)) ||
            (newContent.length > 5 && existingContent.contains(newContent))) {
          existingMessage = entry.value;
          matchedContentKey = entry.key;
          break;
        }
      }

      if (existingMessage != null && existingIndex == -1) {
        final targetId = existingMessage.id;
        existingIndex = _messages.indexWhere((m) => m.id == targetId);
      }
    }

    final String contentToUse = effectiveCandidateText ?? '[voice message]';

    if (existingMessage == null) {
      final newMessage = ChatMessage(
        id: messageId,
        content: contentToUse,
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
        status:
            markCompleted ? MessageStatus.completed : MessageStatus.streaming,
      );

      _messages.add(newMessage);
      _messagesController.add(newMessage);
      _inProgressUserMessagesByConversationId[messageId] = newMessage;
      if (effectiveCandidateText != null) {
        _inProgressUserMessages[effectiveCandidateText] = newMessage;
      } else {
        _repoDebug(
          _repoUserMessage,
          'VoiceAssistantRepository - Created placeholder user message for streaming item=$messageId',
        );
      }
      return;
    }

    final updatedContent = hasCandidateText
        ? contentToUse
        : (existingMessage.content.isEmpty
            ? contentToUse
            : existingMessage.content);

    final shouldComplete = markCompleted && hasCandidateText;

    final updated = existingMessage.copyWith(
      content: updatedContent,
      status:
          shouldComplete ? MessageStatus.completed : MessageStatus.streaming,
    );

    if (existingIndex != -1) {
      _messages[existingIndex] = updated;
    } else {
      _messages.add(updated);
    }

    _messagesController.add(updated);
    _inProgressUserMessagesByConversationId[messageId] = updated;

    if (matchedContentKey != null) {
      _inProgressUserMessages.remove(matchedContentKey);
    }
    if (effectiveCandidateText != null) {
      _inProgressUserMessages
          .removeWhere((key, value) => value.id == updated.id);
      _inProgressUserMessages[effectiveCandidateText] = updated;
    }

    if (shouldComplete) {
      _inProgressUserMessagesByConversationId.remove(messageId);
      _inProgressUserMessages
          .removeWhere((key, value) => value.id == updated.id);
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
    _repoDebug(
      _repoLifecycle,
      'VoiceAssistantRepository - Disposing resources',
    );
    _messagesController.close();
    _inProgressMessages.clear();
    _inProgressUserMessages.clear();
    _inProgressUserMessagesByConversationId.clear();
    _processedAudioBytes.clear();
  }
}
