import 'package:flutter/material.dart';

import 'package:blog/utils/app_style.dart';
import 'package:blog/models/data/data_strings.dart';
import 'package:blog/viewmodel/global/navigation_header_vm.dart';

class HeaderDrawer extends StatelessWidget {
  const HeaderDrawer({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: AppStyle.gapAll,
        itemCount: DataStrings.navigationMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              NavigationHeaderVM.closeEndDrawer(context);
              NavigationHeaderVM.navigationName(DataStrings.navigationMenu[index], context);
            },
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  DataStrings.navigationMenu[index],
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
