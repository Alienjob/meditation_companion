import 'package:equatable/equatable.dart';
import 'package:meditation_companion/features/auth/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state when the app starts
class AuthInitial extends AuthState {}

/// Loading state during authentication operations
class AuthLoading extends AuthState {}

/// State when user is authenticated
class Authenticated extends AuthState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object> get props => [user];
}

/// State when user is not authenticated
class Unauthenticated extends AuthState {}

/// State when an authentication operation fails
class AuthError extends AuthState {
  final String message;
  final String? code;

  const AuthError({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() => 'AuthError: $message${code != null ? ' ($code)' : ''}';
}

/// State when password reset email is sent successfully
class PasswordResetEmailSent extends AuthState {
  final String email;

  const PasswordResetEmailSent(this.email);

  @override
  List<Object> get props => [email];
}
