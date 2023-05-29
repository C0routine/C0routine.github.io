import 'package:flutter/cupertino.dart';

class AppStyle {
  static final AppStyle _appStyle = AppStyle._init();

  AppStyle._init();

  factory AppStyle() {
    return _appStyle;
  }

  static const EdgeInsets gapTop = EdgeInsets.only(top: 20);
  static const EdgeInsets gapBottom = EdgeInsets.only(bottom: 20);
  static const EdgeInsets gapLeft = EdgeInsets.only(left: 20);
  static const EdgeInsets gapRight = EdgeInsets.only(right: 20);
  static const EdgeInsets gapVertical = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets gapHorizontal = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets gapAll = EdgeInsets.all(20);

  static const borderRadius = Border();
}
