import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import '../widgets/chat_assistant_widget.dart';
import '../widgets/chat_bottom_sheet_widget.dart';
import '../../voice_assistant/widgets/global_mic_button.dart';

class MeditationSessionScreen extends StatelessWidget {
  const MeditationSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeditationBloc, MeditationState>(
      listener: (context, state) {
        // Handle any notifications or side effects here
      },
      builder: (context, _) {
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
                  children: const [
                    Expanded(
                      flex: 1,
                      child: _MicSurface(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ChatAssistantWidget(),
                    ),
                  ],
                )
              : const _MicSurface(),
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

class _MicSurface extends StatelessWidget {
  const _MicSurface();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            GlobalMicButton(),
          ],
        ),
      ),
    );
  }
}
