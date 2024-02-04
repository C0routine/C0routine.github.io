import 'package:flutter/material.dart';

import 'package:blog/core/constant/app_color.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      scaffoldBackgroundColor: AppColor.black,
    );
  }

  static const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 100,
      color: AppColor.textWhite,
      fontWeight: FontWeight.w900,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      color: AppColor.text,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      color: AppColor.text,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );
}
