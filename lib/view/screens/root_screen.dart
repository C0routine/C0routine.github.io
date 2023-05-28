import 'package:flutter/material.dart';

import 'package:blog/view/widgets/root/navigator_selector_d.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigatorSelectorDesktop(title: 'P O R T F O L I O', selectType: 0),
            NavigatorSelectorDesktop(title: 'T E C H  B L O G', selectType: 1),
          ],
        ),
      );
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // mobile, desktop
          if (constraints.maxWidth > 600) {
            return desktopUI();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
