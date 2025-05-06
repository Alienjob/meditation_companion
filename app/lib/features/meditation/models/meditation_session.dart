import 'package:equatable/equatable.dart';

enum MeditationStatus {
  running,
  paused,
  completed,
}

class MeditationSession extends Equatable {
  final Duration duration;
  final Duration currentTime;
  final MeditationStatus status;

  MeditationSession({
    required this.duration,
    required this.currentTime,
    required this.status,
  }) {
    _validateState();
  }

  void _validateState() {
    if (duration.inSeconds <= 0) {
      throw AssertionError('Duration must be positive');
    }
    if (currentTime.isNegative) {
      throw AssertionError('Current time cannot be negative');
    }
    if (currentTime > duration) {
      throw AssertionError('Current time cannot exceed duration');
    }
  }

  bool get isRunning => status == MeditationStatus.running;
  bool get isPaused => status == MeditationStatus.paused;
  bool get isCompleted => status == MeditationStatus.completed;

  Duration get remainingTime => duration - currentTime;
  double get progress => currentTime.inSeconds / duration.inSeconds;

  MeditationSession copyWith({
    Duration? duration,
    Duration? currentTime,
    MeditationStatus? status,
  }) {
    return MeditationSession(
      duration: duration ?? this.duration,
      currentTime: currentTime ?? this.currentTime,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [duration, currentTime, status];

  // Factory constructors for common states
  factory MeditationSession.initial({required Duration duration}) {
    return MeditationSession(
      duration: duration,
      currentTime: Duration.zero,
      status: MeditationStatus.running,
    );
  }

  factory MeditationSession.paused({
    required Duration duration,
    required Duration currentTime,
  }) {
    return MeditationSession(
      duration: duration,
      currentTime: currentTime,
      status: MeditationStatus.paused,
    );
  }

  factory MeditationSession.completed({required Duration duration}) {
    return MeditationSession(
      duration: duration,
      currentTime: duration,
      status: MeditationStatus.completed,
    );
  }
}
