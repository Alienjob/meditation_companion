import 'package:meditation_companion/config/env_config.dart';
import 'package:meditation_companion/core/di/service_locator.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/analytics/services/supabase_analytics_service.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';
import 'package:meditation_companion/features/auth/repository/supabase_auth_repository.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_audio_service.dart';
import 'package:meditation_companion/features/meditation/services/real_timer_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/mock_audio_recorder.dart';
import 'package:meditation_companion/features/voice_assistant/services/real_audio_recorder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Handles initialization of all application services
class ServicesInitializer {
  static const _domain = 'App';
  static const _feature = 'Bootstrap';

  /// Initialize Supabase client
  static Future<void> initializeSupabase() async {
    logDebug(
      'Initializing Supabase...',
      domain: _domain,
      feature: _feature,
    );

    await Supabase.initialize(
      url: EnvConfig.supabaseUrl,
      anonKey: EnvConfig.supabaseAnonKey,
    );

    logDebug(
      'Supabase initialized successfully',
      domain: _domain,
      feature: _feature,
    );
  }

  /// Register all services in GetIt
  static Future<void> registerDependencies() async {
    logDebug(
      'Registering services in GetIt...',
      domain: _domain,
      feature: _feature,
    );

    // Register SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    sl.registerSingleton<SharedPreferences>(prefs);

    // Register services as singletons
    sl.registerSingleton<AnalyticsService>(
      SupabaseAnalyticsService(
        supabase: Supabase.instance.client,
        prefs: prefs,
      ),
    );

    sl.registerSingleton<AuthRepository>(
      SupabaseAuthRepository(Supabase.instance.client),
    );

    sl.registerSingleton<TimerService>(RealTimerService());
    sl.registerSingleton<AudioService>(RealAudioService());
    sl.registerSingleton<AudioRecorder>(_createAudioRecorder());

    logDebug(
      'Services registered: '
      'useMockRecorder=${EnvConfig.useMockAudioRecorder}, '
      'useMockAssistant=${EnvConfig.useMockAssistant}',
      domain: _domain,
      feature: _feature,
    );
  }

  /// Create AudioRecorder based on configuration
  static AudioRecorder _createAudioRecorder() {
    if (EnvConfig.useMockAudioRecorder) {
      logDebug(
        'Using MockAudioRecorder',
        domain: _domain,
        feature: _feature,
      );
      return MockAudioRecorder(
        stateTransitionDelay: const Duration(seconds: 1),
      );
    } else {
      logDebug(
        'Using RealAudioRecorder',
        domain: _domain,
        feature: _feature,
      );
      return RealAudioRecorder();
    }
  }

  /// Log initial analytics event
  static Future<void> trackAppStart() async {
    logDebug(
      'Tracking app start session...',
      domain: _domain,
      feature: _feature,
    );

    await sl<AnalyticsService>().startSession(
      userId: 'anonymous',
      deviceInfo: 'test device',
      appVersion: '1.0.0',
    );

    logDebug(
      'App start session tracked',
      domain: _domain,
      feature: _feature,
    );
  }

  /// Dispose all registered services
  static Future<void> dispose() async {
    logDebug(
      'Disposing services...',
      domain: _domain,
      feature: _feature,
    );

    await sl<TimerService>().dispose();
    await sl<AudioService>().dispose();
    await sl<AudioRecorder>().dispose();

    await sl.reset();

    logDebug(
      'Services disposed',
      domain: _domain,
      feature: _feature,
    );
  }
}
