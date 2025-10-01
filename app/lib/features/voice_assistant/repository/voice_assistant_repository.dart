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

  VoiceAssistantRepository(this._client);

  @override
  Stream<ChatMessage> getMessageStream() {
    return _messagesController.stream;
  }

  @override
  Future<List<ChatMessage>> getMessages() async {
    return List.from(_messages);
  }

  @override
  Future<void> sendMessage(ChatMessage message) async {
    if (!message.isUser) {
      _messages.add(message);
      _messagesController.add(message);
    }

    log('VoiceAssistantRepository - Sending message, client connected: ${_client.isConnected()}');

    await _client.sendUserMessageContent([
      ContentPart.inputText(text: message.content),
    ]);
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
      final content = markCompleted && initialContent.isEmpty
          ? '[voice response]'
          : initialContent;

      final message = ChatMessage(
        id: messageId,
        content: content,
        senderId: 'assistant',
        timestamp: DateTime.now(),
        isUser: false,
        status: status,
      );

      _inProgressMessages[messageId] = message;

      final index = _messages.indexWhere((m) => m.id == messageId);
      if (index == -1) {
        _messages.add(message);
      } else {
        _messages[index] = message;
      }

      _messagesController.add(message);
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

    _inProgressMessages[messageId] = updated;

    final index = _messages.indexWhere((m) => m.id == messageId);
    if (index == -1) {
      _messages.add(updated);
    } else {
      _messages[index] = updated;
    }

    _messagesController.add(updated);
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
  }
}
