import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_timer_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final TimerService _timerService;
  late final AudioService _audioService;

  @override
  void initState() {
    super.initState();
    _timerService = RealTimerService();
    _audioService = RealAudioService();
  }

  @override
  void dispose() {
    _timerService.dispose();
    _audioService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<TimerService>(
            create: (_) => _timerService,
          ),
          RepositoryProvider<AudioService>(
            create: (_) => _audioService,
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
