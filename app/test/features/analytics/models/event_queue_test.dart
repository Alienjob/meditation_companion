import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/features/analytics/models/analytics_event.dart';
import 'package:meditation_companion/features/analytics/models/event_queue.dart';

void main() {
  late EventQueue queue;

  setUp(() {
    queue = EventQueue(
      maxRetries: 3,
      maxAge: const Duration(days: 1),
    );
  });

  AnalyticsEvent createTestEvent(String id) {
    return AnalyticsEvent(
      id: id,
      sessionId: 'test_session',
      userId: 'test_user',
      timestamp: DateTime.now(),
      eventType: 'test.event',
      parameters: {'test': 'value'},
    );
  }

  group('basic operations', () {
    test('starts empty', () {
      expect(queue.isEmpty, isTrue);
      expect(queue.length, equals(0));
    });

    test('can enqueue events', () {
      queue.enqueue(createTestEvent('1'));
      expect(queue.isEmpty, isFalse);
      expect(queue.length, equals(1));
    });

    test('can get all events', () {
      final event = createTestEvent('1');
      queue.enqueue(event);

      final events = queue.allEvents;
      expect(events.length, equals(1));
      expect(events.first.event.id, equals('1'));
      expect(events.first.retryCount, equals(0));
    });
  });

  group('batch processing', () {
    test('respects batch size', () {
      for (var i = 0; i < 5; i++) {
        queue.enqueue(createTestEvent(i.toString()));
      }

      final batch = queue.getNextBatch(3);
      expect(batch.length, equals(3));
    });

    test('can remove processed events', () {
      queue.enqueue(createTestEvent('1'));
      final batch = queue.getNextBatch(1);
      queue.removeEvents(batch);
      expect(queue.isEmpty, isTrue);
    });

    test('can mark events as failed', () {
      queue.enqueue(createTestEvent('1'));
      final batch = queue.getNextBatch(1);
      queue.markAsFailed(batch);

      expect(queue.allEvents.first.retryCount, equals(1));
    });

    test('excludes events that exceeded retry limit', () {
      queue.enqueue(createTestEvent('1'));
      var batch = queue.getNextBatch(1);

      for (var i = 0; i < 3; i++) {
        queue.markAsFailed(batch);
        batch = queue.getNextBatch(1);
      }

      expect(batch.isEmpty, isTrue);
    });
  });

  group('cleanup', () {
    test('removes expired events', () {
      queue = EventQueue(
        maxAge: const Duration(hours: 1),
      );

      final oldEvent = QueuedEvent(
        event: createTestEvent('1'),
        queuedAt: DateTime.now().subtract(const Duration(hours: 2)),
      );

      queue = EventQueue(
        initialEvents: [oldEvent],
        maxAge: const Duration(hours: 1),
      );

      queue.cleanup();
      expect(queue.isEmpty, isTrue);
    });

    test('removes events exceeding retry limit', () {
      final failedEvent = QueuedEvent(
        event: createTestEvent('1'),
        queuedAt: DateTime.now(),
        retryCount: 3,
      );

      queue = EventQueue(
        initialEvents: [failedEvent],
        maxRetries: 3,
      );

      queue.cleanup();
      expect(queue.isEmpty, isTrue);
    });
  });

  group('json serialization', () {
    test('can serialize to json and back', () {
      final event = createTestEvent('1');
      queue.enqueue(event);

      final json = queue.toJson();
      final restoredQueue = EventQueue.fromJson(json);

      expect(restoredQueue.length, equals(queue.length));
      expect(restoredQueue.allEvents.first.event.id, equals('1'));
      expect(restoredQueue.allEvents.first.retryCount, equals(0));
    });

    test('preserves queue settings', () {
      queue = EventQueue(
        maxRetries: 5,
        maxAge: const Duration(days: 2),
      );

      final json = queue.toJson();
      final restoredQueue = EventQueue.fromJson(json);

      // Test settings by adding and processing events
      for (var i = 0; i < 6; i++) {
        restoredQueue.enqueue(createTestEvent(i.toString()));
      }

      var batch = restoredQueue.getNextBatch(6);
      for (var i = 0; i < 5; i++) {
        restoredQueue.markAsFailed(batch);
        batch = restoredQueue.getNextBatch(6);
      }

      // Should still have events since maxRetries is 5
      expect(restoredQueue.isEmpty, isFalse);
    });
  });
}
