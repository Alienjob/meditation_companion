import 'package:get_it/get_it.dart';
import 'package:meditation_companion/features/analytics/services/analytics_service.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';
import 'package:meditation_companion/features/meditation/services/audio_service.dart';
import 'package:meditation_companion/features/meditation/services/timer_service.dart';
import 'package:meditation_companion/features/voice_assistant/services/audio_recorder.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global service locator instance
final sl = GetIt.instance;

/// Type aliases for cleaner code
typedef ServiceLocator = GetIt;
