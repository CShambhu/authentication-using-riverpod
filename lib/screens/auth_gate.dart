import 'package:authentication_app/providers/auth_provider.dart';
import 'package:authentication_app/screens/home_screen.dart';
import 'package:authentication_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    if (authState.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (authState.hasError) {
      return Scaffold(body: Center(child: Text(authState.error.toString())));
    }

    final user = authState.value;

    if (user == null) {
      return const LoginScreen();
    }

    return const HomeScreen();
  }
}
