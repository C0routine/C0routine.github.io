import 'package:go_router/go_router.dart';

import 'package:blog/view/screens/portfolio/portfolio.dart';
import 'package:blog/view/screens/root_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/portfolio',
  routes: [
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const Portfolio(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const RootScreen(),
    ),
  ],
);
