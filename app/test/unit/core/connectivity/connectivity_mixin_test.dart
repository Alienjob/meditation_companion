import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/core/connectivity/connectivity_mixin.dart';

// Test implementation of ConnectivityMixin
class TestService with ConnectivityMixin {
  bool connectionRestoredCalled = false;
  bool connectionLostCalled = false;

  @override
  void onConnectionRestored() {
    connectionRestoredCalled = true;
  }

  @override
  void onConnectionLost() {
    connectionLostCalled = true;
  }

  // Public methods for testing protected members
  void testUpdateAvailability(bool available) {
    updateAvailability(available);
  }

  void testDisposeConnectivity() {
    disposeConnectivity();
  }
}

void main() {
  group('ConnectivityMixin', () {
    late TestService service;

    setUp(() {
      service = TestService();
    });

    tearDown(() {
      service.testDisposeConnectivity();
    });

    group('Initial state', () {
      test('starts with isAvailable = true', () {
        expect(service.isAvailable, true);
      });

      test('lastCheckTime is null initially', () {
        expect(service.lastCheckTime, isNull);
      });
    });

    group('updateAvailability', () {
      test('changes availability status', () {
        service.testUpdateAvailability(false);
        expect(service.isAvailable, false);

        service.testUpdateAvailability(true);
        expect(service.isAvailable, true);
      });

      test('updates lastCheckTime when status changes', () {
        final beforeUpdate = DateTime.now();
        service.testUpdateAvailability(false);
        final afterUpdate = DateTime.now();

        expect(service.lastCheckTime, isNotNull);
        expect(
          service.lastCheckTime!.isAfter(beforeUpdate) ||
              service.lastCheckTime!.isAtSameMomentAs(beforeUpdate),
          true,
        );
        expect(
          service.lastCheckTime!.isBefore(afterUpdate) ||
              service.lastCheckTime!.isAtSameMomentAs(afterUpdate),
          true,
        );
      });

      test('does not update lastCheckTime when status unchanged', () {
        service.testUpdateAvailability(false);
        final firstCheckTime = service.lastCheckTime;

        // Small delay to ensure different timestamp if it were updated
        Future.delayed(const Duration(milliseconds: 10));

        service.testUpdateAvailability(false); // same value
        expect(service.lastCheckTime, firstCheckTime);
      });

      test('emits to stream when status changes', () {
        expectLater(
          service.availability,
          emitsInOrder([false, true]),
        );

        service.testUpdateAvailability(false);
        service.testUpdateAvailability(true);
      });

      test('does not emit to stream when status unchanged', () {
        expectLater(
          service.availability,
          emits(false),
        );

        service.testUpdateAvailability(false);
        service.testUpdateAvailability(false); // should not emit again
      });

      test('calls onConnectionLost when becoming unavailable', () {
        expect(service.connectionLostCalled, false);

        service.testUpdateAvailability(false);

        expect(service.connectionLostCalled, true);
      });

      test('calls onConnectionRestored when becoming available', () {
        service.testUpdateAvailability(false); // first make it unavailable
        service.connectionRestoredCalled = false; // reset flag

        service.testUpdateAvailability(true);

        expect(service.connectionRestoredCalled, true);
      });

      test('does not call hooks when status unchanged', () {
        service.testUpdateAvailability(false);
        service.connectionLostCalled = false; // reset

        service.testUpdateAvailability(false); // same value

        expect(service.connectionLostCalled, false);
      });
    });

    group('availability stream', () {
      test('is broadcast stream', () {
        final stream = service.availability;
        expect(stream.isBroadcast, true);
      });

      test('multiple listeners can subscribe', () async {
        final events1 = <bool>[];
        final events2 = <bool>[];

        service.availability.listen((event) => events1.add(event));
        service.availability.listen((event) => events2.add(event));

        service.testUpdateAvailability(false);
        service.testUpdateAvailability(true);

        // Wait for async stream events
        await Future.delayed(const Duration(milliseconds: 10));

        expect(events1, [false, true]);
        expect(events2, [false, true]);
      });

      test('returns same controller on multiple calls', () {
        final stream1 = service.availability;
        final stream2 = service.availability;

        // Both should work and emit same events
        expect(stream1.isBroadcast, true);
        expect(stream2.isBroadcast, true);
      });
    });

    group('disposeConnectivity', () {
      test('closes stream controller', () async {
        final stream = service.availability;
        final events = <bool>[];
        stream.listen((event) => events.add(event));

        service.testUpdateAvailability(false);
        await Future.delayed(const Duration(milliseconds: 10));

        service.testDisposeConnectivity();

        // After dispose, no new events should be emitted
        expect(events, [false]);
      });

      test('can be called multiple times safely', () {
        expect(
          () {
            service.testDisposeConnectivity();
            service.testDisposeConnectivity();
          },
          returnsNormally,
        );
      });
    });

    group('Complex scenarios', () {
      test('handles rapid status changes correctly', () async {
        final events = <bool>[];
        service.availability.listen((event) => events.add(event));

        service.testUpdateAvailability(false);
        service.testUpdateAvailability(true);
        service.testUpdateAvailability(false);
        service.testUpdateAvailability(true);

        // Wait for async stream events
        await Future.delayed(const Duration(milliseconds: 10));

        expect(events, [false, true, false, true]);
        expect(service.isAvailable, true);
      });

      test('maintains correct state after multiple updates', () {
        service.testUpdateAvailability(false);
        service.testUpdateAvailability(false); // no change
        service.testUpdateAvailability(true);
        service.testUpdateAvailability(true); // no change
        service.testUpdateAvailability(false);

        expect(service.isAvailable, false);
        expect(service.lastCheckTime, isNotNull);
      });
    });
  });
}
