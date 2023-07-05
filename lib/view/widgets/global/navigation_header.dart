import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/screen_case.dart';
import 'package:blog/models/data/data_strings.dart';
import 'package:blog/viewmodel/global/navigation_header_vm.dart';

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
            onTap: () => NavigationHeaderVM.openEndDrawer(scaffoldKey),
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

    return SizedBox(
      width: double.infinity,
      child: ScreenCase(
        mobile: mobileHeader(),
        tablet: otherHeader(),
        desktop: otherHeader(),
      ),
    );
  }
}
