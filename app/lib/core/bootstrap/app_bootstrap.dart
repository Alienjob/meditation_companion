import 'package:flutter/widgets.dart';
import 'package:meditation_companion/core/bootstrap/permissions_initializer.dart';
import 'package:meditation_companion/core/bootstrap/services_initializer.dart';
import 'package:meditation_companion/core/di/service_locator.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';

/// Coordinates the entire application bootstrap process.
/// This is the single entry point for all initialization logic.
class AppBootstrap {
  static const _domain = 'App';
  static const _feature = 'Bootstrap';

  /// Run the complete bootstrap sequence
  static Future<void> run() async {
    logInfo(
      'Starting application bootstrap...',
      domain: _domain,
      feature: _feature,
    );

    // Ensure Flutter is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Step 1: Initialize Supabase
    await ServicesInitializer.initializeSupabase();

    // Step 2: Register all services in GetIt
    await ServicesInitializer.registerDependencies();

    // Step 3: Track app start
    await ServicesInitializer.trackAppStart();

    // Step 4: Check permissions
    await PermissionsInitializer.ensureMicrophonePermission();

    // TODO: Add onboarding check here
    // final shouldShowOnboarding = await _checkOnboardingStatus();

    logInfo(
      'Application bootstrap completed successfully',
      domain: _domain,
      feature: _feature,
    );
  }

  /// Check if onboarding should be shown
  /// TODO: Implement this when onboarding feature is added
  // static Future<bool> _checkOnboardingStatus() async {
  //   final prefs = sl<SharedPreferences>();
  //   final hasCompletedOnboarding = prefs.getBool('onboarding_completed') ?? false;
  //   return !hasCompletedOnboarding;
  // }
}
