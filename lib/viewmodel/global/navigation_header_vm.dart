import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationHeaderVM {
  // End Drawer Open
  static void openEndDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    scaffoldKey.currentState!.openEndDrawer();
  }

  // End Drawer Close
  static void closeEndDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  // Close Drawer & Navigation Name
  static void navigationName(String name, BuildContext context){
    name = '/${name.toLowerCase()}';
    context.pop();

    // tap 한 navigation name 과 현재 위치가 다를 경우 이동
    if(name != ModalRoute.of(context)!.settings.name) {
      context.push(name);
    }
  }
}
