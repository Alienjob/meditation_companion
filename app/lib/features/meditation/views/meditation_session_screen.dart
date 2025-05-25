import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/chat/repository/chat_repository.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/chat/bloc/chat_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_event.dart';
import 'package:meditation_companion/features/chat/views/chat_widget.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_bloc.dart';
import 'package:meditation_companion/features/voice_assistant/repository/voice_assistant_repository.dart';
import 'package:meditation_companion/features/voice_assistant/services/mock_audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/voice_assistant_widget.dart';

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
                  onPressed: () => _showChatBottomSheet(context),
                ),
            ],
          ),
          body: isWideScreen
              ? Row(
                  children: [
                    // Main meditation content
                    Expanded(
                      flex: 2,
                      child: _buildMeditationContent(context, state),
                    ),
                    // Chat and voice assistant panel
                    Expanded(
                      flex: 1,
                      child: _buildChatPanel(context),
                    ),
                  ],
                )
              : _buildMeditationContent(context, state),
          floatingActionButton: !isWideScreen
              ? FloatingActionButton(
                  onPressed: () => _showChatBottomSheet(context),
                  child: const Icon(Icons.chat),
                )
              : null,
        );
      },
    );
  }

  Widget _buildMeditationContent(BuildContext context, MeditationState state) {
    if (state is MeditationCompleted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Meditation session completed!'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<MeditationBloc>().add(const StopMeditation());
              },
              child: const Text('Start New Session'),
            ),
          ],
        ),
      );
    }

    if (state is MeditationActive) {
      return _buildActiveSession(context, state);
    }

    return _buildInitialState(context);
  }

  Widget _buildChatPanel(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        children: [
          // Chat header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.assistant),
                SizedBox(width: 8),
                Text(
                  'Meditation Assistant',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Chat and voice assistant
          Expanded(
            child: _buildChatWithVoiceAssistant(context),
          ),
        ],
      ),
    );
  }

  Widget _buildChatWithVoiceAssistant(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ChatBloc(InMemoryChatRepository())..add(ChatStreamConnected()),
        ),
        BlocProvider(
          create: (context) {
            final client = RealtimeClient(
              apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
            );

            final repository = VoiceAssistantRepository(client);
            final chatBloc = context.read<ChatBloc>();

            // Подключаем стрим сообщений из голосового помощника к чату
            repository.getMessageStream().listen((message) {
              chatBloc.add(ChatMessageReceived(message));
            });

            return AssistantBloc(
              chatBloc: chatBloc,
              audioService: context.read<AudioService>(),
              recorder: MockAudioRecorder(),
              client: client,
            );
          },
        ),
      ],
      child: const Column(
        children: [
          // Chat messages area
          Expanded(
            child: ChatWidget(),
          ),
          // Voice controls at bottom
          Padding(
            padding: EdgeInsets.all(16.0),
            child: VoiceAssistantWidget(),
          ),
        ],
      ),
    );
  }

  void _showChatBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
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
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Chat panel content
              Expanded(
                child: _buildChatPanel(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('00:00', style: TextStyle(fontSize: 48)),
          const SizedBox(height: 32),
          const Text('Select Duration'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DurationButton(
                  minutes: 1, onPressed: () => _startSession(context, 1)),
              _DurationButton(
                  minutes: 5, onPressed: () => _startSession(context, 5)),
              _DurationButton(
                  minutes: 10, onPressed: () => _startSession(context, 10)),
              _DurationButton(
                  minutes: 15, onPressed: () => _startSession(context, 15)),
              _DurationButton(
                  minutes: 20, onPressed: () => _startSession(context, 20)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActiveSession(BuildContext context, MeditationActive state) {
    final minutes =
        state.session.currentTime.inMinutes.toString().padLeft(2, '0');
    final seconds =
        (state.session.currentTime.inSeconds % 60).toString().padLeft(2, '0');
    final timeDisplay = '$minutes:$seconds';

    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(timeDisplay, style: const TextStyle(fontSize: 48)),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state.session.status == MeditationStatus.running)
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.pause),
                        onPressed: () => context
                            .read<MeditationBloc>()
                            .add(const PauseMeditation()),
                      )
                    else
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () => context
                            .read<MeditationBloc>()
                            .add(const ResumeMeditation()),
                      ),
                    const SizedBox(width: 16),
                    IconButton(
                      iconSize: 48,
                      icon: const Icon(Icons.stop),
                      onPressed: () => context
                          .read<MeditationBloc>()
                          .add(const StopMeditation()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildAmbientSounds(context, state),
      ],
    );
  }

  Widget _buildAmbientSounds(BuildContext context, MeditationActive state) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Ambient Sounds',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildSoundControl(
              context, 'Rain', 'rain', state.soundSettings['rain']),
          _buildSoundControl(
              context, 'Forest', 'forest', state.soundSettings['forest']),
        ],
      ),
    );
  }

  Widget _buildSoundControl(BuildContext context, String label, String soundId,
      AmbientSoundSettings? settings) {
    final isActive = settings?.isActive ?? false;
    final volume = settings?.volume ?? 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label),
          const SizedBox(width: 16),
          Switch(
            value: isActive,
            onChanged: (value) {
              context.read<MeditationBloc>().add(
                    ToggleSound(soundId: soundId, active: value),
                  );
            },
          ),
          if (isActive)
            Expanded(
              child: Slider(
                value: volume,
                onChanged: (value) {
                  context.read<MeditationBloc>().add(
                        AdjustVolume(soundId: soundId, volume: value),
                      );
                },
              ),
            ),
        ],
      ),
    );
  }

  void _startSession(BuildContext context, int minutes) {
    context.read<MeditationBloc>().add(
          StartMeditation(duration: Duration(minutes: minutes)),
        );
  }
}

class _DurationButton extends StatelessWidget {
  final int minutes;
  final VoidCallback onPressed;

  const _DurationButton({
    required this.minutes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('$minutes min'),
    );
  }
}
