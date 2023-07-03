import 'package:flutter/material.dart';

import 'package:blog/utils/app_theme.dart';
import 'utils/router.dart';

void main() {
  runApp(const BlogApp());
}

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // web tab title
      title: 'C0routine Blog',
      // route
      routerConfig: router,
      // debug Banner hide
      debugShowCheckedModeBanner: false,
      // app theme
      theme: AppTheme.theme(),
    );
  }
}
