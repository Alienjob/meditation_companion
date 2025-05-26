import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/meditation_bloc.dart';
import '../bloc/meditation_event.dart';
import '../bloc/meditation_state.dart';
import '../models/ambient_sound_settings.dart';

class AmbientSoundsWidget extends StatelessWidget {
  final MeditationActive state;

  const AmbientSoundsWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ambient Sounds',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildSoundControl(
              context, 'Rain', 'rain', state.soundSettings['rain']),
          _buildSoundControl(
              context, 'Forest', 'forest', state.soundSettings['forest']),
          _buildSoundControl(
              context, 'Ocean', 'ocean', state.soundSettings['ocean']),
        ],
      ),
    );
  }

  Widget _buildSoundControl(
    BuildContext context,
    String label,
    String soundId,
    AmbientSoundSettings? settings,
  ) {
    final isActive = settings?.isActive ?? false;
    final volume = settings?.volume ?? 1.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(width: 16),
          Switch(
            value: isActive,
            onChanged: (value) {
              context.read<MeditationBloc>().add(
                    ToggleSound(soundId: soundId, active: value),
                  );
            },
          ),
          if (isActive) ...[
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.volume_down, size: 20),
                  Expanded(
                    child: Slider(
                      value: volume,
                      min: 0.0,
                      max: 1.0,
                      divisions: 10,
                      onChanged: (value) {
                        context.read<MeditationBloc>().add(
                              AdjustVolume(soundId: soundId, volume: value),
                            );
                      },
                    ),
                  ),
                  const Icon(Icons.volume_up, size: 20),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
