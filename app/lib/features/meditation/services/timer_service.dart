import 'dart:async';

/// Interface for managing meditation timer functionality
abstract class TimerService {
  /// Stream of elapsed time events
  Stream<Duration> get timeStream;

  /// Returns the currently elapsed time
  Duration get currentTime;

  /// Returns true if the timer is currently running
  bool get isRunning;

  /// Starts the timer with the given duration
  ///
  /// If the timer is already running, it will be stopped and restarted
  /// with the new duration.
  ///
  /// [duration] must be positive
  Future<void> start(Duration duration);

  /// Pauses the timer at current position
  ///
  /// If the timer is not running, this is a no-op
  Future<void> pause();

  /// Resumes the timer from the current position
  ///
  /// If the timer is already running or completed, this is a no-op
  Future<void> resume();

  /// Stops the timer and resets to initial state
  ///
  /// This will reset the elapsed time to zero
  Future<void> stop();

  /// Gets the time remaining in the current session
  ///
  /// Returns Duration.zero if no session is active
  Duration getTimeLeft();

  /// Disposes of any resources held by the timer service
  Future<void> dispose();
}
