## General Rules

1. **Documentation Reference**
   ```
   IF creating or modifying code
   THEN check relevant docs in code_conventions/
      - state_management.md for state changes
      - testing_strategy.md for tests
      - new_feature_implementation.md for features
      - models.md for model design and conventions
   ```

2. **File Structure**
   ```
   BEFORE creating new files
   ENSURE following structure:
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

3. **Testing Order**
   ```
   WHEN implementing feature
   DO:
      1. Write unit tests
      2. Implement models/repositories
      3. Write bloc tests
      4. Implement bloc
      5. Write widget tests
      6. Implement UI
   NEVER skip test writing
   ```

4. **BLoC Pattern**
   ```
   WHEN implementing state management
   ENSURE:
      - Events are noun + verb (UserAuthenticated)
      - States are noun + adjective (UserAuthenticated)
      - Each bloc has single responsibility
      - No business logic in UI
   ```

5. **Naming Conventions**
   ```
   ENFORCE:
      - Files: snake_case.dart
      - Classes: PascalCase
      - Variables/methods: camelCase
      - Private members: _camelCase
      - BLoC files: feature_bloc.dart
      - Test files: feature_test.dart
   ```

## Code Generation Templates

1. **BLoC Event Template**
   ```dart
   abstract class FeatureEvent extends Equatable {
     const FeatureEvent();
     
     @override
     List<Object> get props => [];
   }
   ```

2. **BLoC State Template**
   ```dart
   abstract class FeatureState extends Equatable {
     const FeatureState();
     
     @override
     List<Object> get props => [];
   }
   ```

3. **Repository Template**
   ```dart
   abstract class IFeatureRepository {
     // Define interface methods
   }

   class FeatureRepository implements IFeatureRepository {
     // Implement methods
   }
   ```

## Validation Rules

1. **Test Coverage**
   ```
   BEFORE accepting implementation
   VERIFY:
      - Unit tests exist for models
      - BLoC tests cover all states
      - Widget tests for UI components
   ```

2. **Code Organization**
   ```
   ENFORCE in each file:
      1. Imports (dart, package, relative)
      2. Part declarations
      3. Class documentation
      4. Class declaration
      5. Private variables
      6. Public variables
      7. Constructors
      8. Public methods
      9. Private methods
   ```

3. **Documentation**
   ```
   REQUIRE for:
      - Public API methods
      - Complex business logic
      - Non-obvious state transitions
   ```

## Error Prevention

1. **State Management**
   ```
   PREVENT:
      - Business logic in widgets
      - Direct state manipulation
      - Nested BLoCs
   ```

2. **Testing**
   ```
   PREVENT:
      - Integration tests without unit tests
      - UI implementation before tests
      - Untested state transitions
   ```

3. **Code Structure**
   ```
   PREVENT:
      - Misplaced files
      - Incorrect naming
      - Missing test files
      - Logic in models (use repositories/blocs)
   ```

## Implementation Checklist

```
VERIFY before completion:
[ ] File structure matches convention
[ ] Tests written and passing
[ ] BLoC pattern correctly implemented
[ ] Naming follows conventions
[ ] Documentation exists
[ ] No prevented patterns used
[ ] Models are pure data classes
```

## Key challenges and lessons learned during implementation:

Command Line Operations:

Mistake: Combining multiple commands with `&&` and trying to `cd` into directories unnecessarily
Lesson: Execute one command at a time and respect the working directory provided in the environment

App Execution:

Mistake: Running `flutter run` and waiting indefinitely for output
Lesson: Understand that the command opens an interactive session and continues running until explicitly terminated
