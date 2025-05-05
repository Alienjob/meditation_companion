import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

/// The current status of a meditation session
enum MeditationStatus {
  /// Session is currently running
  running,

  /// Session is paused
  paused,

  /// Session has completed
  completed,
}

/// Represents a meditation session with its duration, progress, and sound settings
class MeditationSession extends Equatable {
  /// Total duration of the session
  final Duration duration;

  /// Current elapsed time of the session
  final Duration currentTime;

  /// Current status of the session
  final MeditationStatus status;

  /// Map of sound IDs to their current settings
  final Map<String, AmbientSoundSettings> activeAmbientSounds;

  /// Creates a new [MeditationSession] instance
  ///
  /// [duration] must be positive
  /// [currentTime] must not be greater than [duration]
  const MeditationSession({
    required this.duration,
    this.currentTime = Duration.zero,
    this.status = MeditationStatus.paused,
    this.activeAmbientSounds = const {},
  })  : assert(duration > Duration.zero, 'Duration must be positive'),
        assert(currentTime <= duration,
            'Current time cannot be greater than duration');

  /// Creates a copy of this session with the given fields replaced with new values
  MeditationSession copyWith({
    Duration? duration,
    Duration? currentTime,
    MeditationStatus? status,
    Map<String, AmbientSoundSettings>? activeAmbientSounds,
  }) {
    return MeditationSession(
      duration: duration ?? this.duration,
      currentTime: currentTime ?? this.currentTime,
      status: status ?? this.status,
      activeAmbientSounds: activeAmbientSounds ?? this.activeAmbientSounds,
    );
  }

  /// Returns the remaining time in the session
  Duration get remainingTime => duration - currentTime;

  /// Returns true if the session is currently running
  bool get isRunning => status == MeditationStatus.running;

  /// Returns true if the session is currently paused
  bool get isPaused => status == MeditationStatus.paused;

  /// Returns true if the session has completed
  bool get isCompleted => status == MeditationStatus.completed;

  /// Returns progress as a value between 0.0 and 1.0
  double get progress => currentTime.inMicroseconds / duration.inMicroseconds;

  @override
  List<Object?> get props => [
        duration,
        currentTime,
        status,
        activeAmbientSounds,
      ];

  @override
  String toString() =>
      'MeditationSession(duration: $duration, currentTime: $currentTime, '
      'status: $status, activeAmbientSounds: $activeAmbientSounds)';
}
