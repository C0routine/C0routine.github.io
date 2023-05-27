import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blog/utils/router.dart';
import 'package:blog/utils/app_theme.dart';
import 'package:blog/viewmodel/provider/theme_vm.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,

      /// TODO Support DarkTheme LightTheme
      theme: context.watch<ThemeVM>().light ? AppTheme.dark : AppTheme.dark,
    );
  }
}
