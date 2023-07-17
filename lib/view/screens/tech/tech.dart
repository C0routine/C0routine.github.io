import 'package:flutter/material.dart';

import 'package:blog/utils/app_style.dart';
import 'package:blog/utils/app_widget.dart';


class Tech extends StatefulWidget {
  const Tech({super.key});

  @override
  State<Tech> createState() => _TechState();
}

class _TechState extends State<Tech> {
  @override
  Widget build(BuildContext context) {

    techBuild(int mode){
      return Container();
    }

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: AppStyle.getSize(context).height,
        ),
        // mode 0: mobile, 1:tablet, 2:desktop
        child: ScreenCase(
          mobile: techBuild(0),
          tablet: techBuild(1),
          desktop: techBuild(2),
        ),
      ),
    );
  }
}
