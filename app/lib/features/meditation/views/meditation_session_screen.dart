import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_state.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';

class MeditationSessionScreen extends StatelessWidget {
  const MeditationSessionScreen({super.key});

  String _formatDuration(Duration duration) {
    if (duration.isNegative) {
      return '00:00';
    }
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  Duration _getTimeLeft(MeditationSession session) {
    return session.duration - session.currentTime;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MeditationBloc, MeditationState>(
      listener: (context, state) {
        if (state is MeditationCompleted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Meditation session completed!')),
          );
        } else if (state is MeditationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Meditation Session'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  // Timer Display
                  Center(
                    child: Text(
                      state is MeditationActive
                          ? _formatDuration(_getTimeLeft(state.session))
                          : '00:00',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Session Controls
                  if (state is! MeditationActive)
                    _DurationSelector(
                      onDurationSelected: (duration) {
                        context.read<MeditationBloc>().add(
                              StartMeditation(duration: duration),
                            );
                      },
                    )
                  else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (state.session.status == MeditationStatus.running)
                          IconButton(
                            icon: const Icon(Icons.pause),
                            iconSize: 48,
                            onPressed: () {
                              context
                                  .read<MeditationBloc>()
                                  .add(PauseMeditation());
                            },
                          )
                        else
                          IconButton(
                            icon: const Icon(Icons.play_arrow),
                            iconSize: 48,
                            onPressed: () {
                              context
                                  .read<MeditationBloc>()
                                  .add(ResumeMeditation());
                            },
                          ),
                        const SizedBox(width: 32),
                        IconButton(
                          icon: const Icon(Icons.stop),
                          iconSize: 48,
                          onPressed: () {
                            context
                                .read<MeditationBloc>()
                                .add(StopMeditation());
                          },
                        ),
                      ],
                    ),
                  const SizedBox(height: 32),
                  // Ambient Sounds
                  if (state is MeditationActive) ...[
                    Text(
                      'Ambient Sounds',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: _AmbientSoundControls(
                        settings: state.soundSettings,
                        onToggle: (soundId, active) {
                          context.read<MeditationBloc>().add(
                                ToggleSound(soundId: soundId, active: active),
                              );
                        },
                        onVolumeChanged: (soundId, volume) {
                          context.read<MeditationBloc>().add(
                                AdjustVolume(soundId: soundId, volume: volume),
                              );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DurationSelector extends StatelessWidget {
  final Function(Duration) onDurationSelected;

  const _DurationSelector({required this.onDurationSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Duration',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            _DurationButton(
              duration: const Duration(minutes: 5),
              onPressed: onDurationSelected,
            ),
            _DurationButton(
              duration: const Duration(minutes: 10),
              onPressed: onDurationSelected,
            ),
            _DurationButton(
              duration: const Duration(minutes: 15),
              onPressed: onDurationSelected,
            ),
            _DurationButton(
              duration: const Duration(minutes: 20),
              onPressed: onDurationSelected,
            ),
          ],
        ),
      ],
    );
  }
}

class _DurationButton extends StatelessWidget {
  final Duration duration;
  final Function(Duration) onPressed;

  const _DurationButton({
    required this.duration,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(duration),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: Text('${duration.inMinutes} min'),
    );
  }
}

class _AmbientSoundControls extends StatelessWidget {
  final Map<String, AmbientSoundSettings> settings;
  final Function(String, bool) onToggle;
  final Function(String, double) onVolumeChanged;

  const _AmbientSoundControls({
    required this.settings,
    required this.onToggle,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _SoundControl(
          title: 'Rain',
          soundId: 'rain',
          settings: settings['rain'] ?? const AmbientSoundSettings(),
          onToggle: onToggle,
          onVolumeChanged: onVolumeChanged,
        ),
        _SoundControl(
          title: 'Waves',
          soundId: 'waves',
          settings: settings['waves'] ?? const AmbientSoundSettings(),
          onToggle: onToggle,
          onVolumeChanged: onVolumeChanged,
        ),
        _SoundControl(
          title: 'Forest',
          soundId: 'forest',
          settings: settings['forest'] ?? const AmbientSoundSettings(),
          onToggle: onToggle,
          onVolumeChanged: onVolumeChanged,
        ),
      ],
    );
  }
}

class _SoundControl extends StatelessWidget {
  final String title;
  final String soundId;
  final AmbientSoundSettings settings;
  final Function(String, bool) onToggle;
  final Function(String, double) onVolumeChanged;

  const _SoundControl({
    required this.title,
    required this.soundId,
    required this.settings,
    required this.onToggle,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text(title),
              leading: Switch(
                value: settings.isActive,
                onChanged: (value) => onToggle(soundId, value),
              ),
            ),
            if (settings.isActive)
              Slider(
                value: settings.volume,
                onChanged: (value) => onVolumeChanged(soundId, value),
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: '${(settings.volume * 100).round()}%',
              ),
          ],
        ),
      ),
    );
  }
}
