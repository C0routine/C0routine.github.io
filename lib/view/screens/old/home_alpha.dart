import 'package:flutter/material.dart';

import 'package:blog/view/widgets/root/home_old/alpha/home_alpha_title.dart';
import 'package:blog/view/widgets/root/home_old/alpha/home_alpha_body.dart';

class HomeScreenAlpha extends StatefulWidget {
  const HomeScreenAlpha({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenAlpha();
}

class _HomeScreenAlpha extends State<HomeScreenAlpha> {
  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeAlphaTitle(),
            HomeAlphaBody(title: 'P O R T F O L I O', selectType: 0),
            HomeAlphaBody(title: 'T E C H  B L O G', selectType: 1),
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
