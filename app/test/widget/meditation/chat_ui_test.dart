import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_event.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/chat/models/chat_message.dart';
import 'package:meditation_companion/features/chat/views/chat_widget.dart';

class MockChatBloc extends MockBloc<ChatEvent, ChatState> implements ChatBloc {}

void main() {
  late MockChatBloc chatBloc;

  setUp(() {
    chatBloc = MockChatBloc();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<ChatBloc>.value(
          value: chatBloc,
          child: const ChatWidget(),
        ),
      ),
    );
  }

  group('ChatWidget', () {
    testWidgets('displays empty state when no messages', (tester) async {
      const state = ChatConnected([]);

      whenListen(
        chatBloc,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // Should not crash and render empty chat
      expect(find.byType(ChatWidget), findsOneWidget);
    });

    testWidgets('displays messages when available', (tester) async {
      final messages = [
        ChatMessage(
          id: '1',
          content: 'Hello, how can I help you with meditation?',
          senderId: 'assistant',
          timestamp: DateTime.now(),
          isUser: false,
        ),
        ChatMessage(
          id: '2',
          content: 'I need help starting meditation',
          senderId: 'user',
          timestamp: DateTime.now(),
          isUser: true,
        ),
      ];

      final state = ChatConnected(messages);

      whenListen(
        chatBloc,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('Hello, how can I help you with meditation?'),
          findsOneWidget);
      expect(find.text('I need help starting meditation'), findsOneWidget);
    });

    testWidgets('shows loading state with empty list', (tester) async {
      final state = ChatLoading();

      whenListen(
        chatBloc,
        Stream.value(state),
        initialState: state,
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      // ChatWidget shows empty message list for loading state, not a spinner
      expect(find.byType(ChatWidget), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      // Should not find any message text since it's loading
      expect(find.text('Hello, how can I help you with meditation?'),
          findsNothing);
    });
  });
}
