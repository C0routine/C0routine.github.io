import 'package:flutter/cupertino.dart';

class AppStyle {
  static final AppStyle _appStyle = AppStyle._init();

  AppStyle._init();

  factory AppStyle() {
    return _appStyle;
  }

  /// Desktop 상태인지 확인
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }

  /// App Screen Size
  static Size getSize(BuildContext context){
    return MediaQuery.of(context).size;
  }

  /// width 의 퍼센트 사이즈 [size] 0.0 ~ 1.0 값만 사용.
  static double widthPercent(BuildContext context, double size) {
    if(size < 0.0 || size > 1.0) return 0.0;
    return MediaQuery.of(context).size.width * size;
  }

  static const EdgeInsets gapBottom = EdgeInsets.only(bottom: 20);
  static const EdgeInsets gapLeft = EdgeInsets.only(left: 20);
  static const EdgeInsets gapRight = EdgeInsets.only(right: 20);
  static const EdgeInsets gapVertical = EdgeInsets.symmetric(vertical: 20);

  static const EdgeInsets gapAll = EdgeInsets.all(16);
  static const EdgeInsets gapTop = EdgeInsets.only(top: 16);
  static const EdgeInsets gapHorizontal = EdgeInsets.symmetric(horizontal: 16);

  // static const EdgeInsets

  static const double iconSize = 26;

  static final BorderRadius borderRadius = BorderRadius.circular(16);
}
