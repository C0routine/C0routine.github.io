import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/models/data/data_strings.dart';
import 'package:blog/view/widgets/global/screen_case.dart';

class NavigationHeaders extends StatelessWidget {
  const NavigationHeaders({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    // Mobile Header
    mobileHeader() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            // onTap: () => NavigationHeaderVM.openEndDrawer(scaffoldKey),
            child: const Padding(
              padding: AppStyle.gapAll,
              child: Icon(
                Icons.menu,
                size: AppStyle.iconSize,
                color: AppColor.icons,
              ),
            ),
          ),
        ],
      );
    }

    // Desktop, Tablet Header
    otherHeader() {
      return Padding(
        padding: AppStyle.gapAll,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TODO Blog Icon
            const Icon(Icons.home, size: AppStyle.iconSize, color: AppColor.icons),

            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ...DataStrings.navigationMenu.map((menu) {
                  //   return GestureDetector(
                  //     onTap: () => NavigationHeaderVM.navigationName(menu, context),
                  //     child: Padding(
                  //       padding: AppStyle.gapHorizontal,
                  //       child: Text(menu, style: Theme.of(context).textTheme.titleMedium),
                  //     ),
                  //   );
                  // }),
                ],
              ),
            ),
          ],
        ),
      );
    }

    buildHeader(ScreenStatus mode) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ...DataStrings.navigationHeaders.map((string) {
            return GestureDetector(
              onTap: () {
                // NavigationHeaderVM.navigationName(name, context);
              },
              child: Padding(
                padding: AppStyle.gapAll,
                child: Text(
                  string,
                  style: AppStyle.titleText(<double>[20, 25, 30][mode.index], true),
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
      child: ScreenCase(
        mobile: buildHeader(ScreenStatus.mobile),
        tablet: buildHeader(ScreenStatus.tablet),
        desktop: buildHeader(ScreenStatus.desktop),
      ),
    );
  }
}
