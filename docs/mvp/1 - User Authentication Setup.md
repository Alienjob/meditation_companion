# User Authentication Setup Implementation Plan

## Overview
This document outlines the iterative implementation plan for user authentication in the Meditation Companion app. The implementation follows a mock-first approach to enable early testing and development, followed by UI implementation and final integration with Supabase as the backend authentication provider.

## Tech Stack
- Flutter for cross-platform development
- Supabase for authentication and user management
- supabase_flutter: ^2.0.0 package

## Implementation Steps

### 1. Mock Repository Implementation

#### A. Auth Repository Interface
Create the base interface that both mock and real implementations will follow:

```dart
// lib/repositories/auth_repository.dart
abstract class AuthRepository {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Stream<AuthState> get authStateChanges;
  User? get currentUser;
}
```

#### B. Mock Repository Implementation
```dart
// lib/repositories/mock_auth_repository.dart
class MockAuthRepository implements AuthRepository {
  User? _currentUser;
  final _authStateController = StreamController<AuthState>.broadcast();
  
  // Simulated user database
  final Map<String, String> _users = {
    'test@example.com': 'password123'
  };

  @override
  Future<User> signIn(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    if (_users[email] == password) {
      _currentUser = User(email: email, id: '123');
      _authStateController.add(AuthState.authenticated(_currentUser!));
      return _currentUser!;
    }
    throw AuthException('Invalid credentials');
  }

  @override
  Future<User> signUp(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (_users.containsKey(email)) {
      throw AuthException('Email already registered');
    }
    _users[email] = password;
    _currentUser = User(email: email, id: DateTime.now().toString());
    _authStateController.add(AuthState.authenticated(_currentUser!));
    return _currentUser!;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(Duration(milliseconds: 500));
    _currentUser = null;
    _authStateController.add(AuthState.unauthenticated());
  }

  @override
  Future<void> resetPassword(String email) async {
    await Future.delayed(Duration(seconds: 1));
    if (!_users.containsKey(email)) {
      throw AuthException('Email not found');
    }
    // Simulate password reset email
    print('Password reset email sent to $email');
  }

  @override
  Stream<AuthState> get authStateChanges => _authStateController.stream;

  @override
  User? get currentUser => _currentUser;
}
```

#### C. Mock Implementation Tests
```dart
// test/repositories/mock_auth_repository_test.dart
void main() {
  group('MockAuthRepository', () {
    late MockAuthRepository repository;

    setUp(() {
      repository = MockAuthRepository();
    });

    test('signIn with valid credentials succeeds', () async {
      final user = await repository.signIn('test@example.com', 'password123');
      expect(user.email, equals('test@example.com'));
      expect(repository.currentUser, isNotNull);
    });

    test('signIn with invalid credentials throws', () {
      expect(
        () => repository.signIn('test@example.com', 'wrongpassword'),
        throwsA(isA<AuthException>()),
      );
    });

    // Add more tests...
  });
}
```

### 2. UI Implementation

#### A. Auth BLoC Implementation

1. Auth Events:
```dart
// lib/blocs/auth/auth_event.dart
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthCheckRequested extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}
```

2. Auth States:
```dart
// lib/blocs/auth/auth_state.dart
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthInProgress extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

class Unauthenticated extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}
```

3. Auth BLoC:
```dart
// lib/blocs/auth/auth_bloc.dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    
    // Listen to auth state changes
    _authRepository.authStateChanges.listen((auth) {
      add(AuthCheckRequested());
    });
  }

  // Implementation of event handlers...
}
```

#### B. Auth UI Implementation

1. Login Screen:
```dart
// lib/screens/login_screen.dart
class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                if (state is AuthInProgress)
                  CircularProgressIndicator(),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        SignInRequested(
                          _emailController.text,
                          _passwordController.text,
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
```

### 3. Supabase Integration

#### A. Project Setup
1. Create new Supabase project
2. Configure authentication settings in Supabase dashboard
3. Enable email/password and magic link authentication methods
4. Set up email templates for:
   - Email verification
   - Password reset
   - Magic link login

#### B. Flutter Project Configuration

1. Add Supabase dependencies to pubspec.yaml:
```yaml
dependencies:
  supabase_flutter: ^2.0.0
  flutter_bloc: ^8.1.0
  equatable: ^2.0.5
  flutter_secure_storage: ^8.0.0  # For secure token storage
```

2. Configure platform-specific settings:

Android (android/app/src/main/AndroidManifest.xml):
```xml
<manifest ...>
    <uses-permission android:name="android.permission.INTERNET" />
    <!-- Add deep link configuration here -->
</manifest>
```

iOS (ios/Runner/Info.plist):
```xml
<!-- Add deep link configuration here -->
```

#### C. Supabase Repository Implementation
```dart
// lib/repositories/supabase_auth_repository.dart
class SupabaseAuthRepository implements AuthRepository {
  final SupabaseClient _supabase;
  
  SupabaseAuthRepository(this._supabase);
  
  @override
  Future<User> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!;
    } catch (error) {
      throw AuthException(message: error.toString());
    }
  }
  
  // Implement other methods...
}
```

### 4. Error Handling and Testing

#### A. Error Handling Implementation

1. Custom Exceptions:
```dart
// lib/exceptions/auth_exception.dart
class AuthException implements Exception {
  final String message;
  
  AuthException({required this.message});
  
  @override
  String toString() => message;
}
```

2. Error Cases to Handle:
- Network connectivity issues
- Invalid credentials
- Account already exists
- Password requirements not met
- Rate limiting
- Session expiration
- Token refresh failures

#### B. Testing Plan

1. Unit Tests:
- Mock repository tests
- Auth BLoC tests
- Error handling tests
- Token management tests

2. Widget Tests:
- Login form validation
- Error message display
- Loading states
- Navigation flows

3. Integration Tests:
- Complete auth flows
- API communication
- Error scenarios
- Session management

4. Security Tests:
- Token storage security
- Session management
- API endpoint security
- Input validation

## Implementation Timeline

1. Week 1:
   - Mock repository implementation
   - Basic UI implementation
   - Initial testing with mock data

2. Week 2:
   - Supabase integration
   - Error handling implementation
   - Integration testing

3. Week 3:
   - Edge case handling
   - Security improvements
   - Performance optimization

## Success Criteria

1. Functionality:
   - Users can register, login, and reset passwords
   - Authentication state persists across app restarts
   - All error cases are handled gracefully

2. Testing:
   - All unit tests pass
   - Integration tests cover main flows
   - Security tests validate token handling

3. Performance:
   - Auth operations complete in < 2 seconds
   - Smooth transitions between auth states
   - Proper error feedback to users

## Migration Strategy

1. Development Phase:
   - Use MockAuthRepository for initial development
   - Test all flows with mock data
   - Validate UI/UX with stakeholders

2. Integration Phase:
   - Switch to SupabaseAuthRepository
   - Verify all flows with actual backend
   - Monitor for any integration issues

3. Production Phase:
   - Deploy with proper error monitoring
   - Collect analytics on auth operations
   - Monitor for security incidents