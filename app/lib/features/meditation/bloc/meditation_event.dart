import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

abstract class MeditationEvent extends Equatable {
  const MeditationEvent();

  @override
  List<Object?> get props => [];
}

class StartMeditation extends MeditationEvent {
  final Duration duration;

  const StartMeditation({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class PauseMeditation extends MeditationEvent {
  const PauseMeditation();
}

class ResumeMeditation extends MeditationEvent {
  const ResumeMeditation();
}

class StopMeditation extends MeditationEvent {
  const StopMeditation();
}

class ToggleSound extends MeditationEvent {
  final String soundId;
  final bool active;

  const ToggleSound({
    required this.soundId,
    required this.active,
  });

  @override
  List<Object?> get props => [soundId, active];
}

class AdjustVolume extends MeditationEvent {
  final String soundId;
  final double volume;

  const AdjustVolume({
    required this.soundId,
    required this.volume,
  });

  @override
  List<Object?> get props => [soundId, volume];
}

class UpdateTime extends MeditationEvent {
  final Duration time;

  const UpdateTime(this.time);

  @override
  List<Object?> get props => [time];
}

class UpdateSoundSettings extends MeditationEvent {
  final Map<String, AmbientSoundSettings> settings;

  const UpdateSoundSettings(this.settings);

  @override
  List<Object?> get props => [settings];
}
