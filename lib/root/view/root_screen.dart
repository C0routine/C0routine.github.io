import 'package:blog/core/component/responsive_layout.dart';
import 'package:blog/core/constant/app_color.dart';
import 'package:blog/root/view/root_desktop.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      backgroundColor: Colors.black,
      mobile: Container(color: Colors.white),
      tablet: Container(color: Colors.red),
      desktop: RootDesktop(),
    );
  }
}
