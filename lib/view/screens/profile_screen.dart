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

  late AnimationController _aboutMeTitleController;
  late AnimationController _aboutMeBodyController;
  late AnimationController _useTitleController;
  late AnimationController _useBodyController;

  // Scroll Offset Check and Start Animation
  void scrollOffsetCheck(double scrollOffset, AnimationController animationController) {
    if (scrollController.offset > scrollOffset) {
      animationController.forward();
    }
  }

  // Scroll Listener Function
  void _checkScrollAnimation() {
    print('Current Scroll : ${scrollController.offset}');

    scrollOffsetCheck(70, _aboutMeTitleController);
    scrollOffsetCheck(110, _aboutMeBodyController);
    scrollOffsetCheck(330, _useTitleController);
    scrollOffsetCheck(400, _useBodyController);
  }

  // animation controller 초기화 설정
  AnimationController controllerInit(TickerProvider ticker, int milliseconds) {
    return AnimationController(vsync: ticker, duration: Duration(milliseconds: milliseconds));
  }

  @override
  void initState() {
    super.initState();
    _aboutMeTitleController = controllerInit(this, 2500);
    _aboutMeBodyController = controllerInit(this, 2000);
    _useTitleController = controllerInit(this, 2500);
    _useBodyController = controllerInit(this, 2000);

    // scroll controller listener
    scrollController.addListener(_checkScrollAnimation);
  }

  @override
  void dispose() {
    _aboutMeTitleController.dispose();
    _aboutMeBodyController.dispose();
    _useTitleController.dispose();
    _useBodyController.dispose();

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
              ProfileAboutMe(
                titleController: _aboutMeTitleController,
                bodyController: _aboutMeBodyController,
              ),
              const SizedBox(height: 100),
              ProfileUse(
                titleController: _useTitleController,
                bodyController: _useBodyController,
              ),
            ],
          ),
        ),
        // ListView(
        //   controller: scrollController,
        //   children: [
        //     const ProfileIntro(),
        //     ProfileAboutMe(
        //       titleController: _aboutMeTitleController,
        //       bodyController: _aboutMeBodyController,
        //     ),
        //     const SizedBox(height: 100),
        //     ProfileUse(
        //       titleController: _useTitleController,
        //       bodyController: _useBodyController,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
