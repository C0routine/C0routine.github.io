import 'package:go_router/go_router.dart';

import 'package:blog/view/screens/root_screen.dart';
import 'package:blog/view/screens/portfolio_screen.dart';

final GoRouter router = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const RootScreen(),
    routes: [
      GoRoute(
        path: 'portfolio',
        builder: (context, state) => const PortfolioScreen(),
      ),
    ],
  ),
]);
