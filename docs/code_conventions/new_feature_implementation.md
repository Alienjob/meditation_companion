# New Feature Implementation Guide

## Overview
This document outlines the process for implementing new features in the Meditation Companion app. It builds upon our established conventions for Test-Driven Development (TDD) and BLoC state management.

## Prerequisites
Before starting feature implementation, familiarize yourself with:
- TDD approach: see [testing_strategy.md](testing_strategy.md)
- State management patterns: see [state_management.md](state_management.md)

## Implementation Flow

1. **Feature Planning**
   - Create a new feature branch from main
   - Define the feature requirements
   - Break down into smaller, testable units

2. **Testing First**
   - Follow TDD approach from testing_strategy.md
   - Start with unit tests
   - Add widget tests when implementing UI
   - Run existing tests to ensure no regressions

3. **State Management**
   - Follow BLoC pattern as defined in state_management.md
   - Implement states before UI
   - Keep BLoCs focused and single-responsibility

4. **Implementation Steps**
   ```
   feature/
   ├── bloc/
   │   ├── feature_bloc.dart
   │   ├── feature_event.dart
   │   └── feature_state.dart
   ├── models/
   │   └── feature_model.dart
   ├── repository/
   │   └── feature_repository.dart
   └── views/
       └── feature_view.dart
   ```

   a. Create feature directory structure  
   b. Write tests for models and repository  
   c. Implement models and repository  
   d. Write tests for BLoC  
   e. Implement BLoC  
   f. Write widget tests  
   g. Implement UI  

5. **Code Review**
   - Ensure tests pass
   - Check state management implementation
   - Verify documentation
   - Review naming conventions

## File Naming
- BLoC files: `<feature>_bloc.dart`, `<feature>_event.dart`, `<feature>_state.dart`
- Tests: `<feature>_test.dart`
- Models: `<feature>_model.dart`
- Views: `<feature>_view.dart`

## Review Checklist
- [ ] Tests written first
- [ ] Tests pass
- [ ] Follows BLoC pattern
- [ ] Documentation updated
- [ ] No unused code
- [ ] Clear naming

Remember: This guide is meant to be used in conjunction with our testing and state management documentation. Refer to those files for detailed patterns and conventions.