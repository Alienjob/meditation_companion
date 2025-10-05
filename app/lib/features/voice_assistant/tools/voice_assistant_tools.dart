import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_event.dart';
import 'package:openai_realtime_dart/openai_realtime_dart.dart';

abstract class AssistantTool {
  const AssistantTool();

  ToolDefinition get definition;
  String get promptInstruction;
  ToolHandler createHandler(BuildContext context);
}

class WaitForTimerTool extends AssistantTool {
  const WaitForTimerTool();

  @override
  ToolDefinition get definition => const ToolDefinition(
        name: 'wait_for_timer',
        description:
            'Pause the conversation for a requested amount of time before continuing.',
        parameters: {
          'type': 'object',
          'properties': {
            'seconds': {
              'type': 'number',
              'description': 'Number of seconds to wait (minimum 1).',
              'minimum': 1
            }
          },
          'required': ['seconds'],
          'additionalProperties': false,
        },
      );

  @override
  String get promptInstruction =>
      'Use wait_for_timer when you must pause before replying or performing another action.';

  @override
  ToolHandler createHandler(BuildContext context) {
    return (args) async {
      final rawSeconds = args['seconds'];
      if (rawSeconds is! num || rawSeconds <= 0) {
        throw ArgumentError('seconds must be a positive number');
      }
      final milliseconds = (rawSeconds * 1000).toInt();
      await Future<void>.delayed(Duration(milliseconds: milliseconds));
      return {
        'status': 'ok',
        'waited_seconds': rawSeconds,
      };
    };
  }
}

class StartMeditationTool extends AssistantTool {
  const StartMeditationTool();

  @override
  ToolDefinition get definition => const ToolDefinition(
        name: 'start_meditation_session',
        description:
            'Begin a guided meditation session for the user with the specified duration.',
        parameters: {
          'type': 'object',
          'properties': {
            'duration_seconds': {
              'type': 'integer',
              'description':
                  'Desired length of the meditation session in seconds (minimum 60).',
              'minimum': 60
            }
          },
          'required': ['duration_seconds'],
          'additionalProperties': false,
        },
      );

  @override
  String get promptInstruction =>
      'Call start_meditation_session to begin a session when a user asks to meditate and provides a duration.';

  @override
  ToolHandler createHandler(BuildContext context) {
    return (args) async {
      final raw = args['duration_seconds'];
      if (raw is! num || raw < 60) {
        throw ArgumentError(
            'duration_seconds must be an integer greater than or equal to 60');
      }
      final duration = Duration(seconds: raw.toInt());
      final bloc = context.read<MeditationBloc>();
      bloc.add(StartMeditation(duration: duration));
      return {
        'status': 'started',
        'duration_seconds': duration.inSeconds,
      };
    };
  }
}

class StopMeditationTool extends AssistantTool {
  const StopMeditationTool();

  @override
  ToolDefinition get definition => const ToolDefinition(
        name: 'stop_meditation_session',
        description:
            'End the current meditation session when the user requests to stop.',
        parameters: {
          'type': 'object',
          'properties': {},
          'additionalProperties': false,
        },
      );

  @override
  String get promptInstruction =>
      'Call stop_meditation_session when the user wants to end an ongoing meditation session.';

  @override
  ToolHandler createHandler(BuildContext context) {
    return (args) async {
      final bloc = context.read<MeditationBloc>();
      bloc.add(const StopMeditation());
      return {
        'status': 'stopped',
      };
    };
  }
}

class VoiceAssistantToolset {
  VoiceAssistantToolset({required this.context})
      : _tools = const [
          WaitForTimerTool(),
          StartMeditationTool(),
          StopMeditationTool(),
        ];

  final BuildContext context;
  final List<AssistantTool> _tools;

  String buildInstructionSuffix() {
    final buffer = StringBuffer('Available tools you can call:\n');
    for (final tool in _tools) {
      buffer.writeln('- ${tool.promptInstruction}');
    }
    buffer.writeln(
        'When you call a tool, immediately confirm the action in under 10 words and stay available for further dialogue—do not wait for meditation sessions to finish.');
    return buffer.toString();
  }

  Future<void> register(RealtimeClient client) async {
    for (final tool in _tools) {
      await client.addTool(tool.definition, tool.createHandler(context));
    }
  }
}
