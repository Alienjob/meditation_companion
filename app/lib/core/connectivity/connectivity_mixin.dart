import 'dart:async';

import 'package:flutter/foundation.dart';

/// Mixin that provides connectivity status tracking for services
///
/// Services that depend on external APIs can use this mixin to:
/// - Track availability status
/// - Expose status changes via stream
/// - Handle connection loss and restoration
mixin ConnectivityMixin {
  bool _isAvailable = true;
  DateTime? _lastCheckTime;
  StreamController<bool>? _availabilityController;

  /// Stream of availability status changes
  ///
  /// Emits `true` when service becomes available,
  /// `false` when service becomes unavailable
  Stream<bool> get availability {
    _availabilityController ??= StreamController<bool>.broadcast();
    return _availabilityController!.stream;
  }

  /// Current availability status
  ///
  /// Returns `true` if service is available,
  /// `false` if service is unavailable
  bool get isAvailable => _isAvailable;

  /// Timestamp of last availability check
  ///
  /// Returns `null` if status has never been updated
  DateTime? get lastCheckTime => _lastCheckTime;

  /// Update availability status
  ///
  /// Only emits to stream if status actually changes.
  /// Updates [lastCheckTime] and calls appropriate hooks.
  @protected
  void updateAvailability(bool available) {
    if (_isAvailable != available) {
      _isAvailable = available;
      _lastCheckTime = DateTime.now();
      _availabilityController?.add(available);

      if (available) {
        onConnectionRestored();
      } else {
        onConnectionLost();
      }
    }
  }

  /// Hook called when connection is restored
  ///
  /// Override this method to implement custom behavior
  /// when service becomes available again
  @protected
  void onConnectionRestored() {}

  /// Hook called when connection is lost
  ///
  /// Override this method to implement custom behavior
  /// when service becomes unavailable
  @protected
  void onConnectionLost() {}

  /// Dispose connectivity resources
  ///
  /// Must be called when the service is disposed to prevent memory leaks
  @protected
  void disposeConnectivity() {
    _availabilityController?.close();
    _availabilityController = null;
  }
}
