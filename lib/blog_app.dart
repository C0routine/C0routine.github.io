import 'package:flutter/material.dart';
import 'package:blog/utils/app_theme.dart';
import 'package:blog/core/constant/router_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (_ , child) {
        return  MaterialApp.router(
          // web tab title
          title: 'C0routine Blog',
          // route
          routerConfig: routerConfig,
          // debug Banner hide
          debugShowCheckedModeBanner: false,
          // app theme
          theme: AppTheme.theme(),
        );
      },
    );
  }
}
