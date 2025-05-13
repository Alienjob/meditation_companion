import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/audio/models/position_tracker.dart';
import 'package:meditation_companion/features/audio/services/stream_timeline.dart';

void main() {
  late StreamTimeline tracker;
  const sampleRate = 24000; // 24kHz
  final baseTime = 1000; // Use fixed timestamp for predictable testing

  setUp(() {
    tracker = StreamTimeline(sampleRate);
  });

  group('StreamTimeline', () {
    test('should track sample position correctly', () {
      tracker.addChunk('id1',
          48000); // 1 second at 24kHz (s16le format = 2 bytes per sample)

      // First call to initialize timeline
      tracker.getInterruptionState(baseTime);

      // Check position after 500ms
      final result = tracker.getInterruptionState(baseTime + 500);
      expect(result.itemId, 'id1');
      expect(result.sampleCount, 12000); // Half of the samples (0.5s * 24kHz)
    });

    test('should account for pauses', () {
      tracker.addChunk('id1', 48000); // 1 second chunk

      // t=0ms: Start playing
      var result = tracker.getInterruptionState(baseTime);
      expect(result.sampleCount, 0);

      // t=250ms: Check position and pause
      result = tracker.getInterruptionState(baseTime + 250);
      expect(result.sampleCount, 6000); // 0.25s worth

      tracker.setPausedState(true);

      // t=750ms: Still paused
      result = tracker.getInterruptionState(baseTime + 750);
      expect(result.sampleCount, 6000); // Should not have changed

      // t=750ms: Resume
      tracker.setPausedState(false);

      // t=1000ms: Check final position
      // Should be 6000 samples from before pause + 6000 samples after resume
      result = tracker.getInterruptionState(baseTime + 1000);
      expect(
          result.sampleCount, 12000); // 0.25s before pause + 0.25s after resume
    });

    test('should handle multiple chunks', () {
      // Add two 500ms chunks
      tracker.addChunk('id1', 24000); // 0.5s
      tracker.addChunk('id2', 24000); // 0.5s

      // Initialize timeline
      tracker.getInterruptionState(baseTime);

      // Check at t=750ms (should be in second chunk)
      final result = tracker.getInterruptionState(baseTime + 750);
      expect(result.itemId, 'id2');
      expect(result.sampleCount, 6000); // 0.25s into second chunk
    });

    test('should reset state correctly', () {
      tracker.addChunk('id1', 48000);
      tracker.setPausedState(true);

      tracker.reset();

      tracker.addChunk('id2', 48000);
      // Initialize timeline after reset
      tracker.getInterruptionState(baseTime);
      // Check position after 500ms
      final result = tracker.getInterruptionState(baseTime + 500);

      expect(result.itemId, 'id2');
      expect(result.sampleCount, 12000); // 0.5s worth
    });

    test('should handle empty state gracefully', () {
      final result = tracker.getInterruptionState(baseTime);

      expect(result.itemId, isEmpty);
      expect(result.sampleCount, 0);
    });

    test('should calculate correct sample count for s16le format', () {
      tracker.addChunk(
          'id1', 96000); // 2 seconds of s16le audio (2 bytes per sample)

      // Initialize timeline
      tracker.getInterruptionState(baseTime);

      // Check position after 500ms
      final result = tracker.getInterruptionState(baseTime + 500);
      expect(result.sampleCount, 12000); // 0.5s * 24kHz = 12000 samples
    });
  });
}
