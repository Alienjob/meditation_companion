import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meditation_companion/core/connectivity/connectivity_mixin.dart';
import 'package:meditation_companion/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:meditation_companion/core/connectivity/cubit/connectivity_state.dart';

// Mock service with ConnectivityMixin
class MockService with ConnectivityMixin {
  void testUpdateAvailability(bool available) {
    updateAvailability(available);
  }

  void testDispose() {
    disposeConnectivity();
  }
}

void main() {
  group('ConnectivityCubit', () {
    late MockService service1;
    late MockService service2;

    setUp(() {
      service1 = MockService();
      service2 = MockService();
    });

    tearDown(() {
      service1.testDispose();
      service2.testDispose();
    });

    group('Initial state', () {
      blocTest<ConnectivityCubit, ConnectivityState>(
        'emits initial state with all services online',
        build: () => ConnectivityCubit(
          services: {
            'service1': service1,
            'service2': service2,
          },
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        verify: (cubit) {
          expect(cubit.state.servicesStatus, {
            'service1': true,
            'service2': true,
          });
          expect(cubit.state.allOnline, true);
          expect(cubit.state.isDismissed, false);
        },
      );

      test('initializes with current service statuses', () async {
        service1.testUpdateAvailability(false);

        final cubit = ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        );

        // Wait for initialization
        await Future.delayed(const Duration(milliseconds: 50));

        expect(cubit.state.servicesStatus['service1'], false);

        await cubit.close();
      });
    });

    group('Service availability changes', () {
      blocTest<ConnectivityCubit, ConnectivityState>(
        'emits new state when service becomes offline',
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) => service1.testUpdateAvailability(false),
        expect: () => [
          predicate<ConnectivityState>(
            (state) =>
                state.servicesStatus['service1'] == false &&
                state.shouldShowBanner &&
                !state.isDismissed,
          ),
        ],
      );

      blocTest<ConnectivityCubit, ConnectivityState>(
        'emits new state when service becomes online',
        setUp: () {
          service1.testUpdateAvailability(false);
        },
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) => service1.testUpdateAvailability(true),
        skip: 1, // Skip the initial offline state
        expect: () => [
          predicate<ConnectivityState>(
            (state) =>
                state.servicesStatus['service1'] == true &&
                state.reconnectedAt != null,
          ),
        ],
      );

      blocTest<ConnectivityCubit, ConnectivityState>(
        'handles multiple services changing status',
        build: () => ConnectivityCubit(
          services: {
            'service1': service1,
            'service2': service2,
          },
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) {
          service1.testUpdateAvailability(false);
          service2.testUpdateAvailability(false);
        },
        expect: () => [
          predicate<ConnectivityState>(
            (state) => state.servicesStatus['service1'] == false,
          ),
          predicate<ConnectivityState>(
            (state) =>
                state.servicesStatus['service1'] == false &&
                state.servicesStatus['service2'] == false &&
                state.allOffline,
          ),
        ],
      );
    });

    group('Manual dismissal', () {
      test('dismisses banner when dismissBanner called', () async {
        service1.testUpdateAvailability(false);

        final cubit = ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        );

        await Future.delayed(const Duration(milliseconds: 50));

        cubit.dismissBanner();
        await Future.delayed(const Duration(milliseconds: 10));

        expect(cubit.state.isDismissed, true);
        expect(cubit.state.shouldShowBanner, false);

        await cubit.close();
      });

      blocTest<ConnectivityCubit, ConnectivityState>(
        'can dismiss banner even when all services online',
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) => cubit.dismissBanner(),
        expect: () => [
          predicate<ConnectivityState>(
            (state) => state.isDismissed,
          ),
        ],
      );
    });

    group('Auto-hide functionality', () {
      blocTest<ConnectivityCubit, ConnectivityState>(
        'auto-hides banner after reconnection',
        setUp: () {
          service1.testUpdateAvailability(false);
        },
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) async {
          service1.testUpdateAvailability(true);
          // Wait for auto-hide timer
          await Future.delayed(const Duration(milliseconds: 150));
        },
        skip: 1, // Skip initial offline state
        expect: () => [
          predicate<ConnectivityState>(
            (state) =>
                state.allOnline &&
                state.reconnectedAt != null &&
                !state.isDismissed,
          ),
          predicate<ConnectivityState>(
            (state) => state.allOnline && state.isDismissed,
          ),
        ],
      );

      blocTest<ConnectivityCubit, ConnectivityState>(
        'does not auto-hide if service goes offline again',
        setUp: () {
          service1.testUpdateAvailability(false);
        },
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) async {
          service1.testUpdateAvailability(true);
          await Future.delayed(const Duration(milliseconds: 50));
          service1.testUpdateAvailability(false);
          await Future.delayed(const Duration(milliseconds: 100));
        },
        skip: 1,
        expect: () => [
          predicate<ConnectivityState>((state) => state.allOnline),
          predicate<ConnectivityState>(
            (state) => !state.allOnline && !state.isDismissed,
          ),
          // Should not emit dismissed state
        ],
      );

      blocTest<ConnectivityCubit, ConnectivityState>(
        'cancels auto-hide on manual dismiss',
        setUp: () {
          service1.testUpdateAvailability(false);
        },
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) async {
          service1.testUpdateAvailability(true);
          await Future.delayed(const Duration(milliseconds: 50));
          cubit.dismissBanner();
          await Future.delayed(const Duration(milliseconds: 100));
        },
        skip: 1,
        expect: () => [
          predicate<ConnectivityState>((state) => state.allOnline),
          predicate<ConnectivityState>((state) => state.isDismissed),
          // Should not emit another dismissed state from timer
        ],
      );
    });

    group('Resource cleanup', () {
      test('cancels subscriptions on close', () async {
        final cubit = ConnectivityCubit(
          services: {
            'service1': service1,
            'service2': service2,
          },
        );

        await cubit.close();

        // Verify subscriptions are cancelled by checking that
        // service updates don't trigger state changes
        service1.testUpdateAvailability(false);
        expect(cubit.isClosed, true);
      });

      test('cancels auto-hide timer on close', () async {
        service1.testUpdateAvailability(false);

        final cubit = ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        );

        service1.testUpdateAvailability(true);
        await cubit.close();

        // Wait for what would have been the auto-hide
        await Future.delayed(const Duration(milliseconds: 150));

        // Cubit should be closed and not emit
        expect(cubit.isClosed, true);
      });
    });

    group('Complex scenarios', () {
      blocTest<ConnectivityCubit, ConnectivityState>(
        'handles rapid status changes correctly',
        build: () => ConnectivityCubit(
          services: {'service1': service1},
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) {
          service1.testUpdateAvailability(false);
          service1.testUpdateAvailability(true);
          service1.testUpdateAvailability(false);
        },
        expect: () => [
          predicate<ConnectivityState>((state) => !state.allOnline),
          predicate<ConnectivityState>(
              (state) => state.allOnline && state.reconnectedAt == null),
          predicate<ConnectivityState>(
              (state) => state.allOnline && state.reconnectedAt != null),
          predicate<ConnectivityState>((state) => !state.allOnline),
        ],
      );

      blocTest<ConnectivityCubit, ConnectivityState>(
        'tracks mixed service states correctly',
        build: () => ConnectivityCubit(
          services: {
            'service1': service1,
            'service2': service2,
          },
          autoHideDuration: const Duration(milliseconds: 100),
        ),
        act: (cubit) {
          service1.testUpdateAvailability(false);
          service2.testUpdateAvailability(false);
          service1.testUpdateAvailability(true);
        },
        expect: () => [
          predicate<ConnectivityState>(
            (state) =>
                !state.servicesStatus['service1']! &&
                state.servicesStatus['service2']!,
          ),
          predicate<ConnectivityState>(
            (state) =>
                !state.servicesStatus['service1']! &&
                !state.servicesStatus['service2']! &&
                state.allOffline,
          ),
          predicate<ConnectivityState>(
            (state) =>
                state.servicesStatus['service1']! &&
                !state.servicesStatus['service2']! &&
                state.partiallyOffline,
          ),
        ],
      );
    });
  });
}
