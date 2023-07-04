import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColor.background,
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColor.backgroundSub,
      ),
    );
  }

  static const TextTheme textTheme = TextTheme(
    // UI Text
    titleLarge: TextStyle(
      fontSize: 35,
      color: AppColor.text,
      fontWeight: FontWeight.w900,
    ),
    // 소제목
    titleSmall: TextStyle(
      fontSize: 25,
      color: AppColor.text,
      fontWeight: FontWeight.w700,
    ),
    // 일반 크기
    bodyMedium: TextStyle(
      fontSize: 20,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );
}
