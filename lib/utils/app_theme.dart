import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: AppColor.background,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColor.background,
      selectedLabelTextStyle: darkTextTheme.bodyMedium,
      unselectedLabelTextStyle: darkTextTheme.bodyMedium,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    titleLarge: TextStyle(fontSize: 48, color: AppColor.text),
    titleMedium: TextStyle(fontSize: 32, color: AppColor.text),
    bodyMedium: TextStyle(
      fontSize: 17,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );
}
