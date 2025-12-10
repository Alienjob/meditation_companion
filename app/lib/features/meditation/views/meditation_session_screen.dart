import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import '../widgets/chat_assistant_widget.dart';
import '../widgets/chat_bottom_sheet_widget.dart';
import '../widgets/ambient_sounds_bottom_sheet_widget.dart';
import '../widgets/ambient_sounds_panel.dart';
import '../../voice_assistant/widgets/assistant_mic_widget.dart';
import '../../voice_assistant/widgets/debug_assistant_panel.dart';

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
                icon: const Icon(Icons.music_note),
                tooltip: 'Ambient sounds',
                onPressed: () => AmbientSoundsBottomSheetWidget.show(context),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(
                      flex: 1,
                      child: _MicSurface(),
                    ),
                    Expanded(
                      flex: 1,
                      child: ChatAssistantWidget(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _AmbientPanelSurface(),
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
          children: [
            if (kDebugMode) const DebugAssistantPanel(),
            if (kDebugMode) const SizedBox(height: 16),
            const AssistantMicWidget(),
          ],
        ),
      ),
    );
  }
}

class _AmbientPanelSurface extends StatelessWidget {
  const _AmbientPanelSurface();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: const AmbientSoundsPanel(),
        ),
      ),
    );
  }
}
