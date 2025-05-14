import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';

class RealAudioService implements AudioService {
  final Map<String, AmbientSoundSettings> _soundSettings = {};
  final _settingsController =
      StreamController<Map<String, AmbientSoundSettings>>.broadcast();

  late final SoLoud _soloud;
  final Map<String, AudioSource> _sources = {};
  final Map<String, SoundHandle> _handles = {};
  bool _isInitialized = false;

  @override
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream =>
      _settingsController.stream;

  @override
  Map<String, AmbientSoundSettings> getCurrentSoundSettings() =>
      Map.from(_soundSettings);

  RealAudioService() {
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      _soloud = SoLoud.instance;
      await _soloud.init();

      await _loadSounds();
      _isInitialized = true;
    } on SoLoudNotInitializedException {
      print('Initialize SoLoud first');
    } on SoLoudFileLoadFailedException {
      print('Could not load audio file');
    } catch (e) {
      print('Unexpected error: $e');

      rethrow;
    }
  }

  Future<void> _loadSounds() async {
    try {
      _sources['rain'] = await _soloud.loadAsset(
          'assets/sounds/135162__syphon64__hard-rain-strong-winds.wav');
      _sources['forest'] = await _soloud.loadAsset(
          'assets/sounds/768427__lolamoore__serene-melodies-for-wildlife-documentaries.mp3');

      _soundSettings['rain'] = const AmbientSoundSettings();
      _soundSettings['forest'] = const AmbientSoundSettings();
    } catch (e) {
      print('Failed to load sounds: $e');
      rethrow;
    }
  }

  @override
  Future<void> toggleSound(String soundId, bool active) async {
    if (!_isInitialized) await _initialize();

    final source = _sources[soundId];

    final currentSettings = _soundSettings[soundId];
    if (source == null || currentSettings == null) return;

    try {
      if (active && !currentSettings.isActive) {
        // check if there is a handle for the soundId
        if (_handles[soundId] != null) {
          _soloud.setPause(_handles[soundId]!, false);
        } else {
          // if not, create a new handle
          _handles[soundId] =
              await _soloud.play(source, volume: currentSettings.volume);
        }
      } else if (!active && currentSettings.isActive) {
        if (_handles[soundId] != null) {
          _soloud.setPause(_handles[soundId]!, true);
        } else {
          // if not, ignore
          return;
        }
      }

      _soundSettings[soundId] = currentSettings.copyWith(isActive: active);
      _settingsController.add(_soundSettings);
    } catch (e) {
      print('Failed to toggle sound: $e');
      rethrow;
    }
  }

  @override
  Future<void> setVolume(String soundId, double volume) async {
    if (!_isInitialized) await _initialize();

    final handle = _handles[soundId];
    final currentSettings = _soundSettings[soundId];
    if (handle == null || currentSettings == null) return;

    try {
      if (currentSettings.isActive) {
        _soloud.fadeVolume(
          handle,
          volume,
          Duration(milliseconds: 100), // fade duration
        );
      }

      _soundSettings[soundId] = currentSettings.copyWith(volume: volume);
      _settingsController.add(_soundSettings);
    } catch (e) {
      print('Failed to set volume: $e');
      rethrow;
    }
  }

  @override
  Future<void> stopAllSounds() async {
    if (!_isInitialized) return;

    try {
      for (final entry in _soundSettings.entries) {
        if (entry.value.isActive) {
          final handle = _handles[entry.key];
          if (handle != null) {
            _soloud.setPause(handle, true);
          }
        }
        _soundSettings[entry.key] = entry.value.copyWith(isActive: false);
      }
      _settingsController.add(_soundSettings);
    } catch (e) {
      print('Failed to stop all sounds: $e');
      rethrow;
    }
  }

  @override
  Future<void> dispose() async {
    if (!_isInitialized) return;

    try {
      await stopAllSounds();
      for (final source in _sources.values) {
        await _soloud.disposeSource(source);
      }
      _handles.clear();
      _soundSettings.clear();
      await _settingsController.close();
    } catch (e) {
      print('Failed to dispose audio service: $e');
      rethrow;
    }
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
