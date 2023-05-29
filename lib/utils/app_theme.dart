import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';

class AppTheme {
  static ThemeData responsive(bool isExtend) {
    return ThemeData(
      useMaterial3: true,
      textTheme: isExtend ? desktopTextTheme : mobileTextTheme,
      scaffoldBackgroundColor: AppColor.background,
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: AppColor.background,
        selectedLabelTextStyle: isExtend ? desktopTextTheme.bodyMedium : mobileTextTheme.bodyMedium,
        unselectedLabelTextStyle: isExtend ? desktopTextTheme.bodyMedium : mobileTextTheme.bodyMedium,
      ),
    );
  }

  static const TextTheme desktopTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 17,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );

  static const TextTheme mobileTextTheme = TextTheme(
    bodyMedium: TextStyle(
      fontSize: 12,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
  );
}
