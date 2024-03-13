import 'package:flutter/material.dart';

/// 모바일, 태블릿, 데스크탑을 구분하여 보여주는 위젯
/// [mobile] : 모바일 화면
/// [tablet] : 태블릿 화면
/// [desktop] : 데스크탑 화면
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 500) {
          return mobile;
        } else if (constraints.maxWidth < 1000) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
