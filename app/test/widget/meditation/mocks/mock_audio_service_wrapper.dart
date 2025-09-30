import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';

/// Mock implementation of AudioService that completes the interface for testing
class MockAudioServiceForTests implements AudioService {
  final _soundSettingsController =
      StreamController<Map<String, AmbientSoundSettings>>.broadcast();
  final _voiceStateController = StreamController<VoiceStreamState>.broadcast();
  final Map<String, AmbientSoundSettings> _soundSettings = {};

  MockAudioServiceForTests() {
    // Initialize with some default sounds
    _soundSettings['rain'] =
        const AmbientSoundSettings(isActive: false, volume: 0.5);
    _soundSettings['forest'] =
        const AmbientSoundSettings(isActive: false, volume: 0.5);
    _soundSettings['ocean'] =
        const AmbientSoundSettings(isActive: false, volume: 0.5);

    // Add initial state
    _voiceStateController.add(VoiceStreamState.idle);
  }

  @override
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData) async {
    // Just simulate the process for testing
    _voiceStateController.add(VoiceStreamState.playing);
    return Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  Future<void> dispose() async {
    await _soundSettingsController.close();
    await _voiceStateController.close();
  }

  @override
  Map<String, AmbientSoundSettings> getCurrentSoundSettings() {
    return Map.unmodifiable(_soundSettings);
  }

  @override
  Future<void> setVolume(String soundId, double volume) async {
    if (volume < 0.0 || volume > 1.0) {
      throw ArgumentError('Volume must be between 0.0 and 1.0');
    }

    final currentSettings = _soundSettings[soundId] ??
        const AmbientSoundSettings(isActive: false, volume: 0.5);

    _soundSettings[soundId] = currentSettings.copyWith(volume: volume);
    _soundSettingsController.add(getCurrentSoundSettings());
  }

  @override
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream =>
      _soundSettingsController.stream;

  @override
  Future<void> stopAllSounds() async {
    for (final soundId in _soundSettings.keys) {
      final settings = _soundSettings[soundId]!;
      _soundSettings[soundId] = settings.copyWith(isActive: false);
    }
    _soundSettingsController.add(getCurrentSoundSettings());
  }

  @override
  Future<void> stopVoice() async {
    _voiceStateController.add(VoiceStreamState.idle);
    return Future.value();
  }

  @override
  Future<void> toggleSound(String soundId, bool active) async {
    final currentSettings = _soundSettings[soundId] ??
        const AmbientSoundSettings(isActive: false, volume: 0.5);

    _soundSettings[soundId] = currentSettings.copyWith(isActive: active);
    _soundSettingsController.add(getCurrentSoundSettings());
  }

  @override
  Stream<VoiceStreamState> get voiceStreamState => _voiceStateController.stream;
}
