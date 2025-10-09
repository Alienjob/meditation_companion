import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import '../widgets/meditation_content_widget.dart';
import '../widgets/chat_assistant_widget.dart';
import '../widgets/chat_bottom_sheet_widget.dart';

class MeditationSessionScreen extends StatelessWidget {
  const MeditationSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeditationBloc, MeditationState>(
      listener: (context, state) {
        // Handle any notifications or side effects here
      },
      builder: (context, state) {
        final isWideScreen = MediaQuery.of(context).size.width > 800;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Meditation Session'),
            actions: [
              if (!isWideScreen)
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () => ChatBottomSheetWidget.show(context),
                ),
              IconButton(
                icon: const Icon(Icons.logout),
                tooltip: 'Sign out',
                onPressed: () =>
                    context.read<AuthBloc>().add(SignOutRequested()),
              ),
            ],
          ),
          body: isWideScreen
              ? Row(
                  children: [
                    // Main meditation content
                    Expanded(
                      flex: 2,
                      child: MeditationContentWidget(state: state),
                    ),
                    // Chat and voice assistant panel
                    const Expanded(
                      flex: 1,
                      child: ChatAssistantWidget(),
                    ),
                  ],
                )
              : MeditationContentWidget(state: state),
          floatingActionButton: !isWideScreen
              ? FloatingActionButton(
                  onPressed: () => ChatBottomSheetWidget.show(context),
                  child: const Icon(Icons.chat),
                )
              : null,
        );
      },
    );
  }
}
