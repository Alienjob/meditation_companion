# State Management Conventions with BLoC Pattern

## Overview
This document outlines the conventions and best practices for state management using the BLoC (Business Logic Component) pattern in the Meditation Companion app.

## Dependencies
```yaml
dependencies:
  flutter_bloc: ^8.1.0
  equatable: ^2.0.5
```

## Directory Structure
```
lib/
├── blocs/
│   ├── auth/
│   │   ├── auth_bloc.dart
│   │   ├── auth_event.dart
│   │   ├── auth_state.dart
│   │   └── auth_barrel.dart
│   └── bloc_observer.dart
├── repositories/
│   └── auth_repository.dart
└── services/
    └── auth_service.dart
```

## BLoC Implementation Guidelines

### 1. Events and States
- Events should be named with verbs in present tense
- States should be named with adjectives or nouns
- Use Equatable for comparing states and events

Example for AuthBloc:

```dart
// auth_event.dart
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

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  const SignUpRequested(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOutRequested extends AuthEvent {}

// auth_state.dart
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

### 2. BLoC Implementation

```dart
// auth_bloc.dart
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final currentUser = _authRepository.currentUser;
    if (currentUser != null) {
      emit(Authenticated(currentUser));
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
      final user = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthInProgress());
    try {
      final user = await _authRepository.signUp(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(user));
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
      await _authRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
```

### 3. Repository Implementation

```dart
// auth_repository.dart
class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  User? get currentUser => _authService.currentUser;

  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _authService.signIn(
      email: email,
      password: password,
    );
    return response.user!;
  }

  Future<User> signUp({
    required String email,
    required String password,
  }) async {
    final response = await _authService.signUp(
      email: email,
      password: password,
    );
    return response.user!;
  }

  Future<void> signOut() => _authService.signOut();
}
```

### 4. BLoC Usage in UI

```dart
// main.dart
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepository: AuthRepository(
              authService: AuthService(Supabase.instance.client),
            ),
          )..add(AuthCheckRequested()),
        ),
        // Other BLoCs...
      ],
      child: MyApp(),
    ),
  );
}

// login_screen.dart
class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
          if (state is AuthInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          
          return Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) => value!.isEmpty 
                      ? 'Please enter your email' 
                      : null,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) => value!.isEmpty 
                      ? 'Please enter your password' 
                      : null,
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

## BLoC Organization

### Types of BLoCs

1. **Global (App-State) BLoCs**
   - Manage application-wide state
   - Long-lived, typically exist for the entire app lifecycle
   - Usually provided at the root of the widget tree
   - Examples:
     ```dart
     // Global BLoCs
     class AuthBloc extends Bloc<AuthEvent, AuthState> {...}
     class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {...}
     class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {...}
     ```
   - Provided at app level:
     ```dart
     void main() {
       runApp(
         MultiBlocProvider(
           providers: [
             BlocProvider(create: (context) => AuthBloc()),
             BlocProvider(create: (context) => ThemeBloc()),
             // Other global BLoCs...
           ],
           child: MyApp(),
         ),
       );
     }
     ```

2. **Local (Feature/Page) BLoCs**
   - Manage state for specific features or pages
   - Short-lived, created when feature/page is loaded and disposed when not needed
   - Scoped to specific widgets/features
   - Examples:
     ```dart
     // Page-specific BLoC
     class MeditationSessionBloc extends Bloc<SessionEvent, SessionState> {...}
     class ProgressTrackingBloc extends Bloc<ProgressEvent, ProgressState> {...}
     
     // Component-specific BLoC
     class TimerBloc extends Bloc<TimerEvent, TimerState> {...}
     class AudioPlayerBloc extends Bloc<AudioEvent, AudioState> {...}
     ```
   - Provided at feature level:
     ```dart
     class MeditationSessionScreen extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
         return BlocProvider(
           create: (context) => MeditationSessionBloc(),
           child: MeditationSessionView(),
         );
       }
     }
     ```

### Best Practices for BLoC Organization

1. **Global BLoCs**
   - Keep them minimal and focused on app-wide concerns
   - Use for shared state that affects multiple features
   - Examples of appropriate global state:
     - Authentication state
     - Theme/appearance settings
     - User profile/preferences
     - Network connectivity
     - App configuration

2. **Local BLoCs**
   - Create for specific feature/page functionality
   - Dispose when feature/page is not in use
   - Keep state and logic close to where it's used
   - Examples of appropriate local state:
     - Form state
     - Page-specific data loading
     - Feature-specific user interactions
     - Component-specific animations

3. **Communication Between BLoCs**
   - Global BLoCs can be accessed by local BLoCs using context.read()
   - Local BLoCs should not directly modify global state
   - Use events for communication and organize listeners cleanly:
     ```dart
     class MeditationSessionBloc extends Bloc<SessionEvent, SessionState> {
       final AuthBloc _authBloc;
       StreamSubscription<AuthState>? _authSubscription;
       
       MeditationSessionBloc({required AuthBloc authBloc})
           : _authBloc = authBloc,
             super(MeditationSessionInitial()) {
         on<SessionStarted>(_onSessionStarted);
         on<SessionEnded>(_onSessionEnded);
         
         // Initialize auth state listener
         _authSubscription = _authBloc.stream.listen(_authStateListener);
       }
       
       void _authStateListener(AuthState state) {
         if (state is Unauthenticated) {
           add(SessionEnded());
         }
       }
       
       @override
       Future<void> close() {
         _authSubscription?.cancel();
         return super.close();
       }
     }
     ```

4. **Lifecycle Management**
   ```dart
   class MeditationSessionScreen extends StatefulWidget {
     @override
     _MeditationSessionScreenState createState() => _MeditationSessionScreenState();
   }

   class _MeditationSessionScreenState extends State<MeditationSessionScreen> {
     late MeditationSessionBloc _sessionBloc;

     @override
     void initState() {
       super.initState();
       _sessionBloc = MeditationSessionBloc(
         authBloc: context.read<AuthBloc>(),
       );
     }

     @override
     void dispose() {
       _sessionBloc.close();
       super.dispose();
     }

     @override
     Widget build(BuildContext context) {
       return BlocProvider.value(
         value: _sessionBloc,
         child: MeditationSessionView(),
       );
     }
   }
   ```

5. **Testing**
   ```dart
   void main() {
     group('MeditationSessionBloc', () {
       late MockAuthBloc mockAuthBloc;
       late MeditationSessionBloc sessionBloc;
       
       setUp(() {
         mockAuthBloc = MockAuthBloc();
         sessionBloc = MeditationSessionBloc(
           authBloc: mockAuthBloc,
         );
       });
       
       tearDown(() {
         sessionBloc.close();
       });
       
       blocTest<MeditationSessionBloc, MeditationSessionState>(
         'emits [SessionEnded] when auth state is Unauthenticated',
         build: () => sessionBloc,
         act: (bloc) => mockAuthBloc.emit(Unauthenticated()),
         expect: () => [isA<SessionEnded>()],
       );
     });
   }
   ```

## General Best Practices

1. **Event Handling**
   - Keep events specific and action-oriented
   - Use meaningful names that describe the action
   - Include only necessary data in event props

2. **State Management**
   - Keep states immutable
   - Use Equatable for efficient comparison
   - Make states as granular as needed
   - Include only necessary data in state props

3. **BLoC Implementation**
   - One responsibility per BLoC
   - Keep business logic in repositories
   - Use dependency injection for services
   - Handle errors gracefully

4. **Testing**
   ```dart
   // auth_bloc_test.dart
   void main() {
     late AuthBloc authBloc;
     late MockAuthRepository mockAuthRepository;

     setUp(() {
       mockAuthRepository = MockAuthRepository();
       authBloc = AuthBloc(authRepository: mockAuthRepository);
     });

     blocTest<AuthBloc, AuthState>(
       'emits [AuthInProgress, Authenticated] when SignInRequested is successful',
       build: () => authBloc,
       act: (bloc) => bloc.add(SignInRequested('email', 'password')),
       expect: () => [
         AuthInProgress(),
         isA<Authenticated>(),
       ],
     );
   }
   ```

## Code Generation
For larger applications, consider using `freezed` for immutable state/event classes:

```yaml
dependencies:
  freezed_annotation: ^2.4.1

dev_dependencies:
  build_runner: ^2.4.6
  freezed: ^2.4.2
```

Example with Freezed:
```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.inProgress() = AuthInProgress;
  const factory AuthState.authenticated(User user) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.failure(String message) = AuthFailure;
}
```

## Error Handling
Always handle errors within the BLoC and emit appropriate failure states:

```dart
try {
  // Attempt operation
  emit(SuccessState());
} on AuthException catch (e) {
  emit(AuthFailure(e.message));
} on NetworkException catch (e) {
  emit(AuthFailure('Network error: ${e.message}'));
} catch (e) {
  emit(AuthFailure('An unexpected error occurred'));
}
```

Remember to use BlocObserver for debugging:
```dart
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

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}