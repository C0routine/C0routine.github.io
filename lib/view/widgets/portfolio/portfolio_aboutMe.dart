import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/screen_case.dart';
import 'package:blog/models/data/data_strings.dart';

class PortfolioAboutMe extends StatefulWidget {
  const PortfolioAboutMe({super.key});

  @override
  State<PortfolioAboutMe> createState() => _PortfolioAboutMeState();
}

class _PortfolioAboutMeState extends State<PortfolioAboutMe> {
  @override
  Widget build(BuildContext context) {
    // mode 0: mobile, 1:tablet, 2:desktop
    aboutMeTitle(int mode) => Text(DataStrings.aboutMeTitle,
        style: AppStyle.titleText(mode == 0
                ? 35
                : mode == 1
                    ? 55
                    : 70)
            .copyWith(color: AppColor.textBlack));

    // mode 0: mobile, 1:tablet, 2:desktop
    aboutMeText(int mode, String text) => Text(text,
        style: AppStyle.normalText(mode == 0
                ? 15
                : mode == 1
                    ? 20
                    : 26)
            .copyWith(color: AppColor.textBlack));

    // mode 0: mobile, 1:tablet, 2:desktop
    aboutMeBody(int mode) {
      return Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(left: mode == 1 ? 50 : 75),
          padding: AppStyle.gapLeft,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: mode == 1 ? 5 : 7,
                color: AppColor.backgroundBlack,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              aboutMeTitle(mode),
              const SizedBox(height: 20),
              aboutMeText(mode, DataStrings.aboutMeBody1),
              const SizedBox(height: 15),
              aboutMeText(mode, DataStrings.aboutMeBody2),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
    }

    aboutMeImage() {
      return Expanded(
        flex: 1,
        child: Transform.rotate(
          angle: (math.pi / 3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: Image.network(
              DataStrings.aboutMeImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    // mode 0: mobile, 1:tablet, 2:desktop
    aboutMeBuild(int mode) {
      return ClipRRect(
        child: Container(
          color: AppColor.backgroundWhite,
          child: mode != 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    aboutMeBody(mode),
                    aboutMeImage(),
                  ],
                )

              /// AboutMe Mobile Build
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      DataStrings.aboutMeImage2,
                      fit: BoxFit.cover,
                      width: 450,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: AppStyle.gapAll,
                      padding: AppStyle.gapLeft,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            width: 3,
                            color: AppColor.backgroundBlack,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          aboutMeTitle(mode),
                          const SizedBox(height: 20),
                          aboutMeText(mode, DataStrings.aboutMeBody1),
                          const SizedBox(height: 10),
                          aboutMeText(mode, DataStrings.aboutMeBody2),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: AppStyle.getSize(context).height,
      ),
      child: ScreenCase(
        mobile: aboutMeBuild(0),
        tablet: aboutMeBuild(1),
        desktop: aboutMeBuild(2),
      ),
    );
  }
}
