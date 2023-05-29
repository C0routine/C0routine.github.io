import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: AppColor.darkBackground,
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColor.darkBackground,
      selectedLabelTextStyle: darkTextTheme.bodyMedium,
      unselectedLabelTextStyle: darkTextTheme.bodyMedium,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    titleLarge: TextStyle(fontSize: 48, color: AppColor.darkText),
    titleMedium: TextStyle(fontSize: 32, color: AppColor.darkText),
    bodyMedium: TextStyle(
      fontSize: 17,
      color: AppColor.darkText,
      fontWeight: FontWeight.w400,
    ),
  );
}
