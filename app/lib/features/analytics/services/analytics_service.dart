import '../models/analytics_event.dart';

/// Interface for analytics service implementations
abstract class AnalyticsService {
  /// Track a single analytics event
  Future<void> trackEvent(AnalyticsEvent event);

  /// Track multiple analytics events in batch
  Future<void> trackEvents(List<AnalyticsEvent> events);

  /// Start a new app session
  Future<String> startSession({
    required String userId,
    required String deviceInfo,
    required String appVersion,
  });

  /// End the current app session
  Future<void> endSession(String sessionId);

  /// Upload any pending events that haven't been sent
  Future<void> uploadPendingEvents();

  /// Clear all stored analytics data
  Future<void> clearAnalytics();

  /// Check if the service is ready to accept events
  Future<bool> isReady();
}
