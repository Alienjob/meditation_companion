import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/models/meditation_session.dart';

/// Base class for all meditation states
abstract class MeditationState extends Equatable {
  const MeditationState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any meditation session is started
class MeditationInitial extends MeditationState {}

/// State representing an active meditation session
class MeditationActive extends MeditationState {
  /// Current meditation session
  final MeditationSession session;

  /// Map of available sounds and their current settings
  final Map<String, AmbientSoundSettings> soundSettings;

  /// Creates a new [MeditationActive] state
  const MeditationActive({
    required this.session,
    this.soundSettings = const {},
  });

  /// Returns true if any sounds are currently active
  bool get hasSoundsActive =>
      soundSettings.values.any((settings) => settings.isActive);

  /// Creates a copy of this state with the given fields replaced with new values
  MeditationActive copyWith({
    MeditationSession? session,
    Map<String, AmbientSoundSettings>? soundSettings,
  }) {
    return MeditationActive(
      session: session ?? this.session,
      soundSettings: soundSettings ?? this.soundSettings,
    );
  }

  @override
  List<Object?> get props => [session, soundSettings];
}

/// State representing a completed meditation session
class MeditationCompleted extends MeditationState {
  /// The completed meditation session
  final MeditationSession session;

  /// Creates a new [MeditationCompleted] state
  const MeditationCompleted({required this.session});

  @override
  List<Object?> get props => [session];
}

/// State representing an error in the meditation session
class MeditationError extends MeditationState {
  /// Error message describing what went wrong
  final String message;

  /// Creates a new [MeditationError] state
  const MeditationError({required this.message});

  @override
  List<Object?> get props => [message];
}
