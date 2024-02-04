
import 'package:blog/core/constant/app_router.dart';
import 'package:blog/root/view/root_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: AppRouter.root.path,
  routes: [
    GoRoute(
      path: AppRouter.root.path,
      name: AppRouter.root.name,
      builder: (context, state) => const RootScreen(),
      routes: [],
    ),
  ],
);