import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/chat/bloc/chat_state.dart';
import 'package:meditation_companion/features/voice_assistant/bloc/assistant_event.dart';
import 'package:meditation_companion/features/voice_assistant/tools/voice_assistant_tools.dart';
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

const _chatAssistantDomain = 'Chat';
const _chatAssistantLifecycle = 'Chat Assistant Widget Lifecycle';
const _chatAssistantState = 'Chat Assistant State';
const _chatAssistantOpenAi = 'Chat Assistant OpenAI';

void _chatAssistantDebug(String feature, String message) {
  logDebug(
    message,
    domain: _chatAssistantDomain,
    feature: feature,
  );
}

void _chatAssistantError(String feature, String message, {Object? error}) {
  logError(
    message,
    domain: _chatAssistantDomain,
    feature: feature,
    error: error,
  );
}

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
  const ChatAssistantWidget({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

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

    final toolset = VoiceAssistantToolset(context: context);

    final instructions = [
      'You are a friendly meditation assistant. Help users with meditation and mindfulness. Respond in English only and keep each reply within 10 words.',
      toolset.buildInstructionSuffix(),
    ].join('\n\n');

    client.updateSession(
      instructions: instructions,
      voice: Voice.alloy,
      turnDetection: TurnDetection(
        type: TurnDetectionType.serverVad,
      ),
      inputAudioTranscription: InputAudioTranscriptionConfig(
        model: 'whisper-1',
        language: EnvConfig.openAiRealtimeLanguage,
      ),
    );

    final repository = VoiceAssistantRepository(client);

    return BlocProvider(
      create: (context) {
        _chatAssistantDebug(
          _chatAssistantLifecycle,
          'ChatAssistantWidget - Creating ChatBloc with VoiceAssistantRepository at ${DateTime.now().toIso8601String()}',
        );
        final chatBloc = ChatBloc(repository);
        _chatAssistantDebug(
          _chatAssistantLifecycle,
          'ChatAssistantWidget - ChatBloc created, sending ChatStreamConnected event',
        );
        chatBloc.add(ChatStreamConnected());

        bool welcomeMessageAdded = false;
        _chatAssistantDebug(
          _chatAssistantLifecycle,
          'ChatAssistantWidget - Setting up ChatBloc stream listener',
        );
        chatBloc.stream.listen((state) {
          _chatAssistantDebug(
            _chatAssistantState,
            'ChatAssistantWidget - ChatBloc state changed: ${state.runtimeType} at ${DateTime.now().toIso8601String()}',
          );
          // LOG STATE CONTENT
          final messageCount = switch (state) {
            ChatConnected(messages: final msgs) => msgs.length,
            ChatDisconnected(messages: final msgs) => msgs.length,
            MessageSending(messages: final msgs) => msgs.length,
            MessageSent(messages: final msgs) => msgs.length,
            ChatFailure(messages: final msgs) => msgs.length,
            _ => 0,
          };
          _chatAssistantDebug(
            _chatAssistantState,
            'ChatAssistantWidget - State contains $messageCount messages',
          );
          if (state is ChatConnected && !welcomeMessageAdded) {
            _chatAssistantDebug(
              _chatAssistantState,
              'ChatAssistantWidget - Adding welcome message',
            );
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
            _chatAssistantDebug(
              _chatAssistantState,
              'ChatAssistantWidget - Welcome message added',
            );
          }
        });

        _chatAssistantDebug(
          _chatAssistantLifecycle,
          'ChatAssistantWidget - ChatBloc setup completed',
        );
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
              // logDebug('Received OpenAI event: ${event.type}');
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
                    _chatAssistantDebug(
                      _chatAssistantOpenAi,
                      'OpenAI audio chunk received: item=${message.id} chunkBytes=${audioChunk.length}',
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
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI response output item added: ${_describeItem(typedEvent.item)} response=${typedEvent.responseId} outputIndex=${typedEvent.outputIndex}',
              );
            });

            client.on(RealtimeEventType.responseContentPartAdded, (event) {
              final typedEvent = event as RealtimeEventResponseContentPartAdded;
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI response content part added: ${_describeContentPart(typedEvent.part)} response=${typedEvent.responseId} item=${typedEvent.itemId}',
              );
            });

            client.on(RealtimeEventType.responseTextDelta, (event) {
              final typedEvent = event as RealtimeEventResponseTextDelta;
              repository.handleResponseTextDelta(typedEvent);
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI response text delta: item=${typedEvent.itemId} deltaLen=${typedEvent.delta.length}',
              );
            });

            client.on(RealtimeEventType.responseTextDone, (event) {
              final typedEvent = event as RealtimeEventResponseTextDone;
              repository.handleResponseTextDone(typedEvent);
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI response text done: item=${typedEvent.itemId} textLen=${typedEvent.text.length}',
              );
            });

            client.on(RealtimeEventType.inputAudioBufferSpeechStarted, (event) {
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI VAD speech started',
              );
              assistantBloc.add(ServerVadSpeechStarted());
            });

            client.on(RealtimeEventType.inputAudioBufferSpeechStopped, (event) {
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI VAD speech stopped',
              );
              assistantBloc.add(ServerVadSpeechStopped());
            });

            client.on(RealtimeEventType.error, (event) {
              final typedEvent = event as RealtimeEventError;
              _chatAssistantError(
                _chatAssistantOpenAi,
                'OpenAI Realtime error: ${typedEvent.error}',
                error: typedEvent.error,
              );
            });

            client.on(RealtimeEventType.sessionCreated, (event) {
              final sessionEvent = event as RealtimeEventSessionCreated;
              final model = sessionEvent.session.model ?? 'unknown';
              logInfo(
                'Realtime session confirmed model: $model',
                domain: 'App',
                feature: 'Realtime',
              );
            });

            client.on(RealtimeEventType.close, (event) {
              _chatAssistantDebug(
                _chatAssistantOpenAi,
                'OpenAI Realtime closed, attempting to reconnect...',
              );
              Future.delayed(const Duration(seconds: 1), () {
                if (!client.isConnected()) {
                  client.connect(model: EnvConfig.openAiRealtimeModel);
                }
              });
            });

            toolset.register(client).then((_) {
              client.connect(model: EnvConfig.openAiRealtimeModel).then((_) {
                _chatAssistantDebug(
                  _chatAssistantOpenAi,
                  'Connected to OpenAI Realtime using model: ${EnvConfig.openAiRealtimeModel} (connected=${client.isConnected()})',
                );
                logInfo(
                  'Realtime client connected with model: ${EnvConfig.openAiRealtimeModel}',
                  domain: 'App',
                  feature: 'Realtime',
                );
                assistantBloc.add(ClientConnected());
              });
            });

            return assistantBloc;
          },
          child: Column(
            children: [
              Expanded(
                child: ChatWidget(scrollController: scrollController),
              ),
              const Padding(
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
