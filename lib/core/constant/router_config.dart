
import 'package:blog/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/portfolio',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);