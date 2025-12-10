import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/config/env_config.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/analytics/services/supabase_analytics_service.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';
import 'package:meditation_companion/features/auth/repository/supabase_auth_repository.dart';
import 'package:meditation_companion/features/auth/views/auth_wrapper.dart';
import 'package:meditation_companion/features/meditation/bloc/meditation_bloc.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_timer_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/mock_audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/real_audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/voice_assistant_scope.dart';
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
  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _timerService = RealTimerService();
    _audioService = RealAudioService();
    // Use MockAudioRecorder in debug mode for testing
    if (kDebugMode) {
      _audioRecorder = MockAudioRecorder(
        stateTransitionDelay: const Duration(seconds: 1),
      );
    } else {
      _audioRecorder = RealAudioRecorder();
    }
    _authRepository = SupabaseAuthRepository(Supabase.instance.client);
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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TimerService>.value(value: _timerService),
        RepositoryProvider<AudioService>.value(value: _audioService),
        RepositoryProvider<AudioRecorder>.value(value: _audioRecorder),
        RepositoryProvider<AnalyticsService>.value(
          value: widget.analyticsService,
        ),
        RepositoryProvider<AuthRepository>.value(value: _authRepository),
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
