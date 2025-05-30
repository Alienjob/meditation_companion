import 'dart:async';
import 'dart:typed_data';

import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';

/// Mock implementation of [AudioService] for testing and development
class MockAudioService implements AudioService {
  final Map<String, AmbientSoundSettings> _soundSettings = {};
  final _settingsController =
      StreamController<Map<String, AmbientSoundSettings>>.broadcast();

  @override
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream =>
      _settingsController.stream;

  @override
  Map<String, AmbientSoundSettings> getCurrentSoundSettings() {
    return Map.unmodifiable(_soundSettings);
  }

  @override
  Future<void> toggleSound(String soundId, bool active) async {
    final currentSettings = _soundSettings[soundId] ??
        AmbientSoundSettings(isActive: false, volume: 1.0);

    _soundSettings[soundId] = currentSettings.copyWith(isActive: active);
    _settingsController.add(getCurrentSoundSettings());
  }

  @override
  Future<void> setVolume(String soundId, double volume) async {
    if (volume < 0.0 || volume > 1.0) {
      throw ArgumentError('Volume must be between 0.0 and 1.0');
    }

    final currentSettings = _soundSettings[soundId] ??
        AmbientSoundSettings(isActive: false, volume: 1.0);

    _soundSettings[soundId] = currentSettings.copyWith(volume: volume);
    _settingsController.add(getCurrentSoundSettings());
  }

  @override
  Future<void> stopAllSounds() async {
    for (final soundId in _soundSettings.keys) {
      final settings = _soundSettings[soundId]!;
      _soundSettings[soundId] = settings.copyWith(isActive: false);
    }
    _settingsController.add(getCurrentSoundSettings());
  }

  /// Adds a new sound to the available sounds
  ///
  /// This is a mock-specific method to help with testing
  void addSound(String soundId) {
    if (!_soundSettings.containsKey(soundId)) {
      _soundSettings[soundId] = const AmbientSoundSettings();
      _settingsController.add(getCurrentSoundSettings());
    }
  }

  @override
  Future<void> dispose() async {
    await _settingsController.close();
  }

  @override
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData) {
    // TODO: implement appendVoiceChunk
    throw UnimplementedError();
  }

  @override
  Future<void> stopVoice() {
    // TODO: implement stopVoice
    throw UnimplementedError();
  }

  @override
  // TODO: implement voiceStreamState
  Stream<VoiceStreamState> get voiceStreamState => throw UnimplementedError();
}
