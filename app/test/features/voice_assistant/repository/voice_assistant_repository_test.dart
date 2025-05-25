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

    test('adds message to history when sending', () async {
      final message = ChatMessage(
        id: 'test_id',
        content: 'Hello',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );

      await repository.sendMessage(message);

      final messages = await repository.getMessages();
      expect(messages, contains(message));
    });

    test('cleans up resources on dispose', () {
      repository.dispose();

      // After dispose, any attempt to send messages should throw
      expect(
        () => repository.sendMessage(ChatMessage(
          id: 'test_id',
          content: 'Hello',
          senderId: 'user',
          timestamp: DateTime.now(),
          isUser: true,
        )),
        throwsStateError,
      );
    });
  });
}
