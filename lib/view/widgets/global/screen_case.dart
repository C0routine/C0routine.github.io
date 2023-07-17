import 'package:flutter/material.dart';

/// 현재 화면 크기 상태
enum ScreenStatus {mobile, tablet, desktop}

/// 현재 화면 크기에(mobile, tablet, desktop) 맞게 UI Render
class ScreenCase extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenCase({super.key, required this.mobile, required this.tablet, required this.desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 720) {
          return mobile;
        }

        if (constraints.maxWidth < 1280) {
          return tablet;
        }

        return desktop;
      },
    );
  }
}
