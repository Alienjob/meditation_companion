import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:meditation_companion/features/auth/models/user_model.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/auth/bloc/auth_state.dart';
import 'package:meditation_companion/features/auth/repository/auth_repository.dart';
import 'package:meditation_companion/features/auth/exceptions/auth_exception.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue('test@example.com');
    registerFallbackValue('password');
  });

  group('AuthBloc', () {
    late MockAuthRepository authRepository;
    late AuthBloc bloc;
    late StreamController<User?> authStateController;

    setUp(() {
      authRepository = MockAuthRepository();
      authStateController = StreamController<User?>.broadcast();

      // Setup mock repository
      when(() => authRepository.authStateChanges)
          .thenAnswer((_) => authStateController.stream);
      when(() => authRepository.currentUser).thenReturn(null);

      bloc = AuthBloc(authRepository: authRepository);
    });

    tearDown(() async {
      await authStateController.close();
      await bloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(bloc.state, isA<AuthInitial>());
    });

    test('emits [Authenticated] when checking auth status with logged in user',
        () {
      // Arrange
      final user = User(id: '1', email: 'test@example.com');
      when(() => authRepository.currentUser).thenReturn(user);

      // Act & Assert
      bloc.add(AuthCheckRequested());
      expect(
        bloc.stream,
        emits(isA<Authenticated>()
            .having((s) => s.user.id, 'user.id', user.id)
            .having((s) => s.user.email, 'user.email', user.email)),
      );
    });

    test('emits [Unauthenticated] when checking auth status with no user', () {
      // Arrange
      when(() => authRepository.currentUser).thenReturn(null);

      // Act & Assert
      bloc.add(AuthCheckRequested());
      expect(bloc.stream, emits(isA<Unauthenticated>()));
    });

    test(
        'emits [AuthLoading, Authenticated] when SignInRequested is successful',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'password';
      final user = User(id: '1', email: email);

      when(() => authRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => user);

      // Act & Assert
      bloc.add(SignInRequested(email: email, password: password));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<Authenticated>()
              .having((s) => s.user.id, 'user.id', user.id)
              .having((s) => s.user.email, 'user.email', user.email),
        ]),
      );
    });

    test(
        'emits [AuthLoading, AuthError] when SignInRequested fails with invalid credentials',
        () async {
      // Arrange
      const email = 'test@example.com';
      const password = 'wrong_password';
      final error = AuthException(message: 'Invalid credentials');

      when(() => authRepository.signInWithEmailAndPassword(
            email: email,
            password: password,
          )).thenThrow(error);

      // Act & Assert
      bloc.add(SignInRequested(email: email, password: password));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthError>().having((s) => s.message, 'message', error.message),
        ]),
      );
    });

    test(
        'emits [AuthLoading, Authenticated] when SignUpRequested is successful',
        () async {
      // Arrange
      const email = 'new@example.com';
      const password = 'password';
      final user = User(id: '1', email: email);

      when(() => authRepository.signUpWithEmailAndPassword(
            email: email,
            password: password,
          )).thenAnswer((_) async => user);

      // Act & Assert
      bloc.add(SignUpRequested(email: email, password: password));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<Authenticated>()
              .having((s) => s.user.id, 'user.id', user.id)
              .having((s) => s.user.email, 'user.email', user.email),
        ]),
      );
    });

    test(
        'emits [AuthLoading, AuthError] when SignUpRequested fails with existing email',
        () async {
      // Arrange
      const email = 'existing@example.com';
      const password = 'password';
      final error = AuthException(message: 'Email already exists');

      when(() => authRepository.signUpWithEmailAndPassword(
            email: email,
            password: password,
          )).thenThrow(error);

      // Act & Assert
      bloc.add(SignUpRequested(email: email, password: password));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthError>().having((s) => s.message, 'message', error.message),
        ]),
      );
    });

    test(
        'emits [AuthLoading, Unauthenticated] when SignOutRequested is successful',
        () async {
      // Arrange
      when(() => authRepository.signOut()).thenAnswer((_) async => {});

      // Act & Assert
      bloc.add(SignOutRequested());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<Unauthenticated>(),
        ]),
      );
    });

    test('emits [AuthLoading, AuthError] when SignOutRequested fails',
        () async {
      // Arrange
      final error = AuthException(message: 'Failed to sign out');
      when(() => authRepository.signOut()).thenThrow(error);

      // Act & Assert
      bloc.add(SignOutRequested());
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthError>().having((s) => s.message, 'message', error.message),
        ]),
      );
    });

    test(
        'emits [AuthLoading, PasswordResetEmailSent] when PasswordResetRequested is successful',
        () async {
      // Arrange
      const email = 'test@example.com';
      when(() => authRepository.sendPasswordResetEmail(email))
          .thenAnswer((_) async => {});

      // Act & Assert
      bloc.add(PasswordResetRequested(email: email));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<PasswordResetEmailSent>().having((s) => s.email, 'email', email),
        ]),
      );
    });

    test(
        'emits [AuthLoading, AuthError] when PasswordResetRequested fails with non-existent email',
        () async {
      // Arrange
      const email = 'nonexistent@example.com';
      final error = AuthException(message: 'User not found');

      when(() => authRepository.sendPasswordResetEmail(email)).thenThrow(error);

      // Act & Assert
      bloc.add(PasswordResetRequested(email: email));
      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<AuthLoading>(),
          isA<AuthError>().having((s) => s.message, 'message', error.message),
        ]),
      );
    });

    group('auth state changes', () {
      test('emits Authenticated when auth provider reports signed in user',
          () async {
        // Arrange
        final user = User(id: '1', email: 'test@example.com');
        when(() => authRepository.currentUser).thenReturn(user);

        // Act
        authStateController.add(user);

        // Assert
        await expectLater(
          bloc.stream,
          emits(isA<Authenticated>()
              .having((s) => s.user.id, 'user.id', user.id)
              .having((s) => s.user.email, 'user.email', user.email)),
        );
      });

      test('emits Unauthenticated when auth provider reports signed out',
          () async {
        // Arrange
        when(() => authRepository.currentUser).thenReturn(null);

        // Act
        authStateController.add(null);

        // Assert
        await expectLater(
          bloc.stream,
          emits(isA<Unauthenticated>()),
        );
      });
    });
  });
}
