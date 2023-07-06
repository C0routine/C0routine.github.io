import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/screen_case.dart';
import 'package:blog/models/data/data_strings.dart';

class PortfolioIntro extends StatefulWidget {
  const PortfolioIntro({super.key});

  @override
  State<PortfolioIntro> createState() => _PortfolioIntroState();
}

class _PortfolioIntroState extends State<PortfolioIntro> {
  @override
  Widget build(BuildContext context) {
    // mode 0: mobile, 1:tablet, 2:desktop
    introTitle(int mode) => Text(DataStrings.introTitle,
        style: AppStyle.titleText(mode == 0
            ? AppStyle.mobileSize(65, context)
            : mode == 1
                ? 85
                : 100));

    introBuild(int mode) {
      return Container(
        color: AppColor.backgroundBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: introTitle(mode)),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: (AppStyle.getSize(context).width / 2)),
              curve: Curves.elasticOut,
              duration: const Duration(milliseconds: 2600),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColor.backgroundWhite,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: AppStyle.mobileSize(7, context),
                  width: value,
                );
              },
            ),
          ],
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: AppStyle.getSize(context).height,
      ),
      child: ScreenCase(
        mobile: introBuild(0),
        tablet: introBuild(1),
        desktop: introBuild(2),
      ),
    );
  }
}
