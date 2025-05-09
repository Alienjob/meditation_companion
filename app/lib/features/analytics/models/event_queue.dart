import 'dart:convert';

import '../models/analytics_event.dart';

/// Represents a queued analytics event with metadata
class QueuedEvent {
  final AnalyticsEvent event;
  final DateTime queuedAt;
  final int retryCount;

  const QueuedEvent({
    required this.event,
    required this.queuedAt,
    this.retryCount = 0,
  });

  QueuedEvent incrementRetry() {
    return QueuedEvent(
      event: event,
      queuedAt: queuedAt,
      retryCount: retryCount + 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'event': {
        'id': event.id,
        'sessionId': event.sessionId,
        'userId': event.userId,
        'timestamp': event.timestamp.toIso8601String(),
        'eventType': event.eventType,
        'parameters': event.parameters,
      },
      'queuedAt': queuedAt.toIso8601String(),
      'retryCount': retryCount,
    };
  }

  factory QueuedEvent.fromJson(Map<String, dynamic> json) {
    final eventJson = json['event'] as Map<String, dynamic>;
    final event = AnalyticsEvent(
      id: eventJson['id'] as String,
      sessionId: eventJson['sessionId'] as String,
      userId: eventJson['userId'] as String,
      timestamp: DateTime.parse(eventJson['timestamp'] as String),
      eventType: eventJson['eventType'] as String,
      parameters: Map<String, String>.from(eventJson['parameters'] as Map),
    );

    return QueuedEvent(
      event: event,
      queuedAt: DateTime.parse(json['queuedAt'] as String),
      retryCount: json['retryCount'] as int,
    );
  }
}

/// Manages a queue of analytics events for offline storage
class EventQueue {
  final List<QueuedEvent> _queue;
  final int _maxRetries;
  final Duration _maxAge;

  EventQueue({
    List<QueuedEvent>? initialEvents,
    int maxRetries = 3,
    Duration maxAge = const Duration(days: 7),
  })  : _queue = initialEvents ?? [],
        _maxRetries = maxRetries,
        _maxAge = maxAge;

  /// Add an event to the queue
  void enqueue(AnalyticsEvent event) {
    _queue.add(QueuedEvent(
      event: event,
      queuedAt: DateTime.now(),
    ));
  }

  /// Get next batch of events to process
  /// Returns up to [batchSize] events that haven't exceeded retry limits
  List<QueuedEvent> getNextBatch(int batchSize) {
    final now = DateTime.now();
    return _queue
        .where((e) =>
            e.retryCount < _maxRetries && now.difference(e.queuedAt) <= _maxAge)
        .take(batchSize)
        .toList();
  }

  /// Remove successfully processed events
  void removeEvents(List<QueuedEvent> events) {
    _queue.removeWhere((e) => events.contains(e));
  }

  /// Mark events as failed, incrementing their retry count
  void markAsFailed(List<QueuedEvent> events) {
    for (final event in events) {
      final index = _queue.indexOf(event);
      if (index != -1) {
        _queue[index] = event.incrementRetry();
      }
    }
  }

  /// Remove expired events that are too old or have exceeded retry limits
  void cleanup() {
    final now = DateTime.now();
    _queue.removeWhere((e) =>
        e.retryCount >= _maxRetries || now.difference(e.queuedAt) > _maxAge);
  }

  /// Get all events in the queue
  List<QueuedEvent> get allEvents => List.unmodifiable(_queue);

  /// Check if queue is empty
  bool get isEmpty => _queue.isEmpty;

  /// Get number of events in queue
  int get length => _queue.length;

  /// Convert queue to JSON for storage
  String toJson() {
    return jsonEncode({
      'events': _queue.map((e) => e.toJson()).toList(),
      'maxRetries': _maxRetries,
      'maxAge': _maxAge.inMilliseconds,
    });
  }

  /// Create queue from JSON storage
  factory EventQueue.fromJson(String jsonStr) {
    final json = jsonDecode(jsonStr) as Map<String, dynamic>;
    final events = (json['events'] as List)
        .map((e) => QueuedEvent.fromJson(e as Map<String, dynamic>))
        .toList();

    return EventQueue(
      initialEvents: events,
      maxRetries: json['maxRetries'] as int,
      maxAge: Duration(milliseconds: json['maxAge'] as int),
    );
  }
}
