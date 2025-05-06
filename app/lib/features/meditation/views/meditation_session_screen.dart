import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

class MeditationSessionScreen extends StatelessWidget {
  const MeditationSessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeditationBloc, MeditationState>(
      listener: (context, state) {
        // Handle any notifications or side effects here
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Meditation Session'),
          ),
          body: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, MeditationState state) {
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
