import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/view/widgets/global/screen_case.dart';

class PortfolioProject extends StatefulWidget {
  const PortfolioProject({super.key});

  @override
  State<PortfolioProject> createState() => _PortfolioProjectState();
}

class _PortfolioProjectState extends State<PortfolioProject> {
  @override
  Widget build(BuildContext context) {
    // mode 0: mobile, 1:tablet, 2:desktop
    projectBuild(int mode) {
      return Container(
        color: AppColor.backgroundBlack,
        child: Column(
          children: [

          ],
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ScreenCase(
        mobile: projectBuild(0),
        tablet: projectBuild(1),
        desktop: projectBuild(2),
      ),
    );
  }
}
