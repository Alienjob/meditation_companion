import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:meditation_companion/core/connectivity/connectivity_mixin.dart';
import 'package:meditation_companion/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:meditation_companion/core/connectivity/widgets/connectivity_banner.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';

import '../meditation/services/audio_service.dart';
import 'bloc/assistant_bloc.dart';
import 'bloc/assistant_event.dart';
import 'bloc/assistant_state.dart';
import 'bloc/mock_assistant_bloc.dart';
import 'repository/voice_assistant_repository.dart';
import 'services/audio_recorder.dart';
import 'tools/voice_assistant_tools.dart';

const _scopeDomain = 'Voice Assistant';
const _scopeRealtime = 'Realtime';

class VoiceAssistantScope extends StatefulWidget {
  const VoiceAssistantScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<VoiceAssistantScope> createState() => _VoiceAssistantScopeState();
}

class _VoiceAssistantScopeState extends State<VoiceAssistantScope> {
  late final RealtimeClient _client;
  VoiceAssistantRepository? _repository;
  Bloc<AssistantEvent, AssistantState>? _assistantBloc;
  ConnectivityCubit? _connectivityCubit;
  bool _initialized = false;

  void _debug(String feature, String message) {
    logDebug(
      message,
      domain: _scopeDomain,
      feature: feature,
      context: VoiceAssistantScope,
    );
  }

  void _error(String feature, String message, {Object? error}) {
    logError(
      message,
      domain: _scopeDomain,
      feature: feature,
      error: error,
      context: VoiceAssistantScope,
    );
  }

  @override
  void initState() {
    super.initState();
    _client = RealtimeClient(
      apiKey: const String.fromEnvironment('OPENAI_API_KEY'),
      dangerouslyAllowAPIKeyInBrowser: true,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    final audioService = context.read<AudioService>();
    final recorder = context.read<AudioRecorder>();
    final analyticsService = context.read<AnalyticsService>();

    _repository = VoiceAssistantRepository(_client);

    // Use MockAssistantBloc in debug mode for testing with debug events
    if (kDebugMode) {
      _assistantBloc = MockAssistantBloc();
    } else {
      _assistantBloc = AssistantBloc(
        audioService: audioService,
        recorder: recorder,
        client: _client,
      );
    }

    // Initialize connectivity monitoring for services with ConnectivityMixin
    final servicesWithConnectivity = <String, dynamic>{};
    if (analyticsService is ConnectivityMixin) {
      servicesWithConnectivity['analytics'] = analyticsService;
    }

    if (servicesWithConnectivity.isNotEmpty) {
      _connectivityCubit = ConnectivityCubit(
        services: servicesWithConnectivity.cast<String, ConnectivityMixin>(),
      );
    }

    _configureRealtimeClient();
  }

  void _configureRealtimeClient() {
    final toolset = VoiceAssistantToolset(context: context);

    final instructions = [
      'You are a friendly meditation assistant. Help users with meditation and mindfulness. Respond in English only and keep each reply within 10 words.',
      toolset.buildInstructionSuffix(),
    ].join('\n\n');

    _client.updateSession(
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

    _registerClientEventHandlers();

    unawaited(() async {
      await toolset.register(_client);
      await _client.connect(model: EnvConfig.openAiRealtimeModel);
      _debug(
        _scopeRealtime,
        'Connected to OpenAI Realtime using model: ${EnvConfig.openAiRealtimeModel} (connected=${_client.isConnected()})',
      );
      logInfo(
        'Realtime client connected with model: ${EnvConfig.openAiRealtimeModel}',
        domain: _scopeDomain,
        feature: _scopeRealtime,
      );
      _assistantBloc?.add(ClientConnected());
    }());
  }

  void _registerClientEventHandlers() {
    final repository = _repository!;
    final assistantBloc = _assistantBloc!;

    _client.on(RealtimeEventType.all, (event) {
      print('Realtime event: ${event.type}');
    });

    _client.on(RealtimeEventType.conversationUpdated, (event) {
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

    _client.on(RealtimeEventType.conversationItemAppended, (event) {
      repository.handleConversationItemAppended(
        event as RealtimeEventConversationItemAppended,
      );
    });

    _client.on(RealtimeEventType.conversationItemCompleted, (event) {
      final typedEvent = event as RealtimeEventConversationItemCompleted;
      repository.handleConversationItemCompleted(typedEvent);
      if (typedEvent.item.item case final ItemMessage message) {
        if (message.role == ItemRole.assistant) {
          assistantBloc.add(ResponseAudioStreamEnded(message.id));
          assistantBloc.add(ResponseCompleted(message.id));
        }
      }
    });

    _client.on(RealtimeEventType.responseOutputItemAdded, (event) {
      final typedEvent = event as RealtimeEventResponseOutputItemAdded;
      _debug(
        _scopeRealtime,
        'Response output item added: ${typedEvent.item.id} response=${typedEvent.responseId}',
      );
    });

    _client.on(RealtimeEventType.responseContentPartAdded, (event) {
      final typedEvent = event as RealtimeEventResponseContentPartAdded;
      _debug(
        _scopeRealtime,
        'Response content part added: item=${typedEvent.itemId} part=${typedEvent.part.type}',
      );
    });

    _client.on(RealtimeEventType.responseTextDelta, (event) {
      final typedEvent = event as RealtimeEventResponseTextDelta;
      repository.handleResponseTextDelta(typedEvent);
    });

    _client.on(RealtimeEventType.responseTextDone, (event) {
      final typedEvent = event as RealtimeEventResponseTextDone;
      repository.handleResponseTextDone(typedEvent);
      assistantBloc.add(ResponseCompleted(typedEvent.itemId));
    });

    _client.on(RealtimeEventType.inputAudioBufferSpeechStarted, (event) {
      _debug(_scopeRealtime, 'OpenAI VAD speech started');
      assistantBloc.add(ServerVadSpeechStarted());
    });

    _client.on(RealtimeEventType.inputAudioBufferSpeechStopped, (event) {
      _debug(_scopeRealtime, 'OpenAI VAD speech stopped');
      assistantBloc.add(ServerVadSpeechStopped());
    });

    _client.on(RealtimeEventType.error, (event) {
      final typedEvent = event as RealtimeEventError;
      _error(
        _scopeRealtime,
        'OpenAI Realtime error: ${typedEvent.error}',
        error: typedEvent.error,
      );
    });

    _client.on(RealtimeEventType.sessionCreated, (event) {
      final sessionEvent = event as RealtimeEventSessionCreated;
      final model = sessionEvent.session.model ?? 'unknown';
      logInfo(
        'Realtime session confirmed model: $model',
        domain: _scopeDomain,
        feature: _scopeRealtime,
      );
    });

    _client.on(RealtimeEventType.close, (event) {
      _debug(
          _scopeRealtime, 'Realtime connection closed, scheduling reconnect');
      Future.delayed(const Duration(seconds: 1), () {
        if (!_client.isConnected()) {
          _client.connect(model: EnvConfig.openAiRealtimeModel);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final repository = _repository;
    final assistantBloc = _assistantBloc;

    if (repository == null || assistantBloc == null) {
      return widget.child;
    }

    // Provide the bloc with base Bloc type to support both AssistantBloc and MockAssistantBloc
    Widget child = RepositoryProvider<VoiceAssistantRepository>.value(
      value: repository,
      child: BlocProvider<Bloc<AssistantEvent, AssistantState>>.value(
        value: assistantBloc,
        child: widget.child,
      ),
    );

    // Wrap with connectivity monitoring if cubit is available
    final connectivityCubit = _connectivityCubit;
    if (connectivityCubit != null) {
      child = BlocProvider<ConnectivityCubit>.value(
        value: connectivityCubit,
        child: Stack(
          children: [
            child,
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ConnectivityBanner(),
            ),
          ],
        ),
      );
    }

    return child;
  }

  @override
  void dispose() {
    unawaited(_client.disconnect());
    _assistantBloc?.close();
    _connectivityCubit?.close();
    super.dispose();
  }
}
