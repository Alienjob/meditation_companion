import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/meditation_bloc.dart';
import '../bloc/meditation_event.dart';
import '../bloc/meditation_state.dart';
import 'meditation_initial_widget.dart';
import 'meditation_active_widget.dart';
import 'meditation_completed_widget.dart';

class MeditationContentWidget extends StatelessWidget {
  final MeditationState state;

  const MeditationContentWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state is MeditationCompleted) {
      return MeditationCompletedWidget(
        onStartNew: () {
          context.read<MeditationBloc>().add(const StopMeditation());
        },
      );
    }

    if (state is MeditationActive) {
      return MeditationActiveWidget(state: state as MeditationActive);
    }

    return MeditationInitialWidget(
      onStartSession: (minutes) => _startSession(context, minutes),
    );
  }

  void _startSession(BuildContext context, int minutes) {
    context.read<MeditationBloc>().add(
          StartMeditation(duration: Duration(minutes: minutes)),
        );
  }
}
