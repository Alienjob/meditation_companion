import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_event.dart';
import 'package:meditation_companion/features/auth/bloc/auth_state.dart';
import 'package:meditation_companion/features/auth/models/user_model.dart';
import 'package:meditation_companion/features/auth/repository/mock_auth_repository.dart';

void main() {
  group('AuthBloc', () {
    late MockAuthRepository authRepository;
    late AuthBloc authBloc;

    setUp(() {
      authRepository = MockAuthRepository();
      authBloc = AuthBloc(authRepository: authRepository);
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is AuthInitial', () {
      expect(authBloc.state, isA<AuthInitial>());
    });

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when SignInRequested is successful',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100), // Wait for mock delay
      act: (bloc) => bloc.add(
        const SignInRequested(
          email: 'test@example.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<Authenticated>(),
      ],
      verify: (bloc) {
        final state = bloc.state as Authenticated;
        expect(state.user.email, equals('test@example.com'));
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when SignInRequested fails with invalid credentials',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(
        const SignInRequested(
          email: 'test@example.com',
          password: 'wrongpassword',
        ),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
      verify: (bloc) {
        final state = bloc.state as AuthError;
        expect(state.code, equals('invalid-credentials'));
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when SignUpRequested is successful',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(
        const SignUpRequested(
          email: 'new@example.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<Authenticated>(),
      ],
      verify: (bloc) {
        final state = bloc.state as Authenticated;
        expect(state.user.email, equals('new@example.com'));
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when SignUpRequested fails with existing email',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(
        const SignUpRequested(
          email: 'test@example.com',
          password: 'password123',
        ),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
      verify: (bloc) {
        final state = bloc.state as AuthError;
        expect(state.code, equals('email-already-in-use'));
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when SignOutRequested is successful',
      build: () => authBloc,
      seed: () => Authenticated(
        User(
          id: 'test-id',
          email: 'test@example.com',
        ),
      ),
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(SignOutRequested()),
      expect: () => [
        isA<AuthLoading>(),
        isA<Unauthenticated>(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, PasswordResetEmailSent] when PasswordResetRequested is successful',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(
        const PasswordResetRequested(email: 'test@example.com'),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<PasswordResetEmailSent>(),
      ],
      verify: (bloc) {
        final state = bloc.state as PasswordResetEmailSent;
        expect(state.email, equals('test@example.com'));
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when PasswordResetRequested fails with non-existent email',
      build: () => authBloc,
      wait: const Duration(milliseconds: 1100),
      act: (bloc) => bloc.add(
        const PasswordResetRequested(email: 'nonexistent@example.com'),
      ),
      expect: () => [
        isA<AuthLoading>(),
        isA<AuthError>(),
      ],
      verify: (bloc) {
        final state = bloc.state as AuthError;
        expect(state.code, equals('user-not-found'));
      },
    );
  });
}
