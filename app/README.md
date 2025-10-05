# meditation_companion

An interactive meditation app that transforms your meditation practice through personalized real-time guidance and adaptive feedback.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Logging

- Use the helpers from `core/logging/app_logger.dart` (`logDebug`, `logInfo`, `logWarning`, `logError`) instead of `print`, `debugPrint`, or `dart:developer`.
- Logs carry `[domain/feature]` tags that are inferred from the call site. Override them with the optional `domain`/`feature` parameters when you need a different context.
- Control which logs are emitted in debug builds via `--dart-define=LOG_TAGS=domain:feature,other:*`. Wildcards (`*`) are supported per tag component.
- Disable all tags with `--dart-define=LOG_TAGS=off`. Release builds ignore logging regardless of the flag.
