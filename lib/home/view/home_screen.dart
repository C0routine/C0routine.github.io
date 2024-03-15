import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:blog/home/components/scroll_mover.dart';
import 'package:blog/home/components/project_list.dart';
import 'package:blog/core/component/responsive_page.dart';
import 'package:blog/core/providers/current_platform_providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _controller = ScrollController();

  bool secondPageAnimation = false;
  bool secondPageOpacity = false;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.viewportDimension / 2) {
        setState(() {
          secondPageAnimation = true;
          Future.delayed(const Duration(milliseconds: 1200), () {
            setState(() => secondPageOpacity = true);
          });
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(currentPlatformsProvider);

    return ResponsivePage(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          CustomScrollView(
            controller: _controller,
            physics: const PageScrollPhysics(),
            slivers: [
              /* Intro */
              SliverFillViewport(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 0.6.sw,
                          height: 31.sp,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Mr.Chae Blog',
                                  textStyle: TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w700, height: 1.0),
                                  speed: const Duration(milliseconds: 120),
                                  cursor: '_',
                                ),
                              ],
                              onFinished: () {
                                _controller
                                    .animateTo(_controller.position.viewportDimension,
                                        duration: const Duration(milliseconds: 600), curve: Curves.ease)
                                    .whenComplete(() {
                                  setState(() => secondPageAnimation = true);
                                  Future.delayed(const Duration(milliseconds: 1200), () {
                                    setState(() => secondPageOpacity = true);
                                  });
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TweenAnimationBuilder(
                          tween: Tween(begin: 0.0, end: 0.55.sw),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 2500),
                          builder: (BuildContext context, double value, Widget? child) {
                            return Container(
                              width: value,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),

              /* Project & Portfolio Page */
              SliverFillViewport(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (secondPageAnimation)
                          SizedBox(
                            width: 1.sw,
                            height: 29.sp,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: AnimatedTextKit(
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    'Project & Portfolio',
                                    speed: const Duration(milliseconds: 80),
                                    textStyle: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.white),
                                    cursor: '_',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        SizedBox(height: 30.h),
                        AnimatedOpacity(
                          curve: Curves.easeInQuart,
                          opacity: secondPageOpacity ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1500),
                          child: const ProjectList(),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    );
                  },
                ),
              ),

              /* Contact */
              SliverFillViewport(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [],
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.h,
            child: ScrollMover(
              controller: _controller,
              pages: const ['00', '01', '02'],
            ),
          ),
        ],
      ),
    );
  }
}
