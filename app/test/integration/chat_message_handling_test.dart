import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/voice_assistant/repository/voice_assistant_repository.dart';

class MockRealtimeClient extends Mock implements RealtimeClient {}

void main() {
  group('Chat Message Handling Integration', () {
    late VoiceAssistantRepository repository;
    late MockRealtimeClient client;

    setUp(() {
      client = MockRealtimeClient();
      when(() => client.isConnected()).thenReturn(true);
      when(() => client.sendUserMessageContent(any()))
          .thenAnswer((_) async => true);
      repository = VoiceAssistantRepository(client);
    });

    tearDown(() {
      repository.dispose();
    });

    test(
        'assistant voice-only response without transcript creates no message initially',
        () async {
      // Simulate voice-only assistant response with no text transcript
      repository.handleConversationItemAppended(
        RealtimeEventConversationItemAppended(
          eventId: 'evt_1',
          item: FormattedItem(
            item: ItemMessage(
              id: 'assistant_voice_1',
              object: ObjectType.realtimeItem,
              type: ItemType.message,
              status: ItemStatus.inProgress,
              role: ItemRole.assistant,
              content: const [],
            ),
            formatted: FormattedProperty(
              transcript: '',
              text: '',
              audio: Uint8List.fromList([1, 2, 3, 4]),
            ),
          ),
        ),
      );

      // No message should be created yet since there's no text content
      final messages = await repository.getMessages();
      expect(messages, hasLength(0));
    });

    test('assistant response with transcript shows text content', () async {
      // Simulate assistant response with text transcript
      repository.handleResponseTextDelta(
        const RealtimeEventResponseTextDelta(
          eventId: 'evt_1',
          responseId: 'resp',
          itemId: 'assistant_text_1',
          outputIndex: 0,
          contentIndex: 0,
          delta: 'Hello, I can help',
        ),
      );

      repository.handleResponseTextDone(
        const RealtimeEventResponseTextDone(
          eventId: 'evt_2',
          responseId: 'resp',
          itemId: 'assistant_text_1',
          outputIndex: 0,
          contentIndex: 0,
          text: 'Hello, I can help you with meditation.',
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, 'Hello, I can help you with meditation.');
      expect(messages.first.isUser, isFalse);
      expect(messages.first.status, MessageStatus.completed);
    });

    test('user text message gets updated with API transcript', () async {
      // User sends text message
      final userMessage = ChatMessage(
        id: 'user_1',
        content: 'I need help',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );
      await repository.sendMessage(userMessage);

      // API event comes back with full transcript
      repository.handleConversationItemCompleted(
        RealtimeEventConversationItemCompleted(
          eventId: 'evt_1',
          item: FormattedItem(
            item: ItemMessage(
              id: 'api_user_1',
              object: ObjectType.realtimeItem,
              type: ItemType.message,
              status: ItemStatus.completed,
              role: ItemRole.user,
              content: const [],
            ),
            formatted: FormattedProperty(
              transcript: 'I need help with my meditation practice',
              text: '',
              audio: Uint8List(0),
            ),
          ),
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1)); // Should still be one message
      expect(messages.first.content, 'I need help with my meditation practice');
      expect(messages.first.isUser, isTrue);
      expect(messages.first.status, MessageStatus.completed);
    });

    test('voice-only user input creates new message from API event', () async {
      // Simulate pure voice input (no pre-existing text message)
      repository.handleConversationUpdated(
        RealtimeEventConversationUpdated(
          eventId: 'evt_1',
          result: EventHandlerResult(
            item: FormattedItem(
              item: ItemMessage(
                id: 'voice_user_1',
                object: ObjectType.realtimeItem,
                type: ItemType.message,
                status: ItemStatus.inProgress,
                role: ItemRole.user,
                content: const [],
              ),
              formatted: FormattedProperty(
                transcript: 'This is my voice message',
                text: '',
                audio: Uint8List(0),
              ),
            ),
            delta: Delta(
              transcript: 'This is my voice message',
              text: null,
              audio: null,
            ),
          ),
        ),
      );

      final messages = await repository.getMessages();
      expect(messages, hasLength(1));
      expect(messages.first.content, 'This is my voice message');
      expect(messages.first.isUser, isTrue);
      expect(messages.first.status, MessageStatus.streaming);
    });
  });
}
