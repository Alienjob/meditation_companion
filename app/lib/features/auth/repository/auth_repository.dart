import 'package:meditation_companion/features/auth/models/user_model.dart';

abstract class AuthRepository {
  /// Stream of authentication state changes
  Stream<User?> get authStateChanges;

  /// Get the current authenticated user
  User? get currentUser;

  /// Sign in with email and password
  ///
  /// Throws [AuthException] if sign in fails
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign up with email and password
  ///
  /// Throws [AuthException] if sign up fails
  Future<User> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Send password reset email
  ///
  /// Throws [AuthException] if the operation fails
  Future<void> sendPasswordResetEmail(String email);

  /// Sign out the current user
  ///
  /// Throws [AuthException] if sign out fails
  Future<void> signOut();
}
