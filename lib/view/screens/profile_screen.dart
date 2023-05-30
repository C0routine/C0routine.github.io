import 'package:flutter/material.dart';

import 'package:blog/view/widgets/profile/about_me.dart';
import 'package:blog/view/widgets/profile/intro.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  final scrollController = ScrollController();

  late AnimationController _aboutMeHeaderController;
  late AnimationController _aboutMeBodyController;

  void _checkScrollAnimation() {
    print(scrollController.offset);
    // AboutMe Header Animation Control
    if (scrollController.offset > 40 && _aboutMeHeaderController.status == AnimationStatus.dismissed) {
      _aboutMeHeaderController.forward();
    }

    // AboutMe Body Animation Control
    if (scrollController.offset > 170 && _aboutMeBodyController.status == AnimationStatus.dismissed) {
      _aboutMeBodyController.forward();
    }
  }

  @override
  void initState() {
    // animation controller
    _aboutMeHeaderController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    _aboutMeBodyController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    // scroll controller listener
    scrollController.addListener(_checkScrollAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _aboutMeBodyController.dispose();
    _aboutMeHeaderController.dispose();
    scrollController.removeListener(_checkScrollAnimation);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          controller: scrollController,
          children: [
            ProfileIntro(),
            ProfileAboutMe(
              bodyController: _aboutMeBodyController,
              headerController: _aboutMeHeaderController,
            ),
          ],
        ),
      ],
    );
  }
}
