import 'package:flutter/foundation.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:record/record.dart' as record_pkg;

/// Handles permission checks at app startup
class PermissionsInitializer {
  static const _domain = 'App';
  static const _feature = 'Permissions';

  /// Check and request microphone permission
  static Future<void> ensureMicrophonePermission() async {
    final record = record_pkg.AudioRecorder();
    try {
      final hasPermission = await record.hasPermission();
      if (!hasPermission) {
        logWarning(
          'Microphone permission denied at startup.',
          domain: _domain,
          feature: _feature,
        );
      } else {
        logDebug(
          'Microphone permission granted.',
          domain: _domain,
          feature: _feature,
        );
      }
    } catch (error, stackTrace) {
      logError(
        'Failed to verify microphone permission',
        error: error,
        stackTrace: stackTrace,
        domain: _domain,
        feature: _feature,
      );
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'voice assistant',
        informationCollector: () => <DiagnosticsNode>[
          DiagnosticsProperty(
            'description',
            'Error thrown while requesting microphone permission on launch',
          ),
        ],
      ));
    } finally {
      await record.dispose();
    }
  }
}
