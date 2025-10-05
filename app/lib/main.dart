import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/analytics/services/supabase_analytics_service.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_timer_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/real_audio_recorder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:record/record.dart' as record_pkg;
import 'package:meditation_companion/core/logging/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: EnvConfig.supabaseUrl,
    anonKey: EnvConfig.supabaseAnonKey,
  );

  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();

  // Initialize AnalyticsService
  final analyticsService = SupabaseAnalyticsService(
    supabase: Supabase.instance.client,
    prefs: prefs,
  );

  // log start session event
  await analyticsService.startSession(
    userId: 'anonymous',
    deviceInfo: 'test device',
    appVersion: '1.0.0',
  );

  await _ensureMicrophonePermission();

  runApp(MainApp(analyticsService: analyticsService));
}

Future<void> _ensureMicrophonePermission() async {
  final record = record_pkg.AudioRecorder();
  try {
    final hasPermission = await record.hasPermission();
    if (!hasPermission) {
      logWarning(
        'Microphone permission denied at startup.',
        domain: 'App',
        feature: 'Permissions',
      );
    }
  } catch (error, stackTrace) {
    logError(
      'Failed to verify microphone permission',
      error: error,
      stackTrace: stackTrace,
      domain: 'App',
      feature: 'Permissions',
    );
    FlutterError.reportError(FlutterErrorDetails(
      exception: error,
      stack: stackTrace,
      library: 'voice assistant',
      informationCollector: () => <DiagnosticsNode>[
        DiagnosticsProperty('description',
            'Error thrown while requesting microphone permission on launch'),
      ],
    ));
  } finally {
    await record.dispose();
  }
}

class MainApp extends StatefulWidget {
  final AnalyticsService analyticsService;

  const MainApp({
    super.key,
    required this.analyticsService,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late final TimerService _timerService;
  late final AudioService _audioService;
  late final AudioRecorder _audioRecorder;

  @override
  void initState() {
    super.initState();
    _timerService = RealTimerService();
    _audioService = RealAudioService();
    _audioRecorder = RealAudioRecorder();
  }

  @override
  void dispose() {
    unawaited(_timerService.dispose());
    unawaited(_audioService.dispose());
    unawaited(_audioRecorder.dispose());
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
          RepositoryProvider<AudioRecorder>(
            create: (_) => _audioRecorder,
          ),
          RepositoryProvider<AnalyticsService>(
            create: (_) => widget.analyticsService,
          ),
        ],
        child: BlocProvider(
          create: (context) => MeditationBloc(
            timerService: context.read<TimerService>(),
            audioService: context.read<AudioService>(),
            analyticsService: context.read<AnalyticsService>(),
          ),
          child: const MeditationSessionScreen(),
        ),
      ),
    );
  }
}
