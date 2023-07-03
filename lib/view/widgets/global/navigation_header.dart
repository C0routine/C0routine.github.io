import 'package:flutter/material.dart';
import 'package:blog/utils/screen_case.dart';

class NavigationHeaders extends StatelessWidget {
  const NavigationHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    headerLogo() {
      return GestureDetector(
        onTap: () {
          // TODO GoRouter Setting
          print('Go Home');
        },
        child: SelectableText(
          'C0routine Blog',
          style: TextStyle(fontSize: 30),
        ),
      );
    }

    mobileHeader() {
      return Row(
        children: [
          headerLogo(),
        ],
      );
    }

    buildHeader() {
      return Row(
        children: [
          headerLogo(),
        ],
      );
    }

    return Container(
      child: ScreenCase(
        mobile: mobileHeader(),
        tablet: buildHeader(),
        desktop: buildHeader(),
      ),
    );
  }
}
