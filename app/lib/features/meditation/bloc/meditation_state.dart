import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';

abstract class MeditationState extends Equatable {
  const MeditationState();
}

class MeditationInitial extends MeditationState {
  @override
  List<Object?> get props => [];
}

class MeditationActive extends MeditationState {
  final MeditationSession session;
  final Map<String, AmbientSoundSettings> soundSettings;

  const MeditationActive({
    required this.session,
    required this.soundSettings,
  });

  @override
  List<Object?> get props => [session, soundSettings];
}

class MeditationCompleted extends MeditationState {
  final MeditationSession session;

  const MeditationCompleted({
    required this.session,
  });

  @override
  List<Object?> get props => [session];
}

class MeditationError extends MeditationState {
  final String message;

  const MeditationError({required this.message});

  @override
  List<Object?> get props => [message];
}
