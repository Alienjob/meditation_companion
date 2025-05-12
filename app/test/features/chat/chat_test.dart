import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_event.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/chat/repository/mock_chat_repository.dart';

void main() {
  late MockChatRepository chatRepository;
  late ChatBloc chatBloc;

  setUp(() {
    // Use very small delay to keep tests fast
    chatRepository = MockChatRepository(const Duration(milliseconds: 20));
    chatBloc = ChatBloc(chatRepository);
  });

  tearDown(() {
    chatBloc.close();
  });

  test('initial state is ChatInitial', () {
    expect(chatBloc.state, isA<ChatInitial>());
  });

  group('ChatStreamConnected', () {
    test('emits ChatConnected with empty messages when stream is connected',
        () async {
      chatBloc.add(ChatStreamConnected());

      await expectLater(
        chatBloc.stream,
        emits(isA<ChatConnected>().having(
          (state) => state.messages,
          'messages',
          isEmpty,
        )),
      );
    });
  });

  group('SendChatMessage', () {
    test('emits states in correct order with message content', () async {
      const message = 'Hello';
      final states = <ChatState>[];

      // Subscribe to the stream to capture all states
      final subscription = chatBloc.stream.listen(states.add);

      // First connect
      chatBloc.add(ChatStreamConnected());

      // Wait for connection
      await Future.delayed(const Duration(milliseconds: 30));

      // Send message
      chatBloc.add(SendChatMessage(message));

      // Wait for all states to be emitted
      await Future.delayed(const Duration(milliseconds: 100));

      // Cleanup subscription
      await subscription.cancel();

      // Verify states
      expect(states.length, greaterThanOrEqualTo(3));
      expect(states[0], isA<ChatConnected>());
      expect(states[1], isA<MessageSending>());
      expect(states[2], isA<MessageSent>());

      // Verify the last state has AI response
      final lastState = states.last;
      expect(lastState, isA<ChatConnected>());
      expect((lastState as ChatConnected).messages.length, 2);
      expect(lastState.messages.first.content, message);
      expect(lastState.messages.first.isUser, true);
      expect(lastState.messages.last.isUser, false);
    });
  });

  group('ChatStreamDisconnected', () {
    test('emits ChatDisconnected with current messages',
        timeout: Timeout(Duration(seconds: 3)), () async {
      final states = <ChatState>[];

      // Subscribe to the stream to capture all states
      final subscription = chatBloc.stream.listen(states.add);

      // First connect
      chatBloc.add(ChatStreamConnected());

      // Wait for connection
      await Future.delayed(const Duration(milliseconds: 30));

      // Create a user message
      final userMessage = ChatMessage(
        id: '1',
        content: 'Test',
        senderId: 'user',
        timestamp: DateTime.now(),
        isUser: true,
      );

      // Send message and wait for processing
      await chatRepository.sendMessage(userMessage);
      await Future.delayed(const Duration(milliseconds: 50));

      // Now disconnect
      chatBloc.add(ChatStreamDisconnected());

      // Wait for disconnection
      await Future.delayed(const Duration(milliseconds: 30));

      // Cleanup subscription
      await subscription.cancel();

      // Find the disconnected state (should be the last one)
      final disconnectedState = states.lastWhere((s) => s is ChatDisconnected);
      expect(disconnectedState, isA<ChatDisconnected>());

      // Check the messages in the disconnected state
      final messages = (disconnectedState as ChatDisconnected).messages;
      expect(messages.length, 2);
      expect(messages.first.isUser, true);
      expect(messages.last.isUser, false);
    });
  });

  group('ChatMessage', () {
    test('correctly serializes and deserializes', () {
      final original = ChatMessage(
        id: '1',
        content: 'Test message',
        senderId: 'user1',
        timestamp: DateTime(2025),
        isUser: true,
      );

      final json = original.toJson();
      final deserialized = ChatMessage.fromJson(json);

      expect(deserialized, equals(original));
    });
  });
}
