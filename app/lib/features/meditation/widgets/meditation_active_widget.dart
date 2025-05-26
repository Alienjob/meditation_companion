import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/meditation_bloc.dart';
import '../bloc/meditation_event.dart';
import '../bloc/meditation_state.dart';
import '../models/meditation_session.dart';
import 'ambient_sounds_widget.dart';

class MeditationActiveWidget extends StatelessWidget {
  final MeditationActive state;

  const MeditationActiveWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
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
                Text(
                  timeDisplay,
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 48),
                _buildControlButtons(context),
              ],
            ),
          ),
        ),
        AmbientSoundsWidget(state: state),
      ],
    );
  }

  Widget _buildControlButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state.session.status == MeditationStatus.running)
          IconButton(
            iconSize: 64,
            icon: const Icon(Icons.pause_circle_filled),
            onPressed: () =>
                context.read<MeditationBloc>().add(const PauseMeditation()),
          )
        else
          IconButton(
            iconSize: 64,
            icon: const Icon(Icons.play_circle_filled),
            onPressed: () =>
                context.read<MeditationBloc>().add(const ResumeMeditation()),
          ),
        const SizedBox(width: 32),
        IconButton(
          iconSize: 64,
          icon: const Icon(Icons.stop_circle),
          onPressed: () =>
              context.read<MeditationBloc>().add(const StopMeditation()),
        ),
      ],
    );
  }
}
