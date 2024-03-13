import 'package:flutter/material.dart';

/// 모바일, 태블릿, 데스크탑 화면을 구분하여 보여주는 위젯
/// [mobile] : 모바일 화면
/// [tablet] : 태블릿 화면
/// [desktop] : 데스크탑 화면
/// [backgroundColor] : 배경색
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    this.backgroundColor,
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1500),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 500) {
                return mobile;
              } else if (constraints.maxWidth < 1000) {
                return tablet;
              } else {
                return desktop;
              }
            },
          ),
        ),
      ),
    );
  }
}
