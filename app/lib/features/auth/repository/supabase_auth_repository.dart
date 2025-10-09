import 'package:meditation_companion/core/logging/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../models/user_model.dart';
import 'auth_repository.dart';
import '../exceptions/auth_exception.dart';

class SupabaseAuthRepository implements AuthRepository {
  final supabase.SupabaseClient _supabase;

  static const _domain = 'Auth';
  static const _featureRepository = 'Supabase Auth';

  void _debug(String message) {
    logDebug(
      message,
      domain: _domain,
      feature: _featureRepository,
      context: SupabaseAuthRepository,
    );
  }

  void _info(String message) {
    logInfo(
      message,
      domain: _domain,
      feature: _featureRepository,
      context: SupabaseAuthRepository,
    );
  }

  Never _rethrow(String message, Object error, StackTrace stackTrace) {
    logError(
      message,
      domain: _domain,
      feature: _featureRepository,
      error: error,
      stackTrace: stackTrace,
      context: SupabaseAuthRepository,
    );
    if (error is AuthException) {
      throw error;
    }
    throw AuthException(message: message);
  }

  SupabaseAuthRepository(this._supabase);

  User _mapSupabaseUser(supabase.User supabaseUser) {
    return User(
      id: supabaseUser.id,
      email: supabaseUser.email ?? '',
      emailVerifiedAt: supabaseUser.emailConfirmedAt != null
          ? DateTime.parse(supabaseUser.emailConfirmedAt!)
          : null,
      createdAt: supabaseUser.createdAt != null
          ? DateTime.parse(supabaseUser.createdAt!)
          : null,
    );
  }

  @override
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _info('Supabase sign-in started for $email');
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final supabaseUser = response.user;
      if (supabaseUser == null) {
        throw const AuthException(message: 'Sign in failed: No user returned');
      }
      _info('Supabase sign-in succeeded for $email');
      return _mapSupabaseUser(supabaseUser);
    } catch (error, stackTrace) {
      _rethrow('Sign in failed: ${error.toString()}', error, stackTrace);
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      _info('Supabase sign-up started for $email');
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      final supabaseUser = response.user;
      if (supabaseUser == null) {
        throw const AuthException(message: 'Sign up failed: No user returned');
      }
      _info('Supabase sign-up succeeded for $email');
      return _mapSupabaseUser(supabaseUser);
    } catch (error, stackTrace) {
      _rethrow('Sign up failed: ${error.toString()}', error, stackTrace);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      _info('Supabase password reset requested for $email');
      await _supabase.auth.resetPasswordForEmail(email);
      _info('Supabase password reset email dispatched for $email');
    } catch (error, stackTrace) {
      _rethrow(
        'Password reset failed: ${error.toString()}',
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      _info('Supabase sign-out started');
      await _supabase.auth.signOut();
      _info('Supabase sign-out completed');
    } catch (error, stackTrace) {
      _rethrow('Sign out failed: ${error.toString()}', error, stackTrace);
    }
  }

  @override
  Stream<User?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map((data) {
      final supabaseUser = data.session?.user;
      if (supabaseUser != null) {
        _debug('Auth state change -> user=${supabaseUser.email ?? supabaseUser.id}');
        return _mapSupabaseUser(supabaseUser);
      }
      _debug('Auth state change -> signed out');
      return null;
    });
  }

  @override
  User? get currentUser {
    final supabaseUser = _supabase.auth.currentUser;
    if (supabaseUser != null) {
      _debug('currentUser resolved user=${supabaseUser.email ?? supabaseUser.id}');
      return _mapSupabaseUser(supabaseUser);
    }
    _debug('currentUser resolved null');
    return null;
  }
}
