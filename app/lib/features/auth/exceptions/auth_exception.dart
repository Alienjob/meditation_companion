/// Exception thrown when authentication operations fail
class AuthException implements Exception {
  final String message;
  final String? code;

  const AuthException({
    required this.message,
    this.code,
  });

  factory AuthException.invalidCredentials() {
    return const AuthException(
      message: 'Invalid email or password',
      code: 'invalid-credentials',
    );
  }

  factory AuthException.emailAlreadyInUse() {
    return const AuthException(
      message: 'Email is already registered',
      code: 'email-already-in-use',
    );
  }

  factory AuthException.weakPassword() {
    return const AuthException(
      message: 'Password is too weak',
      code: 'weak-password',
    );
  }

  factory AuthException.userNotFound() {
    return const AuthException(
      message: 'No user found with this email',
      code: 'user-not-found',
    );
  }

  factory AuthException.networkError() {
    return const AuthException(
      message: 'Network error occurred. Please check your connection.',
      code: 'network-error',
    );
  }

  @override
  String toString() =>
      'AuthException: $message${code != null ? ' ($code)' : ''}';
}
