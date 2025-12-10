import 'package:equatable/equatable.dart';
import '../services/audio_recorder.dart';

enum ClientStatus { connecting, ready, rateLimited, error }

enum ResponseState { idle, responding }

class AssistantState extends Equatable {
  final ClientStatus clientStatus;
  final AudioRecorderState recorderState;
  final ResponseState responseState;
  final String? lastError;
  final bool streamedSoundContainsVoice;

  static const maxRecordingDuration = Duration(seconds: 30);

  AssistantState({
    this.clientStatus = ClientStatus.connecting,
    AudioRecorderState? recorderState,
    this.responseState = ResponseState.idle,
    this.lastError,
    this.streamedSoundContainsVoice = false,
  }) : recorderState = recorderState ?? AudioRecorderState.idle();

  bool get canRecord =>
      clientStatus == ClientStatus.ready &&
      recorderState.status == AudioRecorderStatus.idle &&
      responseState == ResponseState.idle;

  bool get canSendRecording => recorderState.recordedData != null;

  bool get canInterrupt => responseState == ResponseState.responding;

  AssistantState copyWith({
    ClientStatus? clientStatus,
    AudioRecorderState? recorderState,
    ResponseState? responseState,
    String? Function()? lastError,
    bool? streamedSoundContainsVoice,
  }) {
    return AssistantState(
      clientStatus: clientStatus ?? this.clientStatus,
      recorderState: recorderState ?? this.recorderState,
      responseState: responseState ?? this.responseState,
      lastError: lastError != null ? lastError() : this.lastError,
      streamedSoundContainsVoice:
          streamedSoundContainsVoice ?? this.streamedSoundContainsVoice,
    );
  }

  @override
  List<Object?> get props => [
        clientStatus,
        recorderState,
        responseState,
        lastError,
        streamedSoundContainsVoice,
      ];
}
