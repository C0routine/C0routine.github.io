import 'package:blog/utils/app_color.dart';
import 'package:blog/view/widgets/profile/intro.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: 0);
    return Stack(
      children: [
        PageView(
          controller: pageController,
          scrollDirection: Axis.vertical,
          physics: const PageScrollPhysics(),
          pageSnapping: true,
          children: [
            ProfileIntro(),
            Center(child: Text('Second Page')),
            Center(child: Text('Third Page')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: Align(
            alignment: Alignment.centerRight,
            child: SmoothPageIndicator(
              count: 3,
              effect: const SwapEffect(
                type: SwapType.yRotation,
                spacing: 12,
                dotWidth: 16,
                dotHeight: 10,
                dotColor: AppColor.disable,
                activeDotColor: AppColor.accent,
              ),
              controller: pageController,
              axisDirection: Axis.vertical,
              onDotClicked: (int page) {
                pageController.animateToPage(
                  page,
                  curve: Curves.easeInOutBack,
                  duration: const Duration(milliseconds: 1200),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
