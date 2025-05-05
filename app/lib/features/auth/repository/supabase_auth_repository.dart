import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import '../models/user_model.dart';
import 'auth_repository.dart';
import '../exceptions/auth_exception.dart';

class SupabaseAuthRepository implements AuthRepository {
  final supabase.SupabaseClient _supabase;

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
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final supabaseUser = response.user;
      if (supabaseUser == null) {
        throw const AuthException(message: 'Sign in failed: No user returned');
      }
      return _mapSupabaseUser(supabaseUser);
    } catch (error) {
      throw AuthException(message: 'Sign in failed: ${error.toString()}');
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      final supabaseUser = response.user;
      if (supabaseUser == null) {
        throw const AuthException(message: 'Sign up failed: No user returned');
      }
      return _mapSupabaseUser(supabaseUser);
    } catch (error) {
      throw AuthException(message: 'Sign up failed: ${error.toString()}');
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (error) {
      throw AuthException(
          message: 'Password reset failed: ${error.toString()}');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (error) {
      throw AuthException(message: 'Sign out failed: ${error.toString()}');
    }
  }

  @override
  Stream<User?> get authStateChanges {
    return _supabase.auth.onAuthStateChange.map((data) {
      final supabaseUser = data.session?.user;
      if (supabaseUser != null) {
        return _mapSupabaseUser(supabaseUser);
      }
      return null;
    });
  }

  @override
  User? get currentUser {
    final supabaseUser = _supabase.auth.currentUser;
    if (supabaseUser != null) {
      return _mapSupabaseUser(supabaseUser);
    }
    return null;
  }
}
