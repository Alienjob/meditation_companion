import 'package:meditation_companion/features/audio/models/interruption_result.dart';
import 'package:meditation_companion/features/audio/models/position_tracker.dart';

/// Implementation of [PositionTracker] that handles streaming audio position tracking
class StreamTimeline extends PositionTracker {
  /// Creates a new timeline tracker with the specified sample rate
  StreamTimeline(super.sampleRate);

  /// List of chunks in the stream with their sizes in samples
  final _chunks = <_AudioChunk>[];

  /// Timing state
  bool _isPaused = false;
  int? _lastTimestamp;
  int _accumulatedTimeMs = 0;

  /// Total samples in all previous chunks
  int _totalPreviousSamples = 0;

  @override
  void addChunk(String itemId, int chunkSizeBytes) {
    // For s16le format, each sample is 2 bytes
    final samplesInChunk = chunkSizeBytes ~/ 2;

    _chunks.add(_AudioChunk(
      id: itemId,
      sampleCount: samplesInChunk,
      startSample: _totalPreviousSamples,
    ));

    _totalPreviousSamples += samplesInChunk;
  }

  @override
  void setPausedState(bool isPaused) {
    _isPaused = isPaused;
  }

  @override
  InterruptionResult getInterruptionState(int timestamp) {
    if (_chunks.isEmpty) {
      _lastTimestamp = timestamp;
      return InterruptionResult(
        itemId: '',
        sampleCount: 0,
        timestamp: timestamp,
      );
    }

    // Calculate time delta since last call
    if (_lastTimestamp != null && !_isPaused) {
      final deltaMs = timestamp - _lastTimestamp!;
      _accumulatedTimeMs += deltaMs;
    }

    _lastTimestamp = timestamp;

    // Calculate total played samples
    final totalPlayedSamples = (_accumulatedTimeMs * sampleRate) ~/ 1000;

    // Find current chunk
    var accumulatedSamples = 0;
    for (final chunk in _chunks) {
      if (totalPlayedSamples < accumulatedSamples + chunk.sampleCount) {
        final samplePosition = totalPlayedSamples - accumulatedSamples;
        return InterruptionResult(
          itemId: chunk.id,
          sampleCount: samplePosition.clamp(0, chunk.sampleCount),
          timestamp: timestamp,
        );
      }
      accumulatedSamples += chunk.sampleCount;
    }

    // If we've played past all chunks, return the last chunk
    final lastChunk = _chunks.last;
    return InterruptionResult(
      itemId: lastChunk.id,
      sampleCount: lastChunk.sampleCount,
      timestamp: timestamp,
    );
  }

  @override
  void reset() {
    _chunks.clear();
    _isPaused = false;
    _lastTimestamp = null;
    _accumulatedTimeMs = 0;
    _totalPreviousSamples = 0;
  }
}

/// Internal class to track chunk information
class _AudioChunk {
  final String id;
  final int sampleCount;
  final int startSample;

  const _AudioChunk({
    required this.id,
    required this.sampleCount,
    required this.startSample,
  });
}
