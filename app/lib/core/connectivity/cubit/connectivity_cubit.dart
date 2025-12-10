import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/core/connectivity/connectivity_mixin.dart';

import 'connectivity_state.dart';

/// Cubit that monitors connectivity status of multiple services
///
/// Listens to availability streams from services that implement
/// [ConnectivityMixin] and manages the overall connectivity state.
///
/// Features:
/// - Tracks multiple services simultaneously
/// - Auto-hides banner after reconnection
/// - Allows manual dismissal
/// - Provides aggregated status
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Map<String, ConnectivityMixin> _services;
  final Map<String, StreamSubscription<bool>> _subscriptions = {};
  Timer? _autoHideTimer;

  /// Duration to wait before auto-hiding banner after reconnection
  final Duration autoHideDuration;

  ConnectivityCubit({
    required Map<String, ConnectivityMixin> services,
    this.autoHideDuration = const Duration(seconds: 3),
  })  : _services = services,
        super(ConnectivityState.initial(services.keys.toList())) {
    _subscribeToServices();
    _initializeCurrentStatus();
  }

  /// Subscribe to availability streams from all services
  void _subscribeToServices() {
    for (var entry in _services.entries) {
      final serviceName = entry.key;
      final service = entry.value;

      _subscriptions[serviceName] = service.availability.listen(
        (available) => _onServiceAvailabilityChanged(serviceName, available),
      );
    }
  }

  /// Initialize state with current service statuses
  void _initializeCurrentStatus() {
    final currentStatus = <String, bool>{};
    for (var entry in _services.entries) {
      currentStatus[entry.key] = entry.value.isAvailable;
    }

    emit(state.copyWith(servicesStatus: currentStatus));
  }

  /// Handle service availability change
  void _onServiceAvailabilityChanged(String serviceName, bool available) {
    final newStatus = Map<String, bool>.from(state.servicesStatus);
    newStatus[serviceName] = available;

    final wasOffline = state.hasOfflineServices;
    final nowOnline = newStatus.values.every((v) => v);

    emit(ConnectivityState(
      servicesStatus: newStatus,
      isDismissed: false, // Show banner on any status change
    ));

    // If all services reconnected after being offline, start auto-hide timer
    if (wasOffline && nowOnline) {
      emit(state.copyWith(reconnectedAt: DateTime.now()));
      _startAutoHideTimer();
    } else {
      _autoHideTimer?.cancel();
    }
  }

  /// Manually dismiss the connectivity banner
  void dismissBanner() {
    emit(state.copyWith(isDismissed: true));
    _autoHideTimer?.cancel();
  }

  /// Start timer to auto-hide banner after reconnection
  void _startAutoHideTimer() {
    _autoHideTimer?.cancel();
    _autoHideTimer = Timer(autoHideDuration, () {
      if (state.allOnline && !isClosed) {
        emit(state.copyWith(isDismissed: true));
      }
    });
  }

  @override
  Future<void> close() {
    _autoHideTimer?.cancel();
    for (var subscription in _subscriptions.values) {
      subscription.cancel();
    }
    return super.close();
  }
}
