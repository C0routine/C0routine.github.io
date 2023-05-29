import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PortfolioScreen();
}

class _PortfolioScreen extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return Row(
        children: [
          // NavigationRail(destinations: destinations, selectedIndex: selectedIndex),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        children: [
          // Container(width: 200, height: 200, color: AppColor.darkAccent,),
        ],
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool isDesktop = AppStyle.isDesktop(context);
        return Scaffold(
          appBar: isDesktop
              ? null
              : AppBar(
                  backgroundColor: AppColor.white,
                  title: Text('UI Mode : ${isDesktop ? 'Desktop' : 'Mobile'}'),
                ),
          body: isDesktop ? desktopUI() : mobileUI(),
        );
      },
    );
  }
}
