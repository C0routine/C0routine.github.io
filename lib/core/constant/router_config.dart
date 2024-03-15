
import 'package:blog/core/constant/app_router.dart';
import 'package:blog/home/view/home_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: AppRouter.home.path,
  routes: [
    GoRoute(
      path: AppRouter.home.path,
      name: AppRouter.home.name,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: AppRouter.history.subPath,
          name: AppRouter.history.name,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    ),
  ],
);
