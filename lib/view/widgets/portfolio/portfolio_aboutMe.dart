import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/app_widget.dart';
import 'package:blog/models/data/data_strings.dart';

class PortfolioAboutMe extends StatefulWidget {
  const PortfolioAboutMe({super.key, required this.aboutMeImageOpacity});

  final double aboutMeImageOpacity;

  @override
  State<PortfolioAboutMe> createState() => _PortfolioAboutMeState();
}

class _PortfolioAboutMeState extends State<PortfolioAboutMe> {
  @override
  Widget build(BuildContext context) {
    aboutMeBody(int mode) {
      return Container(
        margin: mode == 0 ? AppStyle.gapAll : EdgeInsets.only(left: mode == 1 ? 50 : 75),
        padding: AppStyle.gapLeft,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              width: <double>[3, 5, 7][mode],
              color: AppColor.backgroundBlack,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DataStrings.aboutMeTitle,
              style: AppStyle.titleText(<double>[35, 55, 70][mode], false),
            ),
            const SizedBox(height: 20),
            Text(
              DataStrings.aboutMeBody1,
              style: AppStyle.normalText(<double>[15, 20, 25][mode], false),
            ),
            const SizedBox(height: 10),
            Text(
              DataStrings.aboutMeBody2,
              style: AppStyle.normalText(<double>[15, 20, 25][mode], false),
            ),

            // career
            const SizedBox(height: 50),
            Text(
              DataStrings.careerTitle,
              style: AppStyle.titleText(<double>[25, 35, 45][mode], false),
            ),
            const SizedBox(height: 10),
            Text(
              DataStrings.careerDate,
              style: AppStyle.normalText(<double>[20, 25, 30][mode], false),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: DataStrings.careerBody1,
                style: AppStyle.normalText(<double>[15, 20, 25][mode], false),
                children: <TextSpan>[
                  TextSpan(
                    text: DataStrings.careerBody2,
                    style: AppStyle.titleText(<double>[16, 21, 26][mode], false).copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final Uri url = Uri.parse(DataStrings.careerUrl1);
                        await launchUrl(url);
                        // if (await launchUrl(url)) {
                        //   throw Exception('Could not launch $url');
                        // }
                      },
                  ),
                  TextSpan(
                    text: DataStrings.careerBody3,
                    style: AppStyle.normalText(<double>[15, 20, 25][mode], false),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    aboutMeBuild(int mode) {
      return ClipRRect(
        child: Container(
          color: AppColor.backgroundWhite,
          child: mode != 0
              // tablet, desktop build
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1, child: aboutMeBody(mode)),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: Transform.rotate(
                        angle: (math.pi / 3),
                        child: ClipRRect(
                          borderRadius: AppStyle.borderRadiusHard,
                          child: AnimatedOpacity(
                            opacity: widget.aboutMeImageOpacity,
                            duration: const Duration(milliseconds: 2600),
                            curve: Curves.decelerate,
                            child: Image.network(
                              DataStrings.aboutMeImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              // AboutMe Mobile build
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: widget.aboutMeImageOpacity,
                      duration: const Duration(milliseconds: 2600),
                      curve: Curves.decelerate,
                      child: Image.network(
                        DataStrings.aboutMeImage2,
                        fit: BoxFit.cover,
                        width: 450,
                      ),
                    ),
                    const SizedBox(height: 20),
                    aboutMeBody(mode),
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
      // mode 0: mobile, 1:tablet, 2:desktop
      child: ScreenCase(
        mobile: aboutMeBuild(0),
        tablet: aboutMeBuild(1),
        desktop: aboutMeBuild(2),
      ),
    );
  }
}
