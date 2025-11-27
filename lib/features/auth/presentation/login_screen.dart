import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../router/app_router.dart';

class LoginScreen extends StatelessWidget {
  final String? redirectTo;
  const LoginScreen({super.key, this.redirectTo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            isLoggedIn = true;
            final to = redirectTo ?? '/';
            context.go(to);
          },
          child: const Text('Mock Login'),
        ),
      ),
    );
  }
}