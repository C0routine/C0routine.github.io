import 'package:flutter/material.dart';

class AppColor {
  static final AppColor _instance = AppColor._init();

  factory AppColor() {
    return _instance;
  }

  AppColor._init();

  static const Color white = Color.fromRGBO(255, 255, 255, 1); // Color(0xFFFFFFFF);
  static const Color black = Color.fromRGBO(0, 0, 0, 1); // Color(0xFF000000);

  static const Color backgroundWhite = Color(0xFFFFFFFF);
  static const Color backgroundBlack = Color(0xFF111111);

  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF111111);

  static const Color background = Color(0xFFE6F7FF);
  static const Color backgroundSub = Color(0xFFDCEDF5);

  static const Color text = Color(0xFF333333);
  static const Color icons = Color(0xFF87CEEB);
  static const Color accent = Color(0xFF00BFFF);

  static const Color disable = Color(0xFF555555);
}