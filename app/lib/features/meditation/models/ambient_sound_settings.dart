import 'package:equatable/equatable.dart';

/// Represents the settings for an ambient sound, including its active state and volume
class AmbientSoundSettings extends Equatable {
  /// Whether the sound is currently active
  final bool isActive;

  /// The volume level of the sound (0.0 to 1.0)
  final double volume;

  /// Creates an instance of [AmbientSoundSettings]
  ///
  /// [isActive] defaults to false
  /// [volume] defaults to 1.0 and must be between 0.0 and 1.0
  const AmbientSoundSettings({
    this.isActive = false,
    this.volume = 1.0,
  }) : assert(volume >= 0.0 && volume <= 1.0,
            'Volume must be between 0.0 and 1.0');

  /// Creates a copy of this settings with the given fields replaced with new values
  AmbientSoundSettings copyWith({
    bool? isActive,
    double? volume,
  }) {
    return AmbientSoundSettings(
      isActive: isActive ?? this.isActive,
      volume: volume ?? this.volume,
    );
  }

  @override
  List<Object?> get props => [isActive, volume];

  @override
  String toString() =>
      'AmbientSoundSettings(isActive: $isActive, volume: $volume)';
}
