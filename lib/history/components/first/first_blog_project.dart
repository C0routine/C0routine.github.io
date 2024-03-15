import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:blog/core/constant/app_color.dart';
import 'package:blog/core/models/data/data_strings.dart';
import 'package:blog/history/components/first/first_blog_app_style.dart';
import 'package:blog/history/components/first/first_blog_screen_case.dart';

class FirstBlogProject extends StatefulWidget {
  const FirstBlogProject({super.key});

  @override
  State<FirstBlogProject> createState() => _FirstBlogProjectState();
}

class _FirstBlogProjectState extends State<FirstBlogProject> {
  @override
  Widget build(BuildContext context) {
    webImageBox(int mode) {
      return Container(
        margin: FirstBlogAppStyle.gapAll,
        constraints: BoxConstraints(maxWidth: mode == 0 ? FirstBlogAppStyle.reactiveSize(600, context) : 800),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2, color: AppColor.backgroundWhite),
          borderRadius: FirstBlogAppStyle.borderRadius,
        ),
        child: ClipRRect(
          borderRadius: FirstBlogAppStyle.borderRadius,
          child: Image.network(DataStrings.projectWebImageUrl, fit: BoxFit.cover),
        ),
      );
    }

    hychargeImageBox(int mode) {
      final List<String> imageUrl = <String>[
        DataStrings.projectHyChargeImageUrl1,
        DataStrings.projectHyChargeImageUrl2,
        DataStrings.projectHyChargeImageUrl3,
        DataStrings.projectHyChargeImageUrl4,
        DataStrings.projectHyChargeImageUrl5,
        DataStrings.projectHyChargeImageUrl6,
        DataStrings.projectHyChargeImageUrl7,
        DataStrings.projectHyChargeImageUrl8,
        DataStrings.projectHyChargeImageUrl9
      ];

      return Container(
        height: 500,
        width: double.infinity,
        margin: FirstBlogAppStyle.gapAll,
        color: Colors.transparent,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrl.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: FirstBlogAppStyle.borderRadius,
              child: Image.network(imageUrl[index], fit: BoxFit.cover),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: FirstBlogAppStyle.basic);
          },
        ),
      );
    }

    githubLink(int mode, String url) {
      return GestureDetector(
        onTap: () async => await launchUrl(Uri.parse(url)),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            DataStrings.projectGithub,
            style: FirstBlogAppStyle.normalText(<double>[20, 25, 30][mode], true).copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColor.textWhite,
            ),
            softWrap: true,
          ),
        ),
      );
    }

    projectInfoText(int mode, List<String> textList) {
      return Container(
        margin: FirstBlogAppStyle.gapHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textList.map((body) {
            return Text(body, style: FirstBlogAppStyle.normalText(<double>[15, 18, 20][mode], true));
          }).toList(),
        ),
      );
    }

    // mode 0: mobile, 1:tablet, 2:desktop
    projectBuild(int mode) {
      return Container(
        color: AppColor.backgroundBlack,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(FirstBlogAppStyle.mediumSize),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(DataStrings.projectTitle, style: FirstBlogAppStyle.titleText(<double>[65, 85, 100][mode], true)),
              ),
            ),
            webImageBox(mode),
            githubLink(mode, DataStrings.projectWebGithubUrl),
            const SizedBox(height: 30),
            projectInfoText(
              mode,
              [
                DataStrings.projectWebBody1,
                DataStrings.projectWebBody2,
                DataStrings.projectWebBody3,
                DataStrings.projectWebBody4,
              ],
            ),
            const SizedBox(height: 100),
            hychargeImageBox(mode),
            githubLink(mode, DataStrings.projectHyChargeGithubUrl),
            const SizedBox(height: 30),
            projectInfoText(
              mode,
              [
                DataStrings.projectHyChargeBody1,
                DataStrings.projectHyChargeBody2,
                DataStrings.projectHyChargeBody3,
                DataStrings.projectHyChargeBody4,
              ],
            ),
            const SizedBox(height: 100),
          ],
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
        mobile: projectBuild(0),
        tablet: projectBuild(1),
        desktop: projectBuild(2),
      ),
    );
  }
}
