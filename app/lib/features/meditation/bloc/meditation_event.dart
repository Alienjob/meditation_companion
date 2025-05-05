import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

/// Base class for all meditation events
abstract class MeditationEvent extends Equatable {
  const MeditationEvent();

  @override
  List<Object?> get props => [];
}

/// Event to start a new meditation session
class StartMeditation extends MeditationEvent {
  /// Duration for the meditation session
  final Duration duration;

  const StartMeditation({required this.duration});

  @override
  List<Object?> get props => [duration];
}

/// Event to pause the current meditation session
class PauseMeditation extends MeditationEvent {}

/// Event to resume the paused meditation session
class ResumeMeditation extends MeditationEvent {}

/// Event to stop the current meditation session
class StopMeditation extends MeditationEvent {}

/// Event emitted when meditation time updates
class MeditationTimeUpdated extends MeditationEvent {
  /// Current elapsed time
  final Duration currentTime;

  const MeditationTimeUpdated({required this.currentTime});

  @override
  List<Object?> get props => [currentTime];
}

/// Event to toggle a sound on/off
class ToggleSound extends MeditationEvent {
  /// ID of the sound to toggle
  final String soundId;

  /// Whether to activate or deactivate the sound
  final bool active;

  const ToggleSound({
    required this.soundId,
    required this.active,
  });

  @override
  List<Object?> get props => [soundId, active];
}

/// Event to adjust a sound's volume
class AdjustVolume extends MeditationEvent {
  /// ID of the sound to adjust
  final String soundId;

  /// New volume level (0.0 to 1.0)
  final double volume;

  const AdjustVolume({
    required this.soundId,
    required this.volume,
  });

  @override
  List<Object?> get props => [soundId, volume];
}

/// Event emitted when sound settings are updated
class SoundSettingsUpdated extends MeditationEvent {
  /// Map of updated sound settings
  final Map<String, AmbientSoundSettings> settings;

  const SoundSettingsUpdated({required this.settings});

  @override
  List<Object?> get props => [settings];
}
