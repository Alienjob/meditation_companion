import 'dart:typed_data';
import 'package:equatable/equatable.dart';

abstract class AssistantEvent extends Equatable {
  const AssistantEvent();

  @override
  List<Object?> get props => [];
}

// Client Events
class ClientConnected extends AssistantEvent {}

class ClientError extends AssistantEvent {
  final String error;
  const ClientError(this.error);

  @override
  List<Object?> get props => [error];
}

// Recording Events
class StartRecordingUserAudioInput extends AssistantEvent {}

class StopRecordingUserAudioInput extends AssistantEvent {}

class ClearRecordedAudio extends AssistantEvent {}

class SendRecordedAudio extends AssistantEvent {}

class ToggleStreamingMode extends AssistantEvent {
  final bool enabled;
  const ToggleStreamingMode(this.enabled);

  @override
  List<Object?> get props => [enabled];
}

class ServerVadSpeechStarted extends AssistantEvent {}

class ServerVadSpeechStopped extends AssistantEvent {}

// Response Events
class UserMessageTranscribed extends AssistantEvent {
  final String itemId;
  final String transcript;

  const UserMessageTranscribed({
    required this.itemId,
    required this.transcript,
  });

  @override
  List<Object?> get props => [itemId, transcript];
}

class ResponseTextReceived extends AssistantEvent {
  final String itemId;
  final String text;

  const ResponseTextReceived({
    required this.itemId,
    required this.text,
  });

  @override
  List<Object?> get props => [itemId, text];
}

class ResponseAudioReceived extends AssistantEvent {
  final String itemId;
  final Uint8List audioData;

  const ResponseAudioReceived({
    required this.itemId,
    required this.audioData,
  });

  @override
  List<Object?> get props => [itemId, audioData];
}

class ResponseAudioStreamEnded extends AssistantEvent {
  final String itemId;

  const ResponseAudioStreamEnded(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class InterruptResponse extends AssistantEvent {}

class ResponseCompleted extends AssistantEvent {
  final String itemId;
  const ResponseCompleted(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class UpdateRecordingDuration extends AssistantEvent {
  const UpdateRecordingDuration();

  @override
  List<Object?> get props => [];
}
