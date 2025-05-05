import 'dart:async';

import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

/// Interface for managing meditation ambient sounds
abstract class AudioService {
  /// Stream of sound settings updates
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream;

  /// Returns the current settings for all sounds
  Map<String, AmbientSoundSettings> getCurrentSoundSettings();

  /// Toggles a sound on or off
  ///
  /// [soundId] the identifier of the sound to toggle
  /// [active] whether the sound should be active
  Future<void> toggleSound(String soundId, bool active);

  /// Sets the volume for a specific sound
  ///
  /// [soundId] the identifier of the sound
  /// [volume] the new volume level (0.0 to 1.0)
  Future<void> setVolume(String soundId, double volume);

  /// Stops all currently playing sounds
  Future<void> stopAllSounds();

  /// Disposes of any resources held by the audio service
  Future<void> dispose();
}
