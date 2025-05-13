# Audio Streaming Position Tracking

## Purpose
When a user interrupts voice playback, we need to tell the LLM exactly where in the audio stream the interruption occurred. Since we use `BufferingType.released` mode in SoLoud (which frees played audio data), we need our own mechanism to track:

1. Which chunk was playing at interruption time
2. How many samples had been played

## Interface
```dart
abstract class PositionTracker {
  /// Create tracker with specific sample rate
  PositionTracker(this.sampleRate);

  /// Audio sample rate (e.g. 24000 for 24kHz)
  final int sampleRate;

  /// Add new chunk of audio data
  void addChunk(String itemId, int chunkSizeBytes);
  
  /// Set pause state (e.g. when buffering or explicitly paused)
  void setPausedState(bool isPaused);
  
  /// Get position info at specific timestamp
  InterruptionResult getInterruptionState(int timestamp);
  
  /// Clear state for new stream
  void reset();
}

class InterruptionResult {
  final String itemId;       // Which chunk was playing
  final int sampleCount;     // How many samples played
  final int timestamp;       // When interruption occurred
  
  const InterruptionResult({
    required this.itemId,
    required this.sampleCount,
    required this.timestamp,
  });
}
```

## Usage Examples

```dart
// In RealAudioService
class RealAudioService {
  late final PositionTracker _tracker;
  late final AudioSource _stream;
  
  Future<void> initialize() async {
    _tracker = PositionTracker(24000); // 24kHz for voice
    _stream = await SoLoud.instance.setBufferStream(
      sampleRate: 24000,
      format: BufferType.s16le,
      // ... other settings
    );
  }
  
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData) async {
    _tracker.addChunk(itemId, audioData.length);
    await SoLoud.instance.addAudioDataStream(_stream, audioData);
  }
  
  void _handleBuffering(bool isBuffering, SoundHandle handle, double time) {
    _tracker.setPausedState(isBuffering);
  }
  
  Future<InterruptionResult> interruptVoice() async {
    final result = _tracker.getInterruptionState(
      DateTime.now().millisecondsSinceEpoch
    );
    await SoLoud.instance.stop(_stream);
    _tracker.reset();
    return result;
  }
}

// In Assistant Widget
void _handleInterruptTap() async {
  final result = await _audioService.interruptVoice();
  await _client.cancelResponse(result.itemId, result.sampleCount);
}
```

## Test Cases

1. Basic Position Tracking
```dart
test('should track sample position correctly', () {
  final tracker = PositionTracker(24000);
  final startTime = 1000;
  
  tracker.addChunk('id1', 48000); // 1 second at 24kHz
  
  final halfwayResult = tracker.getInterruptionState(startTime + 500);
  expect(halfwayResult.itemId, 'id1');
  expect(halfwayResult.sampleCount, 12000); // Half of the samples
});
```

2. Handling Pauses
```dart
test('should account for pauses', () {
  final tracker = PositionTracker(24000);
  final startTime = 1000;
  
  // t=0: Add 1 second of audio
  tracker.addChunk('id1', 48000);
  
  // t=250ms: Pause
  tracker.setPausedState(true);
  
  // t=750ms: Resume (500ms pause)
  tracker.setPausedState(false);
  
  // t=1000ms: Check position
  // Should only have played 500ms worth of samples due to pause
  final result = tracker.getInterruptionState(startTime + 1000);
  expect(result.sampleCount, 12000); // 0.5 seconds worth
});
```

3. Multiple Chunks
```dart
test('should handle multiple chunks', () {
  final tracker = PositionTracker(24000);
  final startTime = 1000;
  
  // Add two 500ms chunks
  tracker.addChunk('id1', 24000); // 0.5s
  tracker.addChunk('id2', 24000); // 0.5s
  
  // Check at t=750ms (should be in second chunk)
  final result = tracker.getInterruptionState(startTime + 750);
  expect(result.itemId, 'id2');
  expect(result.sampleCount, 18000); // 0.75s worth
});
```

## Implementation Notes

- Time and sample calculations:
  ```dart
  class StreamTimeline extends PositionTracker {
    StreamTimeline(super.sampleRate);

    // For s16le format:
    final samplesInChunk = chunkSizeBytes ~/ 2;
    
    // Convert time to samples:
    final playTimeMs = timestamp - startTime;
    final expectedSamples = (playTimeMs * sampleRate) ~/ 1000;
  }
  ```

- Pause handling:
  ```dart
  // Track total pause duration
  DateTime? pauseStart;
  Duration totalPause = Duration.zero;
  
  void setPausedState(bool isPaused) {
    if (isPaused) {
      pauseStart = DateTime.now();
    } else if (pauseStart != null) {
      totalPause += DateTime.now().difference(pauseStart!);
      pauseStart = null;
    }
  }
  ```

- Position calculation:
  ```dart
  // Effective play time = elapsed - pauses
  final effectiveTime = now.difference(startTime) - totalPause;
  final effectiveSamples = (effectiveTime.inMilliseconds * sampleRate) ~/ 1000;