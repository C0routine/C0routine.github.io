import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData main = ThemeData(
    useMaterial3: true,
    textTheme: mainTextTheme,
    scaffoldBackgroundColor: AppColor.background,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColor.background,
      selectedLabelTextStyle: mainTextTheme.bodyMedium,
      unselectedLabelTextStyle: mainTextTheme.bodyMedium,
    ),
  );

  static TextTheme mainTextTheme = const TextTheme(
    titleLarge: TextStyle(fontSize: 48, color: AppColor.text),
    titleMedium: TextStyle(fontSize: 32, color: AppColor.text),
    titleSmall: TextStyle(
      fontSize: 24,
      color: AppColor.text,
    ),
    bodyMedium: TextStyle(
      fontSize: 17,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );
}
