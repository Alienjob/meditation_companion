import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/core/bootstrap/app_bootstrap.dart';
import 'package:meditation_companion/core/di/service_locator.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';
import 'package:meditation_companion/features/auth/views/auth_wrapper.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/voice_assistant_scope.dart';

Future<void> main() async {
  // Run complete bootstrap sequence
  await AppBootstrap.run();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TimerService>(create: (_) => sl<TimerService>()),
        RepositoryProvider<AudioService>(create: (_) => sl<AudioService>()),
        RepositoryProvider<AudioRecorder>(create: (_) => sl<AudioRecorder>()),
        RepositoryProvider<AnalyticsService>(
          create: (_) => sl<AnalyticsService>(),
        ),
        RepositoryProvider<AuthRepository>(
          create: (_) => sl<AuthRepository>(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: context.read<AuthRepository>(),
            )..add(AuthCheckRequested()),
          ),
          BlocProvider<MeditationBloc>(
            create: (context) => MeditationBloc(
              timerService: context.read<TimerService>(),
              audioService: context.read<AudioService>(),
              analyticsService: context.read<AnalyticsService>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Meditation Companion',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          home: const VoiceAssistantScope(
            child: AuthWrapper(),
          ),
        ),
      ),
    );
  }
}
