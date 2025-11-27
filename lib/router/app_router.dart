import 'package:go_router/go_router.dart';

import '../features/auth/presentation/login_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

bool isLoggedIn = false;

String normalizeIncomingUri(Uri u) {
  if (!u.hasScheme) {
    return u.toString();
  }
  final isHttp = u.scheme == 'http' || u.scheme == 'https';
  if (isHttp) {
    final path = u.path.isEmpty ? '/' : u.path;
    return Uri(path: path, queryParameters: u.queryParameters.isEmpty ? null : u.queryParameters).toString();
  }
  final segments = <String>[];
  if (u.host.isNotEmpty) {
    segments.add(u.host);
  }
  segments.addAll(u.pathSegments.where((s) => s.isNotEmpty));
  final path = '/${segments.join('/')}';
  return Uri(path: path, queryParameters: u.queryParameters.isEmpty ? null : u.queryParameters).toString();
}

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final normalized = normalizeIncomingUri(state.uri);
    if (normalized != state.uri.toString()) {
      return normalized;
    }
    final isProfileRoute = state.matchedLocation.startsWith('/profile/');
    if (isProfileRoute && !isLoggedIn) {
      final from = Uri.encodeComponent(state.uri.toString());
      return '/login?from=$from';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'profile/:id',
          name: 'profile',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ProfileScreen(profileId: id);
          },
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    ),
  ],
);