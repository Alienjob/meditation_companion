import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/repository/mock_auth_repository.dart';
import 'package:meditation_companion/features/auth/views/login_screen.dart';

void main() {
  group('LoginScreen', () {
    late AuthBloc authBloc;
    late Widget testWidget;

    setUp(() {
      authBloc = AuthBloc(authRepository: MockAuthRepository());
      testWidget = MaterialApp(
        home: BlocProvider.value(
          value: authBloc,
          child: const LoginScreen(),
        ),
      );
    });

    tearDown(() {
      authBloc.close();
    });

    testWidgets('shows email and password fields', (tester) async {
      await tester.pumpWidget(testWidget);

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('shows validation errors on empty submit', (tester) async {
      await tester.pumpWidget(testWidget);

      // Find and tap the submit button
      final submitButton = find.byType(ElevatedButton);
      await tester.tap(submitButton);
      await tester.pump();

      // Verify validation errors are shown
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets('toggles between sign in and sign up modes', (tester) async {
      await tester.pumpWidget(testWidget);

      // Initially in sign in mode
      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Need an account? Sign Up'), findsOneWidget);

      // Tap the toggle button
      await tester.tap(find.text('Need an account? Sign Up'));
      await tester.pump();

      // Now in sign up mode
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('Already have an account? Sign In'), findsOneWidget);
    });
  });
}
