import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../bloc/chat_event.dart';
import '../repository/mock_chat_repository.dart';
import 'chat_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(
        // Using mock repository for demonstration
        // This could be injected or replaced with a real implementation
        MockChatRepository(),
      )..add(ChatStreamConnected()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meditation Chat'),
          elevation: 0,
        ),
        body: const SafeArea(
          child: ChatWidget(),
        ),
      ),
    );
  }
}
