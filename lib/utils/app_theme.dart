
import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: darkTextTheme,
    scaffoldBackgroundColor: AppColor.background,
  );

  static TextTheme darkTextTheme = const TextTheme(
    titleMedium: TextStyle(fontSize: 20, color: AppColor.white),
  );
}