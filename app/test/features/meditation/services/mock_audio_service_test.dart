import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';
import 'package:meditation_companion/features/meditation/services/mock_audio_service.dart';

void main() {
  group('MockAudioService', () {
    late MockAudioService audioService;

    setUp(() {
      audioService = MockAudioService();
    });

    tearDown(() async {
      await audioService.dispose();
    });

    test('initial state should be empty', () {
      expect(audioService.getCurrentSoundSettings(), isEmpty);
    });

    group('sound management', () {
      test('should add new sound correctly', () {
        audioService.addSound('rain');

        final settings = audioService.getCurrentSoundSettings();
        expect(settings.containsKey('rain'), true);
        expect(settings['rain']?.isActive, false);
        expect(settings['rain']?.volume, 1.0);
      });

      test('should not duplicate existing sounds', () {
        audioService.addSound('rain');
        final initialSettings = audioService.getCurrentSoundSettings();

        audioService.addSound('rain');
        final finalSettings = audioService.getCurrentSoundSettings();

        expect(initialSettings, equals(finalSettings));
      });

      test('should toggle sound state correctly', () async {
        audioService.addSound('rain');

        await audioService.toggleSound('rain', true);
        expect(audioService.getCurrentSoundSettings()['rain']?.isActive, true);

        await audioService.toggleSound('rain', false);
        expect(audioService.getCurrentSoundSettings()['rain']?.isActive, false);
      });

      test('should create sound settings if toggling non-existent sound',
          () async {
        await audioService.toggleSound('rain', true);

        final settings = audioService.getCurrentSoundSettings();
        expect(settings.containsKey('rain'), true);
        expect(settings['rain']?.isActive, true);
        expect(settings['rain']?.volume, 1.0);
      });
    });

    group('volume control', () {
      test('should set volume correctly', () async {
        audioService.addSound('rain');

        await audioService.setVolume('rain', 0.5);
        expect(audioService.getCurrentSoundSettings()['rain']?.volume, 0.5);
      });

      test('should throw error for invalid volume values', () async {
        audioService.addSound('rain');

        expect(
          () => audioService.setVolume('rain', -0.1),
          throwsArgumentError,
        );
        expect(
          () => audioService.setVolume('rain', 1.1),
          throwsArgumentError,
        );
      });

      test(
          'should create sound settings if setting volume for non-existent sound',
          () async {
        await audioService.setVolume('rain', 0.5);

        final settings = audioService.getCurrentSoundSettings();
        expect(settings.containsKey('rain'), true);
        expect(settings['rain']?.isActive, false);
        expect(settings['rain']?.volume, 0.5);
      });
    });

    test('stopAllSounds should deactivate all sounds', () async {
      audioService.addSound('rain');
      audioService.addSound('wave');

      await audioService.toggleSound('rain', true);
      await audioService.toggleSound('wave', true);

      await audioService.stopAllSounds();

      final settings = audioService.getCurrentSoundSettings();
      expect(settings['rain']?.isActive, false);
      expect(settings['wave']?.isActive, false);
      // Volumes should remain unchanged
      expect(settings['rain']?.volume, 1.0);
      expect(settings['wave']?.volume, 1.0);
    });

    test('soundSettingsStream should emit on changes', () async {
      final emissions = <Map<String, AmbientSoundSettings>>[];
      final subscription =
          audioService.soundSettingsStream.listen(emissions.add);

      // Test add sound
      audioService.addSound('rain');
      await Future.microtask(() {});
      expect(emissions.length, 1);
      expect(emissions.last.containsKey('rain'), true);

      // Test toggle sound
      await audioService.toggleSound('rain', true);
      expect(emissions.length, 2);
      expect(emissions.last['rain']?.isActive, true);

      // Test volume change
      await audioService.setVolume('rain', 0.5);
      expect(emissions.length, 3);
      expect(emissions.last['rain']?.volume, 0.5);

      await subscription.cancel();
    });

    test('getCurrentSoundSettings should return unmodifiable map', () {
      audioService.addSound('rain');
      final settings = audioService.getCurrentSoundSettings();

      expect(
        () => settings['rain'] = const AmbientSoundSettings(),
        throwsUnsupportedError,
      );
    });
  });
}
