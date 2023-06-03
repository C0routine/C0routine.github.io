import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileIntro extends StatefulWidget {
  const ProfileIntro({Key? key}) : super(key: key);

  @override
  State<ProfileIntro> createState() => _ProfileIntroState();
}

class _ProfileIntroState extends State<ProfileIntro> with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _scaleController;
  late Animation<double> _text;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _textController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));
    _text = Tween(begin: 60.0, end: 0.0)
        .chain(
          CurveTween(curve: Curves.easeOutQuint),
        )
        .animate(_textController);
    _textController.forward();

    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1700));
    _scale = Tween(begin: 60.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.easeOutQuint),
        )
        .animate(_scaleController);
    _scaleController.forward();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget backgroundText(EdgeInsets margin, String text, double rotate) {
      return Positioned(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin: margin,
            child: ImageFiltered(
              // compose 기능은 web 용으로 구현되어 있지 않다고 함.
              imageFilter: ImageFilter.matrix(Matrix4.rotationZ(rotate).storage),
              child: Opacity(
                opacity: 0.3,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ),
      );
    }

    final List<Widget> leftTopText = [
      backgroundText(const EdgeInsets.only(bottom: 200, right: 300), 'Dart', -0.6),
      backgroundText(const EdgeInsets.only(bottom: 250, right: 200), 'Kotlin', -0.3),
      backgroundText(const EdgeInsets.only(bottom: 250, right: 400), 'JavaScript', -0.5),
      backgroundText(const EdgeInsets.only(bottom: 350, right: 220), 'TypeScript', -0.2),
      backgroundText(const EdgeInsets.only(bottom: 380, right: 500), 'Java', -0.5),
      backgroundText(const EdgeInsets.only(bottom: 450, right: 300), 'Assembly(x86)', -0.25),
    ];

    final List<Widget> rightTopText = [
      backgroundText(const EdgeInsets.only(bottom: 270, left: 150), 'FLUTTER', 0.4),
      backgroundText(const EdgeInsets.only(bottom: 400, left: 100), 'React Native', 0.4),
      backgroundText(const EdgeInsets.only(bottom: 250, left: 350), 'Android Studio', 0.5),
      backgroundText(const EdgeInsets.only(bottom: 400, left: 250), 'XCode', 0.4),
      backgroundText(const EdgeInsets.only(bottom: 450, left: 400), 'Firebase', 0.5),
      backgroundText(const EdgeInsets.only(bottom: 500, left: 150), 'VSCode', 0.4),
      backgroundText(const EdgeInsets.only(bottom: 600, left: 300), 'WebStorm', 0.4),
    ];

    final List<Widget> rightBottomText = [
      backgroundText(const EdgeInsets.only(top: 250, left: 200), 'Vim', -0.5),
      backgroundText(const EdgeInsets.only(top: 280, left: 400), 'MarkDown', -0.6),
      backgroundText(const EdgeInsets.only(top: 400, left: 150), 'JD-GUI', -0.5),
      backgroundText(const EdgeInsets.only(top: 450, left: 300), 'ApkTool', -0.5),
      backgroundText(const EdgeInsets.only(top: 550, left: 450), 'Dex2jar', -0.6),
      backgroundText(const EdgeInsets.only(top: 600, left: 150), 'Ollydbg', -0.5),
    ];

    final List<Widget> leftBottomText = [
      backgroundText(const EdgeInsets.only(top: 250, right: 220), 'Figma', 0.4),
      backgroundText(const EdgeInsets.only(top: 300, right: 350), 'Slack', 0.5),
      backgroundText(const EdgeInsets.only(top: 400, right: 200), 'Notion', 0.3),
      backgroundText(const EdgeInsets.only(top: 400, right: 450), 'GitHub', 0.5),
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ...leftTopText,
          ...rightTopText,
          ...rightBottomText,
          ...leftBottomText,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _textController,
                builder: (BuildContext context, Widget? child) {
                  return Transform.translate(offset: Offset(0, _text.value), child: child);
                },
                child: Text(
                  'Hello!\nI\'m C0routine',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ScaleTransition(
                scale: _scale,
                child: Divider(
                  thickness: 1,
                  color: AppColor.accent,
                  endIndent: AppStyle.widthPercent(context, 0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
