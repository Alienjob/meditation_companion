# Model Conventions

## Core Principles

1. Models should be immutable
2. Models should extend Equatable for proper value comparison
3. Models should only depend on other models (no external dependencies)
4. Models should implement copyWith for creating modified instances
5. Models should not contain business or conversion logic
6. Models should use const constructors with const-compatible initialization

## Guidelines

### ✅ DO

```dart
class User extends Equatable {
  final String id;
  final String email;
  final DateTime? lastLoginAt;

  // Good: Const constructor with all final fields initialized directly
  const User({
    required this.id,
    required this.email,
    this.lastLoginAt,
  });

  @override
  List<Object?> get props => [id, email, lastLoginAt];

  User copyWith({
    String? id,
    String? email,
    DateTime? lastLoginAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
    );
  }
}
```

### ❌ DON'T

```dart
// DON'T: Non-const initialization in constructor
class User extends Equatable {
  final DateTime createdAt;
  
  User() : createdAt = DateTime.now(); // Bad: Non-const initialization
}

// DON'T: Model containing conversion logic
class User extends Equatable {
  factory User.fromSupabaseUser(dynamic supabaseUser) {
    return User(
      id: supabaseUser.id,
      email: supabaseUser.email,
    );
  }
}

// DON'T: Model containing business logic
class User extends Equatable {
  bool isValidForLogin() {
    return email.contains('@') && password.length >= 6;
  }
}

// DON'T: Model with mutable state
class User extends Equatable {
  String? email; // mutable field
  
  void updateEmail(String newEmail) {
    email = newEmail;
  }
}
```

## Field Nullability

1. Make fields nullable only when they truly represent optional data
2. If a field is required for the model to be valid, make it non-nullable
3. Document why a field is nullable when it's not immediately obvious
4. Use nullable fields for data that might not be available immediately

## Constructor Guidelines

1. Always use const constructors
2. Initialize all fields directly in the constructor
3. Avoid field initialization with non-const expressions
4. If you need dynamic initialization, consider factory constructors in repository layer

## Where to Put Different Types of Logic

1. **Conversion Logic** (e.g., from/to JSON, from/to external types):
   - Place in respective repositories
   - Example: Converting Supabase user to domain User belongs in SupabaseAuthRepository

2. **Business Logic**:
   - Place in BLoCs/Cubits
   - Example: Validation logic for user data belongs in AuthBloc

3. **Presentation Logic**:
   - Place in UI widgets or presentation-specific models
   - Example: Formatting user data for display belongs in widgets or dedicated presentation models

## Best Practices

1. Use `final` for all fields
2. Implement `toString()` for better debugging
3. Use const constructors
4. Group related models in feature-specific directories
5. Keep models focused and single-purpose
6. Use type-safe enums instead of strings for fixed sets of values
7. Document complex properties or non-obvious constraints

## Testing

1. Test equality comparison
2. Test copyWith functionality
3. Test toString representation
4. Test const constructor usage
5. Do not test business logic in models (because there shouldn't be any)

## Example Structure

```
lib/
  features/
    auth/
      models/
        user.dart
        credentials.dart
      repository/
        auth_repository.dart  // Contains conversion logic
      bloc/
        auth_bloc.dart       // Contains business logic
```

Remember: Models should be simple, immutable data containers with const constructors. All logic should be moved to appropriate layers (repositories, BLoCs, etc.) according to their responsibility.