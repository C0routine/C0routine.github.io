import 'package:blog/view/widgets/profile/project.dart';
import 'package:flutter/material.dart';

import 'package:blog/view/widgets/profile/intro.dart';
import 'package:blog/view/widgets/profile/about_me.dart';
import 'package:blog/view/widgets/profile/use.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  final scrollController = ScrollController();

  late AnimationController _aboutMeController;
  late AnimationController _useController;

  // Scroll Offset Check and Start Animation
  void scrollOffsetCheck(double scrollOffset, AnimationController animationController) {
    if (scrollController.offset > scrollOffset) {
      animationController.forward();
    }
  }

  // Scroll Listener Function
  void _checkScrollAnimation() {
    print('Current Scroll : ${scrollController.offset}');

    scrollOffsetCheck(70, _aboutMeController);
    scrollOffsetCheck(330, _useController);
  }

  // animation controller 초기화 설정
  AnimationController controllerInit(TickerProvider ticker, int milliseconds) {
    return AnimationController(vsync: ticker, duration: Duration(milliseconds: milliseconds));
  }

  @override
  void initState() {
    super.initState();
    _aboutMeController = controllerInit(this, 1600);
    _useController = controllerInit(this, 1600);

    // scroll controller listener
    scrollController.addListener(_checkScrollAnimation);
  }

  @override
  void dispose() {
    _aboutMeController.dispose();
    _useController.dispose();

    scrollController.removeListener(_checkScrollAnimation);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Render Profile Screen');
    return Stack(
      children: [
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const ProfileIntro(),
              ProfileAboutMe(aboutMeController: _aboutMeController),
              const SizedBox(height: 100),
              ProfileUse(useController: _useController),
              const SizedBox(height: 100),
              ProfileProject(),
            ],
          ),
        ),
      ],
    );
  }
}
