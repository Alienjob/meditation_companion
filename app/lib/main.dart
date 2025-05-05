import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/mock_audio_service.dart';
import 'package:meditation_companion/features/meditation/services/mock_timer_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<TimerService>(
            create: (_) => MockTimerService(),
          ),
          RepositoryProvider<AudioService>(
            create: (_) => MockAudioService(),
          ),
        ],
        child: BlocProvider(
          create: (context) => MeditationBloc(
            timerService: context.read<TimerService>(),
            audioService: context.read<AudioService>(),
          ),
          child: const MeditationSessionScreen(),
        ),
      ),
    );
  }
}
