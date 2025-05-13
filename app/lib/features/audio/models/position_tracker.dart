import 'package:meditation_companion/features/audio/models/interruption_result.dart';

/// Abstract class defining the interface for tracking audio playback position
abstract class PositionTracker {
  /// Audio sample rate (e.g. 24000 for 24kHz)
  final int sampleRate;

  /// Creates a new position tracker with the specified sample rate
  const PositionTracker(this.sampleRate);

  /// Add new chunk of audio data
  ///
  /// [itemId] uniquely identifies the chunk being added
  /// [chunkSizeBytes] is the size of the audio chunk in bytes
  void addChunk(String itemId, int chunkSizeBytes);

  /// Set pause state (e.g. when buffering or explicitly paused)
  ///
  /// [isPaused] indicates whether playback should be considered paused
  void setPausedState(bool isPaused);

  /// Get position info at specific timestamp
  ///
  /// [timestamp] is the time at which to calculate the position (milliseconds since epoch)
  /// Returns an [InterruptionResult] containing the current chunk and sample position
  InterruptionResult getInterruptionState(int timestamp);

  /// Clear state for new stream
  void reset();
}
