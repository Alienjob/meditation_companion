import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/auth/bloc/auth_state.dart';
import 'package:meditation_companion/features/auth/exceptions/auth_exception.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late final StreamSubscription<dynamic> _authStateSubscription;

  static const _domain = 'Auth';
  static const _featureFlow = 'Auth Flow';

  void _debug(String message) {
    logDebug(
      message,
      domain: _domain,
      feature: _featureFlow,
      context: AuthBloc,
    );
  }

  void _info(String message) {
    logInfo(
      message,
      domain: _domain,
      feature: _featureFlow,
      context: AuthBloc,
    );
  }

  void _error(String message, Object? error, StackTrace? stackTrace) {
    logError(
      message,
      domain: _domain,
      feature: _featureFlow,
      error: error,
      stackTrace: stackTrace,
      context: AuthBloc,
    );
  }

  AuthBloc({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(AuthInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<PasswordResetRequested>(_onPasswordResetRequested);

    // Listen to auth state changes from repository
    _authStateSubscription = _authRepository.authStateChanges.listen((user) {
      _debug(
        'Auth state stream emitted user=${user?.email ?? '<signed-out>'}',
      );
      // Always check auth state on any change, including null (signed out)
      add(AuthCheckRequested());
    });
  }

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    _debug('AuthCheckRequested received');
    final user = _authRepository.currentUser;
    if (user != null) {
      _info('Auth check resolved with user=${user.email}');
      emit(Authenticated(user));
    } else {
      _info('Auth check resolved unauthenticated');
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    _info('Sign-in requested for ${event.email}');
    emit(AuthLoading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      _info('Sign-in successful for ${user.email}');
      emit(Authenticated(user));
    } on AuthException catch (e, stackTrace) {
      _error('Sign-in failed for ${event.email}: ${e.message}', e, stackTrace);
      emit(AuthError(message: e.message, code: e.code));
    } catch (e, stackTrace) {
      _error('Sign-in failed for ${event.email}: $e', e, stackTrace);
      emit(AuthError(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    _info('Sign-up requested for ${event.email}');
    emit(AuthLoading());
    try {
      final user = await _authRepository.signUpWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      _info('Sign-up successful for ${user.email}');
      emit(Authenticated(user));
    } on AuthException catch (e, stackTrace) {
      _error('Sign-up failed for ${event.email}: ${e.message}', e, stackTrace);
      emit(AuthError(message: e.message, code: e.code));
    } catch (e, stackTrace) {
      _error('Sign-up failed for ${event.email}: $e', e, stackTrace);
      emit(AuthError(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    _info('Sign-out requested');
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      _info('Sign-out completed');
      emit(Unauthenticated());
    } on AuthException catch (e, stackTrace) {
      _error('Sign-out failed: ${e.message}', e, stackTrace);
      emit(AuthError(message: e.message, code: e.code));
    } catch (e, stackTrace) {
      _error('Sign-out failed: $e', e, stackTrace);
      emit(AuthError(message: 'An unexpected error occurred'));
    }
  }

  Future<void> _onPasswordResetRequested(
    PasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    _info('Password reset requested for ${event.email}');
    emit(AuthLoading());
    try {
      await _authRepository.sendPasswordResetEmail(event.email);
      _info('Password reset email sent for ${event.email}');
      emit(PasswordResetEmailSent(event.email));
    } on AuthException catch (e, stackTrace) {
      _error(
        'Password reset failed for ${event.email}: ${e.message}',
        e,
        stackTrace,
      );
      emit(AuthError(message: e.message, code: e.code));
    } catch (e, stackTrace) {
      _error('Password reset failed for ${event.email}: $e', e, stackTrace);
      emit(AuthError(message: 'An unexpected error occurred'));
    }
  }

  @override
  Future<void> close() async {
    await _authStateSubscription.cancel();
    return super.close();
  }
}
