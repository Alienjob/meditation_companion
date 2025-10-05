import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/voice_assistant/repository/voice_assistant_repository.dart';

class MockRealtimeClient extends Mock implements RealtimeClient {}

void main() {
  late VoiceAssistantRepository repository;
  late MockRealtimeClient client;

  setUpAll(() {
    // Register fallback value for ContentPart
    registerFallbackValue(const ContentPart.inputText(text: 'test'));
  });

  setUp(() {
    client = MockRealtimeClient();

    when(() => client.sendUserMessageContent(any()))
        .thenAnswer((_) async => true);
    when(() => client.isConnected()).thenReturn(true);

    repository = VoiceAssistantRepository(client);
  });

  group('VoiceAssistantRepository', () {
    test('initial messages list is empty', () async {
      final messages = await repository.getMessages();
      expect(messages, isEmpty);
    });

    test('sends message to OpenAI client', () async {
      final message = ChatMessage(
        id: 'test_id',
        content: 'Hello',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );

      await repository.sendMessage(message);

      verify(() => client.sendUserMessageContent(any())).called(1);
    });

    test('exposes message stream', () {
      expect(repository.getMessageStream(), isA<Stream<ChatMessage>>());
    });

    test('cleans up resources on dispose', () {
      expect(repository.dispose, returnsNormally);
    });
  });

  group('assistant transcript handling', () {
    test('creates streaming message on first transcript delta', () async {
      repository.handleResponseTextDelta(
        const RealtimeEventResponseTextDelta(
          eventId: 'evt_1',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          delta: 'Hello',
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, 'Hello');
      expect(messages.first.status, MessageStatus.streaming);
    });

    test('appends transcript deltas to existing message', () async {
      repository.handleResponseTextDelta(
        const RealtimeEventResponseTextDelta(
          eventId: 'evt_1',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          delta: 'Hello',
        ),
      );

      repository.handleResponseTextDelta(
        const RealtimeEventResponseTextDelta(
          eventId: 'evt_2',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          delta: ' there',
        ),
      );

      final messages = await repository.getMessages();
      expect(messages.single.content, 'Hello there');
      expect(messages.single.status, MessageStatus.streaming);
    });

    test('response done finalises message and status', () async {
      repository.handleResponseTextDelta(
        const RealtimeEventResponseTextDelta(
          eventId: 'evt_1',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          delta: 'temp',
        ),
      );

      repository.handleResponseTextDone(
        const RealtimeEventResponseTextDone(
          eventId: 'evt_2',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          text: 'Final text',
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, 'Final text');
      expect(messages.first.status, MessageStatus.completed);
    });

    test('response done without transcript creates message with empty content',
        () async {
      repository.handleResponseTextDone(
        const RealtimeEventResponseTextDone(
          eventId: 'evt_1',
          responseId: 'resp',
          itemId: 'item_1',
          outputIndex: 0,
          contentIndex: 0,
          text: '',
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, '');
      expect(messages.first.status, MessageStatus.completed);
    });
  });

  group('user message handling', () {
    test('updates existing user message with transcript from API event',
        () async {
      // First, send a user message
      final userMessage = ChatMessage(
        id: 'user_1',
        content: 'Hello',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );
      await repository.sendMessage(userMessage);

      // Then simulate API event with transcript
      repository.handleConversationItemCompleted(
        RealtimeEventConversationItemCompleted(
          eventId: 'evt_1',
          item: FormattedItem(
            item: ItemMessage(
              id: 'api_item_1',
              object: ObjectType.realtimeItem,
              type: ItemType.message,
              status: ItemStatus.completed,
              role: ItemRole.user,
              content: const [],
            ),
            formatted: FormattedProperty(
              transcript: 'Hello there',
              text: '',
              audio: Uint8List(0),
            ),
          ),
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1)); // Should still be 1 message, just updated
      expect(messages.first.content,
          'Hello there'); // Updated with full transcript
      expect(messages.first.status, MessageStatus.completed);
    });

    test('creates new user message from voice input API event', () async {
      // Simulate API event for voice input without pre-existing message
      repository.handleConversationItemAppended(
        RealtimeEventConversationItemAppended(
          eventId: 'evt_1',
          item: FormattedItem(
            item: ItemMessage(
              id: 'voice_item_1',
              object: ObjectType.realtimeItem,
              type: ItemType.message,
              status: ItemStatus.inProgress,
              role: ItemRole.user,
              content: const [],
            ),
            formatted: FormattedProperty(
              transcript: 'This is a voice message',
              text: '',
              audio: Uint8List(0),
            ),
          ),
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, 'This is a voice message');
      expect(messages.first.isUser, isTrue);
      expect(messages.first.status, MessageStatus.streaming);
    });
  });

  group('audio chunk tracking', () {
    test('returns null when formatted audio missing', () {
      final chunk = repository.takeNewAudioChunk('item', null);
      expect(chunk, isNull);
    });

    test('returns incremental audio slices per message', () {
      final firstChunk = repository.takeNewAudioChunk(
        'item',
        Uint8List.fromList([1, 2, 3]),
      );
      final repeatChunk = repository.takeNewAudioChunk(
        'item',
        Uint8List.fromList([1, 2, 3]),
      );
      final extendedChunk = repository.takeNewAudioChunk(
        'item',
        Uint8List.fromList([1, 2, 3, 4, 5]),
      );

      expect(firstChunk?.toList(), [1, 2, 3]);
      expect(repeatChunk, isNull);
      expect(extendedChunk?.toList(), [4, 5]);
    });
  });
}
