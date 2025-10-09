import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';

class RealAudioService implements AudioService {
  static const _domain = 'Meditation Audio';
  static const _featureVoice = 'RealAudioService VoiceStream';

  final Map<String, AmbientSoundSettings> _soundSettings = {};
  final _settingsController =
      StreamController<Map<String, AmbientSoundSettings>>.broadcast();

  late final SoLoud _soloud;
  final Map<String, AudioSource> _sources = {};
  final Map<String, SoundHandle> _handles = {};
  bool _isInitialized = false;

  AudioSource? _voiceStream;
  SoundHandle? _voiceHandle;
  String? _currentVoiceItemId;
  bool _voiceStreamEnded = false;
  final _voiceStateController = StreamController<VoiceStreamState>.broadcast();

  @override
  Stream<Map<String, AmbientSoundSettings>> get soundSettingsStream =>
      _settingsController.stream;

  @override
  Map<String, AmbientSoundSettings> getCurrentSoundSettings() =>
      Map.from(_soundSettings);

  RealAudioService() {
    _initialize();
    _voiceStateController.add(VoiceStreamState.idle);
  }

  void _logVoice(String message) {
    logDebug(
      message,
      domain: _domain,
      feature: _featureVoice,
      context: RealAudioService,
    );
  }

  @override
  Stream<VoiceStreamState> get voiceStreamState => _voiceStateController.stream;

  Future<void> _initialize() async {
    try {
      _soloud = SoLoud.instance;
      await _soloud.init();

      await _loadSounds();
      _isInitialized = true;
      _logVoice('[${DateTime.now().toIso8601String()}] SoLoud initialized');
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
      await _voiceStateController.close();
    } catch (e) {
      print('Failed to dispose audio service: $e');
      rethrow;
    }
  }

  @override
  Future<void> appendVoiceChunk(String itemId, Uint8List audioData) async {
    if (!_isInitialized) {
      await _initialize();
    }

    if (_currentVoiceItemId != null && _currentVoiceItemId != itemId) {
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Switching stream from item=$_currentVoiceItemId to item=$itemId',
      );
      await _resetVoiceStream();
    }

    if (_voiceStreamEnded && audioData.isNotEmpty) {
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Received new audio after end marker; resetting stream for item=$itemId',
      );
      await _resetVoiceStream();
    }

    await _ensureVoiceStream();

    if (audioData.isEmpty) {
      if (_voiceStream != null) {
        _soloud.setDataIsEnded(_voiceStream!);
      }
      _voiceStreamEnded = true;
      _currentVoiceItemId = null;
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Received end of stream marker for item=$itemId',
      );
      return;
    }

    try {
      _currentVoiceItemId ??= itemId;
      _soloud.addAudioDataStream(_voiceStream!, audioData);
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Buffered audio chunk for item=$itemId bytes=${audioData.length}',
      );
    } on SoLoudStreamEndedAlreadyCppException {
      await _resetVoiceStream();
      await _ensureVoiceStream();
      _currentVoiceItemId = itemId;
      _soloud.addAudioDataStream(_voiceStream!, audioData);
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Recovered stream after SoLoudStreamEndedAlready for item=$itemId bytes=${audioData.length}',
      );
    } catch (e) {
      if (!_voiceStateController.isClosed) {
        _voiceStateController.add(VoiceStreamState.error);
      }
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Error buffering audio for item=$itemId: $e',
      );
      rethrow;
    }

    if (_voiceHandle == null || !_soloud.getIsValidVoiceHandle(_voiceHandle!)) {
      _voiceHandle = await _soloud.play(_voiceStream!, volume: 1);
      _logVoice(
        '[${DateTime.now().toIso8601String()}] Started playback for item=$itemId handle=$_voiceHandle',
      );
    }

    if (!_voiceStateController.isClosed) {
      _voiceStateController.add(VoiceStreamState.playing);
    }
  }

  @override
  Future<void> stopVoice() async {
    if (!_isInitialized) return;

    _logVoice('[${DateTime.now().toIso8601String()}] stopVoice requested');
    await _stopVoiceHandle();
    if (_voiceStream != null) {
      try {
        _soloud.resetBufferStream(_voiceStream!);
        _soloud.setDataIsEnded(_voiceStream!);
      } catch (_) {}
    }
    _currentVoiceItemId = null;
    if (!_voiceStateController.isClosed) {
      _voiceStateController.add(VoiceStreamState.idle);
    }
  }

  Future<void> _ensureVoiceStream() async {
    if (_voiceStream != null) return;

    _voiceStream = _soloud.setBufferStream(
      bufferingType: BufferingType.released,
      bufferingTimeNeeds: 0.25,
      sampleRate: 24000,
      channels: Channels.mono,
      format: BufferType.s16le,
      onBuffering: (isBuffering, handle, time) {
        if (_voiceStateController.isClosed) return;
        if (isBuffering) {
          _voiceStateController.add(VoiceStreamState.playing);
        }
      },
    );
    _voiceStreamEnded = false;
    _voiceStateController.add(VoiceStreamState.idle);
    _logVoice(
        '[${DateTime.now().toIso8601String()}] Voice buffer stream initialized');
  }

  Future<void> _stopVoiceHandle() async {
    if (_voiceHandle != null && _soloud.getIsValidVoiceHandle(_voiceHandle!)) {
      try {
        await _soloud.stop(_voiceHandle!);
        _logVoice(
            '[${DateTime.now().toIso8601String()}] SoLoud handle stopped');
      } catch (_) {}
    }
    _voiceHandle = null;
  }

  Future<void> _resetVoiceStream() async {
    _logVoice('[${DateTime.now().toIso8601String()}] Resetting voice stream');
    await _stopVoiceHandle();
    if (_voiceStream != null) {
      try {
        _soloud.resetBufferStream(_voiceStream!);
        _soloud.setDataIsEnded(_voiceStream!);
        await _soloud.disposeSource(_voiceStream!);
        _logVoice(
            '[${DateTime.now().toIso8601String()}] Existing buffer disposed');
      } catch (_) {}
    }
    _voiceStream = null;
    _voiceStreamEnded = false;
    _currentVoiceItemId = null;
    if (!_voiceStateController.isClosed) {
      _voiceStateController.add(VoiceStreamState.idle);
    }
  }
}
