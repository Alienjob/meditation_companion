import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';
import '../../chat/bloc/chat_bloc.dart';
import '../../chat/bloc/chat_event.dart';
import '../../chat/models/chat_message.dart';
import '../../chat/views/chat_widget.dart';
import '../../voice_assistant/bloc/assistant_bloc.dart';
import '../../voice_assistant/repository/voice_assistant_repository.dart';
import '../../voice_assistant/services/audio_recorder.dart';
import '../../voice_assistant/voice_assistant_widget.dart';
import '../services/audio_service.dart';

String _clipLogText(String value) {
  if (value.isEmpty) return '<empty>';
  const maxLength = 80;
  return value.length <= maxLength
      ? value
      : '${value.substring(0, maxLength)}…';
}

String _describeContentPart(ContentPart part) {
  return part.map(
    inputAudio: (p) => 'inputAudio bytes=${p.audio?.length ?? 0} '
        'transcriptLen=${p.transcript?.length ?? 0} transcript=${_clipLogText(p.transcript ?? '')}',
    audio: (p) => 'audio bytes=${p.audio?.length ?? 0} '
        'transcriptLen=${p.transcript?.length ?? 0} transcript=${_clipLogText(p.transcript ?? '')}',
    inputText: (p) => 'inputText "${_clipLogText(p.text)}"',
    text: (p) => 'text "${_clipLogText(p.text)}"',
  );
}

String _describeItem(Item item) {
  return item.map(
    message: (m) =>
        'message id=${m.id} role=${m.role.name} parts=${m.content.length}',
    functionCall: (f) => 'functionCall id=${f.id} name=${f.name}',
    functionCallOutput: (f) =>
        'functionCallOutput id=${f.id} bytes=${f.output.length}',
  );
}

class ChatAssistantWidget extends StatelessWidget {
  const ChatAssistantWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: _buildChatWithVoiceAssistant(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: const Row(
        children: [
          Icon(Icons.assistant, color: Colors.deepPurple),
          SizedBox(width: 8),
          Text(
            'Meditation Assistant',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatWithVoiceAssistant(BuildContext context) {
    final client = RealtimeClient(
      apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
      dangerouslyAllowAPIKeyInBrowser: true,
    );

    client.updateSession(
      instructions:
          'You are a friendly meditation assistant. Help users with meditation and mindfulness.',
      voice: Voice.alloy,
      turnDetection: TurnDetection(
        type: TurnDetectionType.serverVad,
      ),
      inputAudioTranscription: InputAudioTranscriptionConfig(
        model: 'whisper-1',
      ),
    );

    final repository = VoiceAssistantRepository(client);

    return BlocProvider(
      create: (context) {
        log('ChatAssistantWidget - Creating ChatBloc with VoiceAssistantRepository at ${DateTime.now().toIso8601String()}');
        final chatBloc = ChatBloc(repository);
        log('ChatAssistantWidget - ChatBloc created, sending ChatStreamConnected event');
        chatBloc.add(ChatStreamConnected());

        bool welcomeMessageAdded = false;
        log('ChatAssistantWidget - Setting up ChatBloc stream listener');
        chatBloc.stream.listen((state) {
          log('ChatAssistantWidget - ChatBloc state changed: ${state.runtimeType} at ${DateTime.now().toIso8601String()}');
          // LOG STATE CONTENT
          final messageCount = switch (state) {
            ChatConnected(messages: final msgs) => msgs.length,
            ChatDisconnected(messages: final msgs) => msgs.length,
            MessageSending(messages: final msgs) => msgs.length,
            MessageSent(messages: final msgs) => msgs.length,
            ChatFailure(messages: final msgs) => msgs.length,
            _ => 0,
          };
          log('ChatAssistantWidget - State contains $messageCount messages');
          if (state is ChatConnected && !welcomeMessageAdded) {
            log('ChatAssistantWidget - Adding welcome message');
            final welcomeMessage = ChatMessage(
              id: 'welcome-${DateTime.now().millisecondsSinceEpoch}',
              content:
                  'Hello! I\'m your meditation assistant. Press the mic button to start talking.',
              senderId: 'assistant',
              timestamp: DateTime.now(),
              isUser: false,
            );
            chatBloc.add(ChatMessageReceived(welcomeMessage));
            welcomeMessageAdded = true;
            log('ChatAssistantWidget - Welcome message added');
          }
        });

        log('ChatAssistantWidget - ChatBloc setup completed');
        return chatBloc;
      },
      child: Builder(
        builder: (context) => BlocProvider(
          create: (context) {
            final chatBloc = context.read<ChatBloc>();
            final assistantBloc = AssistantBloc(
              chatBloc: chatBloc,
              audioService: context.read<AudioService>(),
              recorder: context.read<AudioRecorder>(),
              client: client,
            );

            client.on(RealtimeEventType.all, (event) {
              // log('Received OpenAI event: ${event.type}');
            });

            client.on(RealtimeEventType.conversationUpdated, (event) {
              final typedEvent = event as RealtimeEventConversationUpdated;
              repository.handleConversationUpdated(typedEvent);

              final conversationItem = typedEvent.result.item;
              if (conversationItem == null) {
                return;
              }
              if (conversationItem.item case final ItemMessage message) {
                if (message.role == ItemRole.assistant) {
                  final audioChunk = repository.takeNewAudioChunk(
                    message.id,
                    conversationItem.formatted?.audio,
                  );
                  if (audioChunk != null && audioChunk.isNotEmpty) {
                    log(
                      'OpenAI audio chunk received: item='
                      '${message.id} chunkBytes=${audioChunk.length}',
                    );
                    assistantBloc.add(
                      ResponseAudioReceived(
                        itemId: message.id,
                        audioData: audioChunk,
                      ),
                    );
                  }
                }
              }
            });

            client.on(RealtimeEventType.conversationItemAppended, (event) {
              repository.handleConversationItemAppended(
                event as RealtimeEventConversationItemAppended,
              );
            });

            client.on(RealtimeEventType.conversationItemCompleted, (event) {
              final typedEvent =
                  event as RealtimeEventConversationItemCompleted;
              repository.handleConversationItemCompleted(typedEvent);
              if (typedEvent.item.item case final ItemMessage message) {
                assistantBloc.add(ResponseAudioStreamEnded(message.id));
              }
            });

            client.on(RealtimeEventType.responseOutputItemAdded, (event) {
              final typedEvent = event as RealtimeEventResponseOutputItemAdded;
              log(
                'OpenAI response output item added: '
                '${_describeItem(typedEvent.item)} '
                'response=${typedEvent.responseId} '
                'outputIndex=${typedEvent.outputIndex}',
              );
            });

            client.on(RealtimeEventType.responseContentPartAdded, (event) {
              final typedEvent = event as RealtimeEventResponseContentPartAdded;
              log(
                'OpenAI response content part added: '
                '${_describeContentPart(typedEvent.part)} '
                'response=${typedEvent.responseId} '
                'item=${typedEvent.itemId}',
              );
            });

            client.on(RealtimeEventType.responseTextDelta, (event) {
              final typedEvent = event as RealtimeEventResponseTextDelta;
              repository.handleResponseTextDelta(typedEvent);
              log(
                'OpenAI response text delta: '
                'item=${typedEvent.itemId} deltaLen=${typedEvent.delta.length}',
              );
            });

            client.on(RealtimeEventType.responseTextDone, (event) {
              final typedEvent = event as RealtimeEventResponseTextDone;
              repository.handleResponseTextDone(typedEvent);
              log(
                'OpenAI response text done: '
                'item=${typedEvent.itemId} textLen=${typedEvent.text.length}',
              );
            });

            client.on(RealtimeEventType.inputAudioBufferSpeechStarted, (event) {
              log('OpenAI VAD speech started');
              assistantBloc.add(ServerVadSpeechStarted());
            });

            client.on(RealtimeEventType.inputAudioBufferSpeechStopped, (event) {
              log('OpenAI VAD speech stopped');
              assistantBloc.add(ServerVadSpeechStopped());
            });

            client.on(RealtimeEventType.error, (event) {
              final typedEvent = event as RealtimeEventError;
              log('OpenAI Realtime error: ${typedEvent.error}');
            });

            client.on(RealtimeEventType.close, (event) {
              log('OpenAI Realtime closed, attempting to reconnect...');
              Future.delayed(const Duration(seconds: 1), () {
                if (!client.isConnected()) {
                  client.connect();
                }
              });
            });

            client.connect().then((_) {
              log('Connected to OpenAI Realtime: ${client.isConnected()}');
              assistantBloc.add(ClientConnected());
            });

            return assistantBloc;
          },
          child: const Column(
            children: [
              Expanded(child: ChatWidget()),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: VoiceAssistantWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
