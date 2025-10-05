import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../meditation/bloc/meditation_bloc.dart';
import '../services/audio_service.dart';
import '../../voice_assistant/services/audio_recorder.dart';
import 'chat_assistant_widget.dart';

class ChatBottomSheetWidget extends StatelessWidget {
  const ChatBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            _buildHandle(context),
            Expanded(
              child: ChatAssistantWidget(scrollController: scrollController),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  static void show(BuildContext context) {
    final audioService = context.read<AudioService>();
    final audioRecorder = context.read<AudioRecorder>();
    final meditationBloc = context.read<MeditationBloc>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AudioService>.value(value: audioService),
          RepositoryProvider<AudioRecorder>.value(value: audioRecorder),
        ],
        child: BlocProvider<MeditationBloc>.value(
          value: meditationBloc,
          child: const ChatBottomSheetWidget(),
        ),
      ),
    );
  }
}
