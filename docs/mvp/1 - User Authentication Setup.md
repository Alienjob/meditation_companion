# User Authentication Setup Implementation Plan

## Overview
This document outlines the implementation plan for user authentication in the Meditation Companion app using Supabase as the backend authentication provider.

## Tech Stack
- Flutter for cross-platform development
- Supabase for authentication and user management
- supabase_flutter: ^2.0.0 package

## Implementation Steps

### 1. Project Setup

#### A. Supabase Project Configuration
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

### 2. Implementation Structure

#### A. Auth Service
Create a service to handle authentication operations:

```dart
// lib/services/auth_service.dart
class AuthService {
  final SupabaseClient _supabase;
  
  AuthService(this._supabase);
  
  // Sign up with email and password
  Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } catch (error) {
      throw AuthException(message: error.toString());
    }
  }
  
  // Sign in with email and password
  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (error) {
      throw AuthException(message: error.toString());
    }
  }
  
  // Password reset
  Future<void> resetPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (error) {
      throw AuthException(message: error.toString());
    }
  }
  
  // Sign out
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (error) {
      throw AuthException(message: error.toString());
    }
  }
  
  // Get current user
  User? get currentUser => _supabase.auth.currentUser;
  
  // Stream of auth changes
  Stream<AuthState> get authStateChanges => 
      _supabase.auth.onAuthStateChange;
}
```

#### B. Auth BLoC Implementation
For detailed BLoC pattern implementation, refer to [State Management Conventions](../code_conventions/state_management.md).

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
  final AuthService _authService;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    
    // Listen to auth state changes
    _authService.authStateChanges.listen((auth) {
      if (auth.session?.user != null) {
        add(AuthCheckRequested());
      }
    });
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = _authService.currentUser;
    if (user != null) {
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInProgress());
    try {
      final response = await _authService.signIn(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(response.user!));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInProgress());
    try {
      await _authService.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
```

### 3. UI Implementation

#### A. Login Screen with BLoC
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

### 4. Application Setup

```dart
// lib/main.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Supabase
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  // Set up BLoC observer for debugging
  Bloc.observer = AppBlocObserver();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authService: AuthService(
              Supabase.instance.client,
            ),
          )..add(AuthCheckRequested()),
        ),
        // Add other BLoCs here
      ],
      child: MaterialApp(
        title: 'Meditation Companion',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

// BLoC observer for debugging
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    debugPrint('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

// Wrapper widget to handle auth state
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is Authenticated) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
```

### 5. Error Handling and Security

#### A. Custom Exceptions
```dart
// lib/exceptions/auth_exception.dart
class AuthException implements Exception {
  final String message;
  
  AuthException({required this.message});
  
  @override
  String toString() => message;
}
```

#### B. Secure Token Storage
Configure secure storage for auth tokens:

```dart
// lib/services/secure_storage.dart
class SecureStorage {
  final FlutterSecureStorage _storage;
  
  SecureStorage(this._storage);
  
  Future<void> saveToken(String token) async {
    await _storage.write(key: 'auth_token', value: token);
  }
  
  Future<String?> getToken() async {
    return await _storage.read(key: 'auth_token');
  }
  
  Future<void> deleteToken() async {
    await _storage.delete(key: 'auth_token');
  }
}
```

### 5. Security Best Practices

1. Token Management:
   - Store tokens securely using FlutterSecureStorage
   - Implement token refresh mechanism
   - Clear tokens on logout

2. Password Security:
   - Enforce strong password requirements
   - Implement rate limiting for login attempts
   - Secure password reset flow

3. Session Management:
   - Implement session timeout
   - Handle multiple device sessions
   - Secure session persistence

### 6. Testing Plan

1. Unit Tests:
   - Auth service methods
   - Token management
   - Error handling

2. Integration Tests:
   - Login flow
   - Registration flow
   - Password reset flow

3. Security Tests:
   - Token storage security
   - Session management
   - API endpoint security

### 7. Monitoring and Analytics

1. Implement authentication analytics:
   - Login success/failure rates
   - Registration completion rates
   - Password reset usage

2. Error tracking:
   - Authentication failures
   - API errors
   - Session issues

## Implementation Timeline

1. Week 1:
   - Project setup
   - Basic auth service implementation
   - UI implementation

2. Week 2:
   - Error handling
   - Security implementations
   - Testing and bug fixes

## Success Criteria

1. Users can successfully:
   - Register new accounts
   - Login with email/password
   - Reset passwords
   - Maintain authenticated sessions

2. Security requirements met:
   - Secure token storage
   - Protected API endpoints
   - Rate limiting implemented
   - Session management working

3. Performance metrics:
   - Auth operations complete in < 2 seconds
   - 99.9% uptime for auth services
   - < 0.1% error rate for auth operations