import 'dart:typed_data';
import 'package:equatable/equatable.dart';

enum ClientStatus { connecting, ready, rateLimited, error }

enum UserInputState { idle, recording, recorded }

enum ResponseState { idle, responding }

class AssistantState extends Equatable {
  final ClientStatus clientStatus;
  final UserInputState userInput;
  final ResponseState responseState;
  final Uint8List? recordedAudio;
  final Duration recordingDuration;
  final String? lastError;
  final bool streamingDesired;
  final bool streamedSoundContainsVoice;

  static const maxRecordingDuration = Duration(seconds: 30);

  const AssistantState({
    this.clientStatus = ClientStatus.connecting,
    this.userInput = UserInputState.idle,
    this.responseState = ResponseState.idle,
    this.recordedAudio,
    this.recordingDuration = const Duration(),
    this.lastError,
    this.streamingDesired = false,
    this.streamedSoundContainsVoice = false,
  });

  bool get canRecord =>
      clientStatus == ClientStatus.ready &&
      userInput == UserInputState.idle &&
      responseState == ResponseState.idle;

  bool get canSendRecording =>
      userInput == UserInputState.recorded && recordedAudio != null;

  bool get canInterrupt => responseState == ResponseState.responding;

  AssistantState copyWith({
    ClientStatus? clientStatus,
    UserInputState? userInput,
    ResponseState? responseState,
    Uint8List? Function()? recordedAudio,
    Duration? recordingDuration,
    String? Function()? lastError,
    bool? streamingDesired,
    bool? streamedSoundContainsVoice,
  }) {
    return AssistantState(
      clientStatus: clientStatus ?? this.clientStatus,
      userInput: userInput ?? this.userInput,
      responseState: responseState ?? this.responseState,
      recordedAudio:
          recordedAudio != null ? recordedAudio() : this.recordedAudio,
      recordingDuration: recordingDuration ?? this.recordingDuration,
      lastError: lastError != null ? lastError() : this.lastError,
      streamingDesired: streamingDesired ?? this.streamingDesired,
      streamedSoundContainsVoice: streamedSoundContainsVoice ?? this.streamedSoundContainsVoice,
    );
  }

  @override
  List<Object?> get props => [
        clientStatus,
        userInput,
        responseState,
        recordedAudio,
        recordingDuration,
        lastError,
        streamingDesired,
        streamedSoundContainsVoice,
      ];
}
