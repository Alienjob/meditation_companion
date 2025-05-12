import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/voice_assistant/repository/voice_assistant_repository.dart';

class MockRealtimeClient extends Mock implements RealtimeClient {}

void main() {
  late MockRealtimeClient mockClient;
  late VoiceAssistantRepository repository;

  setUpAll(() {
    registerFallbackValue([ContentPart.inputText(text: '')]);
  });

  setUp(() {
    mockClient = MockRealtimeClient();
    repository = VoiceAssistantRepository(mockClient);
  });

  tearDown(() {
    repository.dispose();
  });

  group('VoiceAssistantRepository', () {
    test('sendMessage should add message to stream and call client', () async {
      // Arrange
      final message = ChatMessage(
        id: '1',
        content: 'Hello',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );

      when(() => mockClient.sendUserMessageContent(any()))
          .thenAnswer((_) async => true);

      // Act & Assert
      // Listen to stream before sending message
      expectLater(
        repository.getMessageStream(),
        emits(message),
      );

      await repository.sendMessage(message);

      // Verify message was sent to client
      verify(() => mockClient.sendUserMessageContent([
            ContentPart.inputText(text: message.content),
          ])).called(1);
    });

    test('handleConversationUpdated should handle new assistant message',
        () async {
      // Arrange
      const messageId = '1';
      const messageContent = 'Test response';
      final message = ItemMessage(
        id: messageId,
        role: ItemRole.assistant,
        status: ItemStatus.inProgress,
        content: [ContentPart.text(text: messageContent)],
      );

      final formattedItem = FormattedItem(
        item: message,
        formatted: FormattedProperty(
          text: messageContent,
          audio: Uint8List(0),
          transcript: '',
        ),
      );

      final event = RealtimeEvent.conversationUpdated(
        eventId: '1',
        result: EventHandlerResult(
          item: formattedItem,
        ),
      );

      // Act & Assert
      expectLater(
        repository.getMessageStream(),
        emits(
          isA<ChatMessage>()
              .having((m) => m.content, 'content', messageContent)
              .having((m) => m.isUser, 'isUser', false)
              .having((m) => m.senderId, 'senderId', 'assistant')
              .having((m) => m.id, 'id', messageId),
        ),
      );

      repository.handleConversationUpdated(
        event as RealtimeEventConversationUpdated,
      );
    });

    test(
        'handleConversationUpdated should update existing message with transcript',
        () async {
      // Arrange
      const messageId = '1';
      const initialContent = 'Initial';
      const transcriptDelta = ' update';

      final initialMessage = ItemMessage(
        id: messageId,
        role: ItemRole.assistant,
        status: ItemStatus.inProgress,
        content: [ContentPart.text(text: initialContent)],
      );

      final formattedItem = FormattedItem(
        item: initialMessage,
        formatted: FormattedProperty(
          text: initialContent,
          audio: Uint8List(0),
          transcript: '',
        ),
      );

      final initialEvent = RealtimeEvent.conversationUpdated(
        eventId: '1',
        result: EventHandlerResult(
          item: formattedItem,
        ),
      );

      final updateEvent = RealtimeEvent.conversationUpdated(
        eventId: '2',
        result: EventHandlerResult(
          item: formattedItem,
          delta: Delta(transcript: transcriptDelta),
        ),
      );

      // Act & Assert
      final messages = <ChatMessage>[];
      final subscription = repository.getMessageStream().listen(messages.add);

      repository.handleConversationUpdated(
        initialEvent as RealtimeEventConversationUpdated,
      );

      repository.handleConversationUpdated(
        updateEvent as RealtimeEventConversationUpdated,
      );

      await Future<void>.delayed(const Duration(milliseconds: 10));
      await subscription.cancel();

      expect(messages.length, 2);
      expect(messages[0].content, initialContent);
      expect(messages[1].content, initialContent + transcriptDelta);
      expect(messages[0].id, messageId);
      expect(messages[1].id, messageId);
    });

    test('handleConversationItemAppended should add new message', () async {
      // Arrange
      const messageId = '1';
      const messageContent = 'New message';
      final message = ItemMessage(
        id: messageId,
        role: ItemRole.user,
        status: ItemStatus.completed,
        content: [ContentPart.inputText(text: messageContent)],
      );

      final formattedItem = FormattedItem(
        item: message,
        formatted: FormattedProperty(
          text: messageContent,
          audio: Uint8List(0),
          transcript: '',
        ),
      );

      final event = RealtimeEvent.conversationItemAppended(
        eventId: '1',
        item: formattedItem,
      );

      // Act & Assert
      expectLater(
        repository.getMessageStream(),
        emits(
          isA<ChatMessage>()
              .having((m) => m.content, 'content', messageContent)
              .having((m) => m.isUser, 'isUser', true)
              .having((m) => m.senderId, 'senderId', 'user')
              .having((m) => m.id, 'id', messageId),
        ),
      );

      repository.handleConversationItemAppended(
        event as RealtimeEventConversationItemAppended,
      );
    });

    test('getMessages should return all messages', () async {
      // Arrange
      const userId = 'user1';
      const assistantId = 'assistant1';
      const userContent = 'Hello';
      const assistantContent = 'Hi there';

      when(() => mockClient.sendUserMessageContent(any()))
          .thenAnswer((_) async => true);

      final message1 = ChatMessage(
        id: userId,
        content: userContent,
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );

      final message2 = ItemMessage(
        id: assistantId,
        role: ItemRole.assistant,
        status: ItemStatus.completed,
        content: [ContentPart.text(text: assistantContent)],
      );

      // Add messages through repository methods
      await repository.sendMessage(message1);

      final formattedItem = FormattedItem(
        item: message2,
        formatted: FormattedProperty(
          text: assistantContent,
          audio: Uint8List(0),
          transcript: '',
        ),
      );

      repository.handleConversationUpdated(RealtimeEvent.conversationUpdated(
        eventId: '2',
        result: EventHandlerResult(item: formattedItem),
      ) as RealtimeEventConversationUpdated);

      // Act
      final messages = await repository.getMessages();

      // Assert
      expect(messages.length, 2);
      expect(messages[0].content, userContent);
      expect(messages[1].content, assistantContent);
      expect(messages[0].id, userId);
      expect(messages[1].id, assistantId);
    });
  });
}
