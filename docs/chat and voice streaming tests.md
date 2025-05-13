# Chat and Voice Streaming Tests

## AudioService Interface Changes

```dart
abstract class AudioService {
  // Existing methods
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream;
  Map<String, AmbientSoundSettings> getCurrentSoundSettings();
  Future<void> toggleSound(String soundId, bool active);
  Future<void> setVolume(String soundId, double volume);
  Future<void> stopAllSounds();
  Future<void> dispose();

  // New methods for voice streaming
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData);
  Future<void> stopVoice(); // Just stops playback
  Stream<VoiceStreamState> get voiceStreamState;
}

enum VoiceStreamState {
  idle,      // No stream active
  playing,   // Stream is active and playing
  error     // Error occurred
}
```

## Usage Example

```dart
class RealAudioService implements AudioService {
  late final AudioSource _stream;
  final _stateController = StreamController<VoiceStreamState>.broadcast();
  
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData) async {
    await SoLoud.instance.addAudioDataStream(_stream, audioData);
    _stateController.add(VoiceStreamState.playing);
  }
  
  Future<void> stopVoice() async {
    await SoLoud.instance.stop(_stream);
    _stateController.add(VoiceStreamState.idle);
  }
  
  Stream<VoiceStreamState> get voiceStreamState => _stateController.stream;
}
```

## Test Cases

### State Management Tests
1. `should_handle_initial_chunk`
   - Initial state should be idle
   - Append first chunk
   - Verify state changes to playing

2. `should_handle_additional_chunks`
   - Append first chunk and verify playing state
   - Append more chunks
   - Verify stays in playing state

3. `should_handle_empty_or_invalid_chunks`
   - Try appending null chunk
   - Try appending empty chunk
   - Verify error state is emitted
   - Verify returns to idle state

### Stop Voice Tests
1. `should_stop_voice_playback`
   - Append chunks and reach playing state
   - Call stopVoice()
   - Verify state changes to idle
   - Verify playback stops

2. `should_handle_stop_when_idle`
   - Call stopVoice() in idle state
   - Verify stays in idle state
   - Verify no errors occur

3. `should_handle_additional_chunks_after_stop`
   - Append first chunk and verify playing state
   - Call stopVoice()
   - Verify state changes to idle
   - Append new chunk
   - Verify state changes to playing