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
  static const double iconSize = 26;

  /// Basic Padding, Margin
  static const EdgeInsets gapAll = EdgeInsets.all(16);
  static const EdgeInsets gapTop = EdgeInsets.only(top: 16);
  static const EdgeInsets gapLeft = EdgeInsets.only(left: 16);
  static const EdgeInsets gapRight = EdgeInsets.only(right: 16);
  static const EdgeInsets gapBottom = EdgeInsets.only(bottom: 16);
  static const EdgeInsets gapVertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets gapHorizontal = EdgeInsets.symmetric(horizontal: 16);

  /// Basic Border Radius
  static final BorderRadius borderRadius = BorderRadius.circular(16);
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
