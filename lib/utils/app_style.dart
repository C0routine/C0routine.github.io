import 'package:flutter/material.dart';
import 'package:blog/utils/app_color.dart';

/// App 에서 사용하는 Style 정의
class AppStyle {
  static final AppStyle _appStyle = AppStyle._init();

  AppStyle._init();

  factory AppStyle() {
    return _appStyle;
  }

  /// App Screen Size
  static Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Responsive Mobile 화면 대응
  static double reactiveSize(double size, context) {
    if (getSize(context).width < 720) {
      return (getSize(context).width / 720 * size).ceilToDouble();
    }
    return size;
  }

  /// Basic Size
  static const double basic = 16;
  static const double mediumSize = 32;
  static const double iconSize = 26;

  /// Basic Padding, Margin
  static const EdgeInsets gapAll = EdgeInsets.all(basic);
  static const EdgeInsets gapTop = EdgeInsets.only(top: basic);
  static const EdgeInsets gapLeft = EdgeInsets.only(left: basic);
  static const EdgeInsets gapRight = EdgeInsets.only(right: basic);
  static const EdgeInsets gapBottom = EdgeInsets.only(bottom: basic);
  static const EdgeInsets gapVertical = EdgeInsets.symmetric(vertical: basic);
  static const EdgeInsets gapHorizontal = EdgeInsets.symmetric(horizontal: basic);

  /// Basic Border Radius
  static final BorderRadius borderRadius = BorderRadius.circular(basic);
  static final BorderRadius borderRadiusHard = BorderRadius.circular(48);

  /// Basic Title TextStyle
  /// [size] FontSize, [white] fontColor white = true, dark = false
  static TextStyle titleText(double size, bool white) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: white ? AppColor.textWhite : AppColor.textBlack,
    );
  }

  /// Basic Normal TextStyle
  /// [size] FontSize, [white] fontColor white = true, dark = false
  static TextStyle normalText(double size, bool white) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: white ? AppColor.textWhite : AppColor.textBlack,
    );
  }
}
