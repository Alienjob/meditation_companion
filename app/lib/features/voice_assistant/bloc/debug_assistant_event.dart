import 'assistant_event.dart';

/// Debug events for manually controlling MockAssistantBloc state
/// These events simulate server/network conditions that would normally
/// happen automatically in production

/// Simulate connection to AI service
class DebugConnect extends AssistantEvent {}

/// Simulate connection error
class DebugConnectionError extends AssistantEvent {
  final String message;
  const DebugConnectionError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Simulate network timeout
class DebugNetworkTimeout extends AssistantEvent {}

/// Simulate rate limiting
class DebugRateLimit extends AssistantEvent {}

/// Simulate assistant going into responding state
class DebugStartResponding extends AssistantEvent {}

/// Simulate assistant finishing response
class DebugFinishResponding extends AssistantEvent {}

/// Force assistant to ready state (clear all errors)
class DebugForceReady extends AssistantEvent {}
