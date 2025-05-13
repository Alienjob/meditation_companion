import 'dart:typed_data';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

/// Voice stream states
enum VoiceStreamState {
  /// No stream active
  idle,

  /// Stream is active and playing
  playing,

  /// Error occurred during streaming
  error,
}

/// Interface for audio playback services
abstract class AudioService {
  /// Stream of ambient sound settings changes
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream;

  /// Get current ambient sound settings
  Map<String, AmbientSoundSettings> getCurrentSoundSettings();

  /// Toggle specific sound on/off
  ///
  /// [soundId] the identifier of the sound to toggle
  /// [active] whether the sound should be active
  Future<void> toggleSound(String soundId, bool active);

  /// Set volume for specific sound
  ///
  /// [soundId] the identifier of the sound
  /// [volume] the new volume level (0.0 to 1.0)
  Future<void> setVolume(String soundId, double volume);

  /// Stops all currently playing ambient sounds
  Future<void> stopAllSounds();

  /// Dispose resources
  Future<void> dispose();

  /// Voice streaming methods

  /// Append new chunk of voice audio data
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData);

  /// Stop voice playback
  Future<void> stopVoice();

  /// Stream of voice playback state changes
  Stream<VoiceStreamState> get voiceStreamState;
}
