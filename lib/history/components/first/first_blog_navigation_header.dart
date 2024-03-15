import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:blog/utils/app_style.dart';
import 'package:blog/core/models/data/data_strings.dart';
import 'package:blog/history/components/first/first_blog_screen_case.dart';

class FirstBlogNavigationHeaders extends StatelessWidget {
  const FirstBlogNavigationHeaders({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    buildHeader(FirstBlogScreenStatus mode) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...DataStrings.navigationHeaders.map((string) {
            return GestureDetector(
              onTap: () async {
                if(string == 'Blog') {
                  await launchUrl(Uri.parse(DataStrings.techUrl));
                }
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: AppStyle.gapAll,
                  child: Text(
                    string,
                    style: AppStyle.titleText(<double>[19, 21, 23][mode.index], true),
                  ),
                ),
              ),
            );
          }),
        ],
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      // mode 0: mobile, 1:tablet, 2:desktop
      child: FirstBlogScreenCase(
        mobile: buildHeader(FirstBlogScreenStatus.mobile),
        tablet: buildHeader(FirstBlogScreenStatus.tablet),
        desktop: buildHeader(FirstBlogScreenStatus.desktop),
      ),
    );
  }
}
