import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/app_widget.dart';
import 'package:blog/models/data/data_strings.dart';

class PortfolioProject extends StatefulWidget {
  const PortfolioProject({super.key});

  @override
  State<PortfolioProject> createState() => _PortfolioProjectState();
}

class _PortfolioProjectState extends State<PortfolioProject> {
  @override
  Widget build(BuildContext context) {
    webImageBox(int mode) {
      return Container(
        margin: AppStyle.gapAll,
        constraints: BoxConstraints(maxWidth: mode == 0 ? AppStyle.reactiveSize(600, context) : 800),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 2, color: AppColor.backgroundWhite),
          borderRadius: AppStyle.borderRadius,
        ),
        child: ClipRRect(
          borderRadius: AppStyle.borderRadius,
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
        margin: AppStyle.gapAll,
        color: Colors.transparent,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: imageUrl.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: AppStyle.borderRadius,
              child: Image.network(imageUrl[index], fit: BoxFit.cover),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: AppStyle.basic);
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
            style: AppStyle.normalText(<double>[20, 25, 30][mode], true).copyWith(
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
        margin: AppStyle.gapHorizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: textList.map((body) {
            return Text(body, style: AppStyle.normalText(<double>[15, 18, 20][mode], true));
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
              padding: const EdgeInsets.all(AppStyle.mediumSize),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(DataStrings.projectTitle, style: AppStyle.titleText(<double>[65, 85, 100][mode], true)),
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
        minHeight: AppStyle.getSize(context).height,
      ),
      // mode 0: mobile, 1:tablet, 2:desktop
      child: ScreenCase(
        mobile: projectBuild(0),
        tablet: projectBuild(1),
        desktop: projectBuild(2),
      ),
    );
  }
}
