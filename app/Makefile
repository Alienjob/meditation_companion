.PHONY: help clean test coverage build-android build-ios build-web lint format doctor update install deps

# Variables
FLUTTER = flutter
DART = dart
APP_NAME = meditation_companion

# Help command
help:
	@echo "Meditation Companion App Development Commands:"
	@echo "  make help           - Show this help message"
	@echo "  make clean          - Clean the project"
	@echo "  make test           - Run all tests"
	@echo "  make coverage       - Run tests with coverage"
	@echo "  make build-android  - Build Android APK"
	@echo "  make build-ios      - Build iOS app"
	@echo "  make build-web      - Build web app"
	@echo "  make lint           - Run linting and static analysis"
	@echo "  make format         - Format code using dart format"
	@echo "  make doctor         - Run Flutter doctor"
	@echo "  make update         - Update dependencies"
	@echo "  make install        - Install all dependencies"
	@echo "  make deps           - Show dependency graph"

# Clean the project
clean:
	$(FLUTTER) clean

# Run all tests
test:
	$(FLUTTER) test

# Run tests with coverage
coverage:
	$(FLUTTER) test --coverage
	@if command -v lcov >/dev/null 2>&1; then \
		genhtml coverage/lcov.info -o coverage/html; \
		echo "Coverage report generated in coverage/html/index.html"; \
		if [ "$(shell uname)" = "Darwin" ]; then open coverage/html/index.html; fi; \
	else \
		echo "lcov is not installed. Cannot generate HTML coverage report."; \
		echo "Install with: brew install lcov (macOS) or apt-get install lcov (Linux)"; \
	fi

# Build Android APK
build-android:
	$(FLUTTER) build apk --release

# Build iOS app
build-ios:
	$(FLUTTER) build ios --release --no-codesign

# Build web app
build-web:
	$(FLUTTER) build web --release

# Run linting
lint:
	$(FLUTTER) analyze

# Format code
format:
	$(DART) format lib test

# Run Flutter doctor
doctor:
	$(FLUTTER) doctor -v

# Update dependencies
update:
	$(FLUTTER) pub upgrade

# Install dependencies
install:
	$(FLUTTER) pub get

# Show dependency graph
deps:
	$(FLUTTER) pub deps
