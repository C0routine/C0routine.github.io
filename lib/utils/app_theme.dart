import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';

// TODO Mobile 환경 size 재조정 필요
class AppTheme {
  static ThemeData responsive(bool isExtend) {
    return ThemeData(
      useMaterial3: true,
      textTheme: isExtend ? desktopTextTheme : mobileTextTheme,
      scaffoldBackgroundColor: AppColor.background,
      navigationRailTheme: NavigationRailThemeData(
        useIndicator: true,
        indicatorColor: Colors.transparent,
        backgroundColor: AppColor.background,
        selectedLabelTextStyle: isExtend ? desktopTextTheme.titleSmall : mobileTextTheme.bodyMedium,
        selectedIconTheme: IconThemeData(color: AppColor.accent, size: isExtend ? 25 : 15),
        unselectedIconTheme: IconThemeData(color: AppColor.disable, size: isExtend ? 22 : 15),
      ),
    );
  }

  static const TextTheme desktopTextTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 48,
      color: AppColor.text,
      fontWeight: FontWeight.w900,
    ),

    // 소제목
    titleSmall: TextStyle(
      fontSize: 18,
      color: AppColor.text,
      fontWeight: FontWeight.w400,
    ),
    // 일반 크기
    bodyMedium: TextStyle(
      fontSize: 15,
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
