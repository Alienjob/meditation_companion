# Work on task
- Before implementing a new feature or fixing a bug, investigate problem and discuss approach with user. You can read any files, add logging, ask questions but do not change behavior until you have a clear approval from user.


# Repository Guidelines

## Project Structure & Module Organization
- Flutter code lives in `app/`; shared utilities sit in `lib/core`, configuration in `lib/config`, and domain features in `lib/features/*` (e.g., `voice_assistant`, `chat`).
- Tests mirror that layout in `app/test/{unit,widget,integration,features}` so place new suites beside the code they cover.
- Assets reside in `app/assets/` (update `pubspec.yaml` when adding); long-form specs stay in `docs/`; Supabase migrations and config live in `supabase/` and must ship with matching infrastructure notes.

## Build, Test, and Development Commands
- `make install` grabs dependencies; run after touching `pubspec.yaml`.
- `make lint` (`flutter analyze`) keeps analyzer warnings from drifting into main.
- `make test` runs the suite; `make coverage` generates `coverage/html/index.html` for quick reviews.
- `make build-{android|ios|web}` produce release artifacts; call `make clean` if caches misbehave.
- `./run.sh` reads `secrets/secrets.json` and boots the Chrome build with Supabase and OpenAI defines.

## Coding Style & Naming Conventions
- Follow the Flutter lints in `analysis_options.yaml`; analyzer clean runs are required before review.
- Format code with `make format` (`dart format lib test`) and keep filenames in `snake_case.dart`.
- Name classes and widgets descriptively (`MeditationSessionController`, `VoiceAssistantState`) and route logging through `core/logging/app_logger.dart` for tagged output.

## Testing Guidelines
- Co-locate tests in the correct `app/test` subfolder and always name files `*_test.dart` so `flutter test` discovers them.
- Exercise new logic with unit tests and add widget/integration coverage for UI flows, streaming audio, and Supabase interactions.
- Run `make coverage` on business-logic changes and skim the HTML report to confirm new branches are asserted.

## Commit & Pull Request Guidelines
- Use Conventional Commit prefixes (`feat(voice-assistant): …`, `fix(auth): …`); include a scope when touching one module.
- Attach before/after screenshots for UI tweaks; document Supabase steps whenever schema or config changes.
- Reference issues with `Closes #123`, list manual test steps, and call out required secrets or flags in the PR description.
- Keep commits focused; bundle prerequisite refactors separately but in the same PR with justification.

## Environment & Secrets
- Store environment values in `secrets/secrets.json`; never commit real keys. Provide redacted examples when updating docs.
- Override realtime settings with `--dart-define` flags (`OPENAI_REALTIME_MODEL`, `OPENAI_REALTIME_LANGUAGE`) when testing alternative models or locales.
