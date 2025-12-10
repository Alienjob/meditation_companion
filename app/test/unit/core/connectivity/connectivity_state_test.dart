import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/core/connectivity/cubit/connectivity_state.dart';

void main() {
  group('ConnectivityState', () {
    group('Initial state', () {
      test('creates state with all services online', () {
        final state = ConnectivityState.initial(['service1', 'service2']);

        expect(state.servicesStatus, {
          'service1': true,
          'service2': true,
        });
        expect(state.isDismissed, false);
        expect(state.reconnectedAt, isNull);
      });

      test('creates state with empty services list', () {
        final state = ConnectivityState.initial([]);

        expect(state.servicesStatus, isEmpty);
        expect(state.allOnline, true);
      });
    });

    group('Status flags', () {
      test('allOnline returns true when all services online', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true, 'service2': true},
        );

        expect(state.allOnline, true);
        expect(state.hasOfflineServices, false);
        expect(state.allOffline, false);
        expect(state.partiallyOffline, false);
      });

      test('allOffline returns true when all services offline', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': false, 'service2': false},
        );

        expect(state.allOffline, true);
        expect(state.hasOfflineServices, true);
        expect(state.allOnline, false);
        expect(state.partiallyOffline, false);
      });

      test('partiallyOffline returns true when some services offline', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true, 'service2': false},
        );

        expect(state.partiallyOffline, true);
        expect(state.hasOfflineServices, true);
        expect(state.allOnline, false);
        expect(state.allOffline, false);
      });

      test('handles single service', () {
        final onlineState = ConnectivityState(
          servicesStatus: {'service1': true},
        );
        final offlineState = ConnectivityState(
          servicesStatus: {'service1': false},
        );

        expect(onlineState.allOnline, true);
        expect(offlineState.allOffline, true);
      });
    });

    group('shouldShowBanner', () {
      test('returns true when services offline and not dismissed', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': false},
          isDismissed: false,
        );

        expect(state.shouldShowBanner, true);
      });

      test('returns false when services offline but dismissed', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': false},
          isDismissed: true,
        );

        expect(state.shouldShowBanner, false);
      });

      test('returns false when all services online', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true, 'service2': true},
          isDismissed: false,
        );

        expect(state.shouldShowBanner, false);
      });
    });

    group('statusMessage', () {
      test('returns "All services online" when all online', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true, 'service2': true},
        );

        expect(state.statusMessage, 'All services online');
      });

      test('returns "Working offline" when all offline', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': false, 'service2': false},
        );

        expect(state.statusMessage, 'Working offline');
      });

      test('lists offline services when partially offline', () {
        final state = ConnectivityState(
          servicesStatus: {
            'analytics': false,
            'openai': true,
          },
        );

        expect(state.statusMessage, 'Analytics unavailable');
      });

      test('lists multiple offline services', () {
        final state = ConnectivityState(
          servicesStatus: {
            'analytics': false,
            'openai': false,
            'storage': true,
          },
        );

        expect(
          state.statusMessage,
          contains('Analytics'),
        );
        expect(
          state.statusMessage,
          contains('Openai'),
        );
      });

      test('capitalizes service names', () {
        final state = ConnectivityState(
          servicesStatus: {
            'service': false,
            'another': true,
          },
        );

        expect(state.statusMessage, 'Service unavailable');
      });
    });

    group('copyWith', () {
      test('updates servicesStatus', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true},
        );

        final updated = state.copyWith(
          servicesStatus: {'service1': false},
        );

        expect(updated.servicesStatus, {'service1': false});
        expect(updated.isDismissed, state.isDismissed);
        expect(updated.reconnectedAt, state.reconnectedAt);
      });

      test('updates isDismissed', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true},
          isDismissed: false,
        );

        final updated = state.copyWith(isDismissed: true);

        expect(updated.isDismissed, true);
        expect(updated.servicesStatus, state.servicesStatus);
      });

      test('updates reconnectedAt', () {
        final state = ConnectivityState(
          servicesStatus: {'service1': true},
        );
        final now = DateTime.now();

        final updated = state.copyWith(reconnectedAt: now);

        expect(updated.reconnectedAt, now);
      });

      test('clears reconnectedAt when clearReconnectedAt is true', () {
        final now = DateTime.now();
        final state = ConnectivityState(
          servicesStatus: {'service1': true},
          reconnectedAt: now,
        );

        final updated = state.copyWith(clearReconnectedAt: true);

        expect(updated.reconnectedAt, isNull);
      });
    });

    group('Equatable', () {
      test('equal states have same props', () {
        final state1 = ConnectivityState(
          servicesStatus: {'service1': true},
          isDismissed: false,
        );
        final state2 = ConnectivityState(
          servicesStatus: {'service1': true},
          isDismissed: false,
        );

        expect(state1, equals(state2));
      });

      test('different servicesStatus means different states', () {
        final state1 = ConnectivityState(
          servicesStatus: {'service1': true},
        );
        final state2 = ConnectivityState(
          servicesStatus: {'service1': false},
        );

        expect(state1, isNot(equals(state2)));
      });

      test('different isDismissed means different states', () {
        final state1 = ConnectivityState(
          servicesStatus: {'service1': true},
          isDismissed: false,
        );
        final state2 = ConnectivityState(
          servicesStatus: {'service1': true},
          isDismissed: true,
        );

        expect(state1, isNot(equals(state2)));
      });
    });
  });
}
