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
    repository = VoiceAssistantRepository(client);

    when(() => client.sendUserMessageContent(any()))
        .thenAnswer((_) async => true);
    when(() => client.isConnected()).thenReturn(true);
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

    test('response done without transcript adds placeholder', () async {
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
      expect(messages.first.content, '[voice response]');
      expect(messages.first.status, MessageStatus.completed);
    });
  });
}
