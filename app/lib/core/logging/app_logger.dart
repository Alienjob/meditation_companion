import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class TagValue {
  const TagValue({required this.key, required this.display});

  final String key;
  final String display;
}

/// Represents a resolved set of tags used to categorize log output.
class LogTags {
  const LogTags({required this.domain, required this.feature});

  final TagValue domain;
  final TagValue feature;

  String get key => '${domain.key}:${feature.key}';
}

/// Singleton facade around the `logger` package that injects tag-aware filtering.
class AppLogger {
  AppLogger._internal()
      : _logger = Logger(
          printer: PrettyPrinter(
            methodCount: 0,
            errorMethodCount: 8,
            lineLength: 100,
            colors: false,
            printEmojis: false,
            noBoxingByDefault: true,
          ),
        );

  static final AppLogger instance = AppLogger._internal();

  final Logger _logger;

  void debug(
    Object? message, {
    String? domain,
    String? feature,
    Object? error,
    StackTrace? stackTrace,
    Object? context,
  }) {
    _log(
      level: Level.debug,
      message: message,
      domain: domain,
      feature: feature,
      error: error,
      stackTrace: stackTrace,
      context: context,
    );
  }

  void info(
    Object? message, {
    String? domain,
    String? feature,
    Object? error,
    StackTrace? stackTrace,
    Object? context,
  }) {
    _log(
      level: Level.info,
      message: message,
      domain: domain,
      feature: feature,
      error: error,
      stackTrace: stackTrace,
      context: context,
    );
  }

  void warning(
    Object? message, {
    String? domain,
    String? feature,
    Object? error,
    StackTrace? stackTrace,
    Object? context,
  }) {
    _log(
      level: Level.warning,
      message: message,
      domain: domain,
      feature: feature,
      error: error,
      stackTrace: stackTrace,
      context: context,
    );
  }

  void error(
    Object? message, {
    String? domain,
    String? feature,
    Object? error,
    StackTrace? stackTrace,
    Object? context,
  }) {
    _log(
      level: Level.error,
      message: message,
      domain: domain,
      feature: feature,
      error: error,
      stackTrace: stackTrace,
      context: context,
    );
  }

  void _log({
    required Level level,
    required Object? message,
    String? domain,
    String? feature,
    Object? error,
    StackTrace? stackTrace,
    Object? context,
  }) {
    if (kReleaseMode) {
      return;
    }

    final tags = _LogTagResolver.resolve(
      domain: domain,
      feature: feature,
      context: context,
      stackTrace: stackTrace,
    );

    // if (!_LogSettings.isEnabled(tags)) {
    //   return;
    // }

    final resolvedMessage = _evaluateMessage(message);

    final decoratedMessage =
        '[${tags.domain.display}/${tags.feature.display}] $resolvedMessage';

    _dispatch(level, decoratedMessage, error, stackTrace);
  }

  Object? _evaluateMessage(Object? message) {
    if (message is String) return message;
    if (message is String Function()) return message();
    if (message is Object? Function()) return message();
    return message?.toString() ?? 'null';
  }

  void _dispatch(
      Level level, Object? message, Object? error, StackTrace? stackTrace) {
    switch (level) {
      case Level.debug:
        _logger.d(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      case Level.info:
        _logger.i(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      case Level.warning:
        _logger.w(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      case Level.error:
        _logger.e(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      case Level.fatal:
        _logger.f(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      case Level.trace:
        _logger.t(
          message,
          error: error,
          stackTrace: stackTrace,
        );
        return;
      default:
        _logger.log(
          level,
          message,
          error: error,
          stackTrace: stackTrace,
        );
    }
  }
}

class _LogTagResolver {
  static LogTags resolve({
    String? domain,
    String? feature,
    Object? context,
    StackTrace? stackTrace,
  }) {
    final inferred = _inferFromContext(context) ??
        _inferFromStack(stackTrace ?? StackTrace.current);

    final resolvedDomain =
        _mergeTag(explicit: domain, fallback: inferred.domain);
    final resolvedFeature =
        _mergeTag(explicit: feature, fallback: inferred.feature);

    return LogTags(domain: resolvedDomain, feature: resolvedFeature);
  }

  static LogTags? _inferFromContext(Object? context) {
    if (context == null) return null;
    final runtimeTypeName =
        context is Type ? context.toString() : context.runtimeType.toString();
    final normalized = _normalizeKey(runtimeTypeName);
    final explicitDisplay = _displayFromExplicit(runtimeTypeName);
    final parts = normalized.split('_');
    if (parts.length >= 2) {
      final domainKey = parts.first;
      final featureKey = parts.sublist(1).join('_');
      return LogTags(
        domain: TagValue(
          key: domainKey,
          display: _displayFromKey(domainKey),
        ),
        feature: TagValue(
          key: featureKey,
          display: _displayFromKey(featureKey),
        ),
      );
    }
    final domainTag = TagValue(
      key: normalized,
      display: explicitDisplay,
    );
    return LogTags(
      domain: domainTag,
      feature: const TagValue(key: 'general', display: 'General'),
    );
  }

  static LogTags _inferFromStack(StackTrace stackTrace) {
    final trace = stackTrace.toString().split('\n');
    for (final frame in trace) {
      final match = RegExp(r'package:meditation_companion/(lib/)?([^:]+)')
          .firstMatch(frame);
      if (match != null) {
        final path = match.group(2) ?? '';
        if (path.startsWith('core/logging')) {
          continue;
        }
        final tags = _normalizePathComponents(path.split('/'));
        return LogTags(domain: tags.$1, feature: tags.$2);
      }
    }
    return const LogTags(
      domain: TagValue(key: 'app', display: 'App'),
      feature: TagValue(key: 'general', display: 'General'),
    );
  }

  static (TagValue, TagValue) _normalizePathComponents(
      List<String> components) {
    final filtered = components.where((c) => c.isNotEmpty).toList();
    if (filtered.isEmpty) {
      return (
        const TagValue(key: 'app', display: 'App'),
        const TagValue(key: 'general', display: 'General'),
      );
    }

    String domainSource;
    String? featureSource;

    if (filtered.first == 'lib' && filtered.length >= 2) {
      domainSource = filtered[1];
      featureSource = filtered.length >= 3 ? filtered[2] : null;
    } else if (filtered.first == 'features' && filtered.length >= 2) {
      domainSource = filtered[1];
      featureSource = filtered.length >= 3 ? filtered[2] : null;
    } else if (filtered.first == 'core' && filtered.length >= 2) {
      domainSource = filtered[1];
      featureSource = filtered.length >= 3 ? filtered[2] : null;
    } else {
      domainSource = filtered.first;
      featureSource = filtered.length >= 2 ? filtered[1] : null;
    }

    String featureCandidate;
    if (featureSource != null && featureSource.isNotEmpty) {
      featureCandidate = featureSource;
    } else {
      final last = filtered.last;
      featureCandidate = _stripDartExtension(last);
    }

    final domainKey = _normalizeKey(domainSource);
    final featureKey = _normalizeKey(featureCandidate);

    return (
      TagValue(
        key: domainKey,
        display: _displayFromKey(domainKey),
      ),
      TagValue(
        key: featureKey,
        display: _displayFromKey(featureKey),
      ),
    );
  }

  static TagValue _mergeTag({
    required String? explicit,
    required TagValue fallback,
  }) {
    final trimmed = explicit?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return fallback;
    }
    final key = _normalizeKey(trimmed);
    return TagValue(
      key: key,
      display: _displayFromExplicit(trimmed),
    );
  }

  static String _stripDartExtension(String input) {
    return input.endsWith('.dart')
        ? input.substring(0, input.length - 5)
        : input;
  }

  static String _normalizeKey(String value) {
    final sanitized = value
        .replaceAll('.dart', '')
        .replaceAll(RegExp(r'[^A-Za-z0-9]+'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .trim();
    if (sanitized.isEmpty) return 'general';
    return sanitized.toLowerCase();
  }

  static String _displayFromKey(String key) {
    final parts = key.split('_').where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) {
      return _capitalize(key);
    }
    return parts.map(_capitalize).join(' ');
  }

  static String _displayFromExplicit(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'General';
    }
    return trimmed;
  }

  static String _capitalize(String value) {
    if (value.isEmpty) return value;
    if (value.length == 1) return value.toUpperCase();
    return value[0].toUpperCase() + value.substring(1);
  }
}

class _TagPattern {
  const _TagPattern({required this.domain, required this.feature});

  final String domain;
  final String feature;

  bool matches(LogTags tags) {
    final domainMatches = domain == '*' || domain == tags.domain.key;
    final featureMatches = feature == '*' || feature == tags.feature.key;
    return domainMatches && featureMatches;
  }

  @override
  String toString() => '$domain:$feature';
}

class _LogSettings {
  static final bool _releaseMode = kReleaseMode;
  static final List<_TagPattern> _suppressedPatterns = _parsePatterns(
    const String.fromEnvironment('SUPPRESSED_LOG_TAGS', defaultValue: ''),
  );

  static bool isEnabled(LogTags tags) {
    if (_releaseMode) return false;
    if (_suppressedPatterns.isEmpty) return true;
    final suppressed =
        _suppressedPatterns.any((pattern) => pattern.matches(tags));
    return !suppressed;
  }

  static List<_TagPattern> _parsePatterns(String raw) {
    final trimmed = raw.trim().toLowerCase();
    if (trimmed.isEmpty || trimmed == 'none' || trimmed == 'off') {
      return const <_TagPattern>[];
    }

    final cleaned = trimmed
        .split(RegExp(r'[;,\s]+'))
        .map((token) => token.trim())
        .where((token) => token.isNotEmpty)
        .toList();

    if (cleaned.isEmpty) {
      return [_TagPattern(domain: '*', feature: '*')];
    }

    return cleaned.map((token) {
      final parts = token.split(':');
      final rawDomain =
          parts.isNotEmpty && parts.first.isNotEmpty ? parts.first : '*';
      final rawFeature =
          parts.length > 1 && parts[1].isNotEmpty ? parts[1] : '*';
      final domain = rawDomain == '*'
          ? rawDomain
          : _LogTagResolver._normalizeKey(rawDomain);
      final feature = rawFeature == '*'
          ? rawFeature
          : _LogTagResolver._normalizeKey(rawFeature);
      return _TagPattern(domain: domain, feature: feature);
    }).toList(growable: false);
  }

  static Set<String> get activeTags =>
      _suppressedPatterns.map((pattern) => pattern.toString()).toSet();
}

void logDebug(
  Object? message, {
  String? domain,
  String? feature,
  Object? error,
  StackTrace? stackTrace,
  Object? context,
}) {
  AppLogger.instance.debug(
    message,
    domain: domain,
    feature: feature,
    error: error,
    stackTrace: stackTrace,
    context: context,
  );
}

void logInfo(
  Object? message, {
  String? domain,
  String? feature,
  Object? error,
  StackTrace? stackTrace,
  Object? context,
}) {
  AppLogger.instance.info(
    message,
    domain: domain,
    feature: feature,
    error: error,
    stackTrace: stackTrace,
    context: context,
  );
}

void logWarning(
  Object? message, {
  String? domain,
  String? feature,
  Object? error,
  StackTrace? stackTrace,
  Object? context,
}) {
  AppLogger.instance.warning(
    message,
    domain: domain,
    feature: feature,
    error: error,
    stackTrace: stackTrace,
    context: context,
  );
}

void logError(
  Object? message, {
  String? domain,
  String? feature,
  Object? error,
  StackTrace? stackTrace,
  Object? context,
}) {
  AppLogger.instance.error(
    message,
    domain: domain,
    feature: feature,
    error: error,
    stackTrace: stackTrace,
    context: context,
  );
}

Set<String> activeLogTags() => _LogSettings.activeTags;
