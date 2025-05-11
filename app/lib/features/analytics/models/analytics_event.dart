import 'package:equatable/equatable.dart';

/// Base class for all analytics events
class AnalyticsEvent extends Equatable {
  final String id;
  final String userId;
  final DateTime timestamp;
  final String eventType;
  final Map<String, String> parameters;

  AnalyticsEvent({
    required this.id,
    required this.userId,
    required this.timestamp,
    required this.eventType,
    required Map<String, String> parameters,
  }) : parameters = Map.unmodifiable(parameters);

  @override
  List<Object?> get props => [
        id,
        userId,
        timestamp,
        eventType,
        parameters,
      ];

  @override
  String toString() =>
      'AnalyticsEvent(id: $id, type: $eventType, parameters: $parameters)';
}

/// Meditation-related analytics events
class MeditationEvent extends AnalyticsEvent {
  String get meditationId => parameters['meditationId']!;

  MeditationEvent({
    required super.id,
    required super.userId,
    required super.timestamp,
    required super.eventType,
    required String meditationId,
    required Map<String, String> additionalParams,
  }) : super(parameters: {
          'meditationId': meditationId,
          ...additionalParams,
        });

  factory MeditationEvent.started({
    required String id,
    required String userId,
    required String meditationId,
    required Duration plannedDuration,
  }) {
    return MeditationEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'meditation.session.start',
      meditationId: meditationId,
      additionalParams: {
        'plannedDuration': plannedDuration.inSeconds.toString(),
      },
    );
  }

  factory MeditationEvent.completed({
    required String id,
    required String userId,
    required String meditationId,
    required Duration actualDuration,
  }) {
    return MeditationEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'meditation.session.complete',
      meditationId: meditationId,
      additionalParams: {
        'actualDuration': actualDuration.inSeconds.toString(),
        'completionType': 'completed',
      },
    );
  }
}

/// Audio-related analytics events
class AudioEvent extends AnalyticsEvent {
  String get soundId => parameters['soundId']!;

  AudioEvent({
    required super.id,
    required super.userId,
    required super.timestamp,
    required super.eventType,
    required String soundId,
    String? meditationId,
    required Map<String, String> additionalParams,
  }) : super(parameters: {
          'soundId': soundId,
          if (meditationId != null) 'meditationId': meditationId,
          ...additionalParams,
        });

  factory AudioEvent.volumeChanged({
    required String id,
    required String userId,
    required String soundId,
    required double volume,
    String? meditationId,
  }) {
    return AudioEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'audio.volume.change',
      soundId: soundId,
      meditationId: meditationId,
      additionalParams: {
        'volume': volume.toString(),
      },
    );
  }

  factory AudioEvent.soundToggled({
    required String id,
    required String userId,
    required String soundId,
    required bool isActive,
    String? meditationId,
  }) {
    return AudioEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'audio.sound.toggle',
      soundId: soundId,
      meditationId: meditationId,
      additionalParams: {
        'isActive': isActive.toString(),
      },
    );
  }
}

/// UI interaction analytics events
class UIEvent extends AnalyticsEvent {
  UIEvent({
    required super.id,
    required super.userId,
    required super.timestamp,
    required super.eventType,
    String? meditationId,
    required Map<String, String> additionalParams,
  }) : super(parameters: {
          if (meditationId != null) 'meditationId': meditationId,
          ...additionalParams,
        });

  factory UIEvent.screenView({
    required String id,
    required String userId,
    required String screenName,
    String? meditationId,
  }) {
    return UIEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'ui.screen.view',
      meditationId: meditationId,
      additionalParams: {
        'screenName': screenName,
      },
    );
  }

  factory UIEvent.buttonClick({
    required String id,
    required String userId,
    required String buttonId,
    required String screenName,
    String? meditationId,
  }) {
    return UIEvent(
      id: id,
      userId: userId,
      timestamp: DateTime.now(),
      eventType: 'ui.button.click',
      meditationId: meditationId,
      additionalParams: {
        'buttonId': buttonId,
        'screenName': screenName,
      },
    );
  }
}
