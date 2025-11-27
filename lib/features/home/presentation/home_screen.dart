import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _testDeepLink() async {
    final uri = Uri.parse('astrodevs:///profile/42');
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/profile/42'),
              child: const Text('Go to Profile 42 (in-app)'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _testDeepLink,
              child: const Text('Test deep link (astrodevs:///profile/42)'),
            ),
          ],
        ),
      ),
    );
  }
}