import 'package:flutter/material.dart';

import 'package:blog/utils/router.dart';
import 'package:blog/utils/app_theme.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,

      /// TODO Support DarkTheme LightTheme
      theme: AppTheme.main,
    );
  }
}
