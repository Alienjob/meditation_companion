import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_bloc.dart';
import 'package:meditation_companion/features/auth/bloc/auth_state.dart';
import 'package:meditation_companion/features/auth/views/login_screen.dart';
import 'package:meditation_companion/features/meditation/views/meditation_session_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        // Show loading indicator while checking auth state
        if (state is AuthInitial || state is AuthLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (state is Authenticated) {
          return const MeditationSessionScreen();
        }

        // Default to login screen for unauthenticated, error, or post-reset states
        return const LoginScreen();
      },
    );
  }
}
