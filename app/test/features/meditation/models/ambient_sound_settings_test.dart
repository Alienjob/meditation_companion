import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/meditation/models/ambient_sound_settings.dart';

void main() {
  group('AmbientSoundSettings', () {
    test('should be created with default values', () {
      final settings = AmbientSoundSettings();

      expect(settings.isActive, false);
      expect(settings.volume, 1.0);
    });

    test('should be created with custom values', () {
      final settings = AmbientSoundSettings(
        isActive: true,
        volume: 0.5,
      );

      expect(settings.isActive, true);
      expect(settings.volume, 0.5);
    });

    test('should assert volume is between 0.0 and 1.0', () {
      expect(
        () => AmbientSoundSettings(volume: -0.1),
        throwsA(isA<AssertionError>()),
      );

      expect(
        () => AmbientSoundSettings(volume: 1.1),
        throwsA(isA<AssertionError>()),
      );
    });

    test('copyWith should create new instance with updated values', () {
      final original = AmbientSoundSettings(
        isActive: false,
        volume: 1.0,
      );

      final copy = original.copyWith(
        isActive: true,
        volume: 0.5,
      );

      expect(copy.isActive, true);
      expect(copy.volume, 0.5);
      expect(original.isActive, false);
      expect(original.volume, 1.0);
    });

    test('props should contain all fields', () {
      final settings = AmbientSoundSettings(
        isActive: true,
        volume: 0.5,
      );

      expect(settings.props, [true, 0.5]);
    });

    test('toString should contain all field values', () {
      final settings = AmbientSoundSettings(
        isActive: true,
        volume: 0.5,
      );

      expect(
        settings.toString(),
        'AmbientSoundSettings(isActive: true, volume: 0.5)',
      );
    });

    test('instances with same values should be equal', () {
      final settings1 = AmbientSoundSettings(
        isActive: true,
        volume: 0.5,
      );

      final settings2 = AmbientSoundSettings(
        isActive: true,
        volume: 0.5,
      );

      expect(settings1, settings2);
    });
  });
}
