import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:blog/core/constant/app_color.dart';
import 'package:blog/core/models/data/data_strings.dart';
import 'package:blog/history/components/first/first_blog_app_style.dart';
import 'package:blog/history/components/first/first_blog_screen_case.dart';

class FirstBlogAboutMe extends StatefulWidget {
  const FirstBlogAboutMe({super.key, required this.aboutMeImageOpacity});

  final double aboutMeImageOpacity;

  @override
  State<FirstBlogAboutMe> createState() => _FirstBlogAboutMeState();
}

class _FirstBlogAboutMeState extends State<FirstBlogAboutMe> {
  @override
  Widget build(BuildContext context) {
    aboutMeBody(int mode) {
      return Container(
        margin: mode == 0 ? FirstBlogAppStyle.gapAll : EdgeInsets.only(left: mode == 1 ? 50 : 75),
        padding: FirstBlogAppStyle.gapLeft,
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
              style: FirstBlogAppStyle.titleText(<double>[35, 55, 70][mode], false),
            ),
            const SizedBox(height: 20),
            Text(
              DataStrings.aboutMeBody1,
              style: FirstBlogAppStyle.normalText(<double>[15, 20, 25][mode], false),
            ),
            const SizedBox(height: 10),
            Text(
              DataStrings.aboutMeBody2,
              style: FirstBlogAppStyle.normalText(<double>[15, 20, 25][mode], false),
            ),

            // career
            const SizedBox(height: 50),
            Text(
              DataStrings.careerTitle,
              style: FirstBlogAppStyle.titleText(<double>[25, 35, 45][mode], false),
            ),
            const SizedBox(height: 10),
            Text(
              DataStrings.careerDate,
              style: FirstBlogAppStyle.normalText(<double>[20, 25, 30][mode], false),
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: DataStrings.careerBody1,
                style: FirstBlogAppStyle.normalText(<double>[15, 20, 25][mode], false),
                children: <TextSpan>[
                  TextSpan(
                    text: DataStrings.careerBody2,
                    style: FirstBlogAppStyle.titleText(<double>[16, 21, 26][mode], false).copyWith(
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
                    style: FirstBlogAppStyle.normalText(<double>[15, 20, 25][mode], false),
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
                          borderRadius: FirstBlogAppStyle.borderRadiusHard,
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
        minHeight: FirstBlogAppStyle.getSize(context).height,
      ),
      // mode 0: mobile, 1:tablet, 2:desktop
      child: FirstBlogScreenCase(
        mobile: aboutMeBuild(0),
        tablet: aboutMeBuild(1),
        desktop: aboutMeBuild(2),
      ),
    );
  }
}
