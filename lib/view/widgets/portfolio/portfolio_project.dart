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
    // mode 0: mobile, 1:tablet, 2:desktop
    projectBuild(int mode) {
      return Container(
        color: AppColor.backgroundBlack,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              margin: AppStyle.gapAll,
              constraints: const BoxConstraints(maxWidth: 600),
              decoration: BoxDecoration(
                color: AppColor.white,
                border: Border.all(width: 2, color: AppColor.backgroundWhite),
                borderRadius: AppStyle.borderRadius,
              ),
              child: ClipRRect(
                borderRadius: AppStyle.borderRadius,
                child: Image.network(DataStrings.projectWebImageUrl, fit: BoxFit.fill),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse(DataStrings.projectWebUrl);
                await launchUrl(url);
                // if (await launchUrl(url)) {
                //   throw Exception('Could not launch $url');
                // }
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  DataStrings.projectMore,
                  style: AppStyle.normalText(<double>[20, 25, 30][mode], true).copyWith(
                    decoration: TextDecoration.underline,
                    decorationColor: AppColor.textWhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // TODO 일자형으로 묶을것.
            Text(DataStrings.projectWebBody1, style: AppStyle.normalText(<double>[15, 18, 20][mode], true)),
            Text(DataStrings.projectWebBody2, style: AppStyle.normalText(<double>[15, 18, 20][mode], true)),
            Text(DataStrings.projectWebBody3, style: AppStyle.normalText(<double>[15, 18, 20][mode], true)),
            Text(DataStrings.projectWebBody4, style: AppStyle.normalText(<double>[15, 18, 20][mode], true)),
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
