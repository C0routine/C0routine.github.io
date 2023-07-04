import 'package:blog/models/data/data_strings.dart';
import 'package:blog/models/services/data.dart';
import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/screen_case.dart';

import 'package:blog/viewmodel/global/navigation_header_vm.dart';

class NavigationHeaders extends StatelessWidget {
  const NavigationHeaders({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    List<String> navigationMenu = ['HOME', ''];

    headerLogo() {
      return GestureDetector(
        onTap: () {
          // TODO GoRouter Setting
          print('Go Home');
        },
        child: SelectableText(
          'C0routine',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      );
    }

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
      return Row(
        // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('C0routine'),
          ...DataStrings.navigationMenu.map((menu) {
            return Text(
              menu,
              style: Theme.of(context).textTheme.titleSmall,
            );
          }),
        ],
      );
    }

    return Container(
      child: ScreenCase(
        mobile: mobileHeader(),
        tablet: otherHeader(),
        desktop: otherHeader(),
      ),
    );
  }
}
