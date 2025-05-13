# Chat and Voice Streaming Integration 

## Overview

Integration of voice streaming with three main components:

1. AssistantBloc manages:
   - OpenAI client connection and events
   - Voice recording and playback
   - Chat message flow via ChatBloc

2. User Voice Input Flow:
   - Record audio (max 30s)
   - Send directly to OpenAI
   - Chat updates when transcription arrives

3. Assistant Response Flow:
   - Receive text + audio chunks
   - Show text + Play audio
   - Allow interruption

## Component States and Events

### AssistantState
```dart
class AssistantState {
  final ClientStatus clientStatus;
  final UserInputState userInput;
  final ResponseState responseState;
  final Uint8List? recordedAudio;    // Current recording
  final Duration recordingDuration;
  
  static const maxRecordingDuration = Duration(seconds: 30);
  
  bool get canRecord =>
      clientStatus == ClientStatus.ready &&
      userInput == UserInputState.idle &&
      responseState == ResponseState.idle;
      
  bool get canSendRecording =>
      userInput == UserInputState.recorded &&
      recordedAudio != null;
      
  bool get canInterrupt =>
      responseState == ResponseState.responding;
}

enum ClientStatus {
  connecting,    // Initial connection
  ready,        // Ready for interaction
  rateLimited,  // API limit hit
  error,        // Other errors
}

enum UserInputState {
  idle,         // No user input active
  recording,    // Currently recording
  recorded,     // Has recording ready to send
}

enum ResponseState {
  idle,         // No active response
  responding,   // Model generating response
}
```

### AssistantBloc Events
```dart
sealed class AssistantEvent {
  const AssistantEvent();
}

// Recording control
class StartRecordingUserAudioInput extends AssistantEvent {}
class StopRecordingUserAudioInput extends AssistantEvent {}
class ClearRecordedAudio extends AssistantEvent {}
class SendRecordedAudio extends AssistantEvent {}

// OpenAI client events
class ClientConnected extends AssistantEvent {}
class ClientError extends AssistantEvent {
  final String error;
}
class UserMessageTranscribed extends AssistantEvent {
  final String itemId;
  final String transcript;
}
class ResponseChunkReceived extends AssistantEvent {
  final String itemId;
  final String? transcript;
  final Uint8List? audio;
}
class ResponseCompleted extends AssistantEvent {
  final String itemId;
}
```

## Implementation

### 1. OpenAI Client Setup
```dart
class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  final ChatBloc _chatBloc;
  final AudioService _audioService;
  final AudioRecorder _recorder;
  final RealtimeClient _client;

  AssistantBloc({
    required ChatBloc chatBloc,
    required AudioService audioService,
    required AudioRecorder recorder,
  }) : _chatBloc = chatBloc,
       _audioService = audioService,
       _recorder = recorder {
    _setupClientEventHandlers();
  }

  void _setupClientEventHandlers() {
    _client.on(RealtimeEventType.error, (event) {
      final error = (event as RealtimeEventError).error;
      add(ClientError(error));
    });

    _client.on(RealtimeEventType.conversationUpdated, (event) {
      final result = (event as RealtimeEventConversationUpdated).result;
      
      if (result.delta?.transcript != null) {
        add(UserMessageTranscribed(
          result.item!.id,
          result.delta!.transcript!,
        ));
      }
      
      if (result.delta?.audio != null) {
        add(ResponseChunkReceived(
          result.item!.id,
          transcript: result.delta?.transcript,
          audio: result.delta?.audio,
        ));
      }
    });
  }
}
```

### 2. Voice Recording Flow
```dart
class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  Future<void> _onStartRecording(
    StartRecordingUserAudioInput event,
    Emitter<AssistantState> emit,
  ) async {
    if (!state.canRecord) return;
    
    try {
      await _recorder.startRecording();
      emit(state.copyWith(
        userInput: UserInputState.recording,
        recordingDuration: Duration.zero,
      ));
    } catch (e) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
      ));
    }
  }

  Future<void> _onSendRecordedAudio(
    SendRecordedAudio event,
    Emitter<AssistantState> emit,
  ) async {
    if (!state.canSendRecording) return;

    try {
      final base64Audio = base64Encode(state.recordedAudio!);
      
      // Send directly to OpenAI
      await _client.sendUserMessageContent([
        ContentPart.inputAudio(audio: base64Audio),
      ]);

      // Clear recording, wait for transcription
      emit(state.copyWith(
        userInput: UserInputState.idle,
        recordedAudio: null,
        recordingDuration: Duration.zero,
      ));
    } catch (e) {
      emit(state.copyWith(
        clientStatus: ClientStatus.error,
      ));
    }
  }
}
```

### 3. Message Flow
```dart
class AssistantBloc extends Bloc<AssistantEvent, AssistantState> {
  Future<void> _onUserMessageTranscribed(
    UserMessageTranscribed event,
    Emitter<AssistantState> emit,
  ) async {
    _chatBloc.add(AddMessage(
      id: event.itemId,
      content: event.transcript,
      isUser: true,
    ));
  }

  Future<void> _onResponseChunk(
    ResponseChunkReceived event,
    Emitter<AssistantState> emit,
  ) async {
    if (event.transcript != null) {
      _chatBloc.add(UpdateMessage(
        id: event.itemId,
        content: event.transcript!,
      ));
    }
    
    if (event.audio != null) {
      await _audioService.appendVoiceChunk(
        event.itemId,
        event.audio!,
      );
    }
  }
}
```

### 4. UI Controls
```dart
class _VoiceControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssistantBloc, AssistantState>(
      builder: (context, state) {
        if (state.userInput == UserInputState.recording) {
          return _buildRecordingControls(context, state);
        }
        
        if (state.userInput == UserInputState.recorded) {
          return _buildRecordedControls(context);
        }
        
        if (state.responseState == ResponseState.responding) {
          return _buildResponseControls(context);
        }
        
        return _buildInitialControls(context, state);
      },
    );
  }
  
  Widget _buildRecordedControls(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () => context.read<AssistantBloc>()
              .add(SendRecordedAudio()),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => context.read<AssistantBloc>()
              .add(ClearRecordedAudio()),
        ),
      ],
    );
  }
  
  Widget _buildRecordingControls(BuildContext context, AssistantState state) {
    final progress = state.recordingDuration.inMilliseconds / 
        AssistantState.maxRecordingDuration.inMilliseconds;
        
    return Row(
      children: [
        CircularProgressIndicator(value: progress),
        Text('${state.recordingDuration.inSeconds}s'),
        IconButton(
          icon: Icon(Icons.stop),
          onPressed: () => context.read<AssistantBloc>()
              .add(StopRecordingUserAudioInput()),
        ),
      ],
    );
  }
}
```

## Test Cases

### Voice Input Flow
```dart
blocTest<AssistantBloc, AssistantState>(
  'should handle recording and sending audio',
  build: () => AssistantBloc(
    chatBloc: mockChatBloc,
    audioService: mockAudioService,
    recorder: mockRecorder,
  ),
  act: (bloc) async {
    // Start recording
    bloc.add(StartRecordingUserAudioInput());
    
    // Simulate 5 seconds recording
    await Future.delayed(Duration(seconds: 5));
    bloc.add(StopRecordingUserAudioInput());
    
    // Send recording
    bloc.add(SendRecordedAudio());
    
    // Simulate OpenAI transcription
    mockClient.emitTranscription('Hello there');
  },
  expect: () => [
    AssistantState(userInput: UserInputState.recording),
    AssistantState(
      userInput: UserInputState.recorded,
      recordedAudio: any,
    ),
    AssistantState(userInput: UserInputState.idle),
  ],
  verify: (bloc) {
    verify(() => mockClient.sendUserMessageContent(any)).called(1);
    verify(() => mockChatBloc.add(any)).called(1);
  },
);
```

### Response Flow
```dart
blocTest<AssistantBloc, AssistantState>(
  'should handle assistant response',
  build: () => AssistantBloc(
    chatBloc: mockChatBloc,
    audioService: mockAudioService,
    recorder: mockRecorder,
  ),
  act: (bloc) {
    mockClient.emitResponse(
      itemId: '123',
      transcript: 'Hello',
      audio: audioData,
    );
  },
  verify: (bloc) {
    verify(() => mockChatBloc.add(UpdateMessage(
      id: '123',
      content: 'Hello',
    ))).called(1);
    verify(() => mockAudioService.appendVoiceChunk(
      '123',
      audioData,
    )).called(1);
  },
);
