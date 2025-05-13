import 'package:equatable/equatable.dart';

/// Represents the state of audio playback at the moment of interruption
class InterruptionResult extends Equatable {
  /// The ID of the audio chunk that was playing
  final String itemId;

  /// Number of samples played in the current chunk
  final int sampleCount;

  /// Timestamp when the interruption occurred (milliseconds since epoch)
  final int timestamp;

  /// Creates a new [InterruptionResult] with the given parameters
  const InterruptionResult({
    required this.itemId,
    required this.sampleCount,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [itemId, sampleCount, timestamp];

  @override
  String toString() => 'InterruptionResult('
      'itemId: $itemId, '
      'sampleCount: $sampleCount, '
      'timestamp: $timestamp)';
}
