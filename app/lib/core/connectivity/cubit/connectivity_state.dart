import 'package:equatable/equatable.dart';

/// Represents the connectivity state of multiple services
class ConnectivityState extends Equatable {
  /// Map of service names to their availability status
  final Map<String, bool> servicesStatus;

  /// Whether the banner was manually dismissed by the user
  final bool isDismissed;

  /// Timestamp when all services reconnected
  final DateTime? reconnectedAt;

  const ConnectivityState({
    required this.servicesStatus,
    this.isDismissed = false,
    this.reconnectedAt,
  });

  /// Creates initial state with all services online
  factory ConnectivityState.initial(List<String> serviceNames) {
    return ConnectivityState(
      servicesStatus: {
        for (var name in serviceNames) name: true,
      },
    );
  }

  /// At least one service is offline
  bool get hasOfflineServices =>
      servicesStatus.values.any((available) => !available);

  /// All services are online
  bool get allOnline => servicesStatus.values.every((available) => available);

  /// Some but not all services are offline
  bool get partiallyOffline => hasOfflineServices && !allOffline;

  /// All services are offline
  bool get allOffline => servicesStatus.values.every((available) => !available);

  /// Whether to show the connectivity banner
  bool get shouldShowBanner => hasOfflineServices && !isDismissed;

  /// Human-readable status message
  String get statusMessage {
    if (allOnline) {
      return 'All services online';
    }

    if (allOffline) {
      return 'Working offline';
    }

    // Partially offline - list which services
    final offlineServices = servicesStatus.entries
        .where((entry) => !entry.value)
        .map((entry) => _formatServiceName(entry.key))
        .join(', ');

    return '$offlineServices unavailable';
  }

  /// Format service name for display
  String _formatServiceName(String serviceName) {
    // Capitalize first letter
    if (serviceName.isEmpty) return serviceName;
    return serviceName[0].toUpperCase() + serviceName.substring(1);
  }

  /// Create a copy with updated fields
  ConnectivityState copyWith({
    Map<String, bool>? servicesStatus,
    bool? isDismissed,
    DateTime? reconnectedAt,
    bool clearReconnectedAt = false,
  }) {
    return ConnectivityState(
      servicesStatus: servicesStatus ?? this.servicesStatus,
      isDismissed: isDismissed ?? this.isDismissed,
      reconnectedAt:
          clearReconnectedAt ? null : (reconnectedAt ?? this.reconnectedAt),
    );
  }

  @override
  List<Object?> get props => [servicesStatus, isDismissed, reconnectedAt];
}
