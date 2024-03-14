import 'package:blog/core/extension/extension_current_platform.dart';
import 'package:blog/core/providers/current_platform_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:blog/home/components/scroll_mover.dart';
import 'package:blog/home/components/project_list.dart';
import 'package:blog/core/component/responsive_page.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _controller = ScrollController();

  bool firstPageAnimation = false;
  bool secondPageAnimation = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 600), () {
        setState(() {
          firstPageAnimation = true;
        });
      });
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
          NotificationListener(
            onNotification: (ScrollNotification scroll) {
              double currentScroll = scroll.metrics.pixels / scroll.metrics.maxScrollExtent;
              if (currentScroll > 0.3 && secondPageAnimation == false) {
                setState(() {
                  secondPageAnimation = true;
                });
              }
              return true;
            },
            child: CustomScrollView(
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
                          if (firstPageAnimation) ...[
                            AnimatedTextKit(
                              key: UniqueKey(),
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Mr.Chae Blog',
                                  textStyle: TextStyle(fontSize: 30.sp, color: Colors.white, fontWeight: FontWeight.w700, height: 1.0),
                                  speed: const Duration(milliseconds: 200),
                                  cursor: '_',
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TweenAnimationBuilder(
                              tween: Tween(begin: 0.0, end: (1.sw / 2)),
                              curve: Curves.ease,
                              duration: const Duration(milliseconds: 4000),
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
                        children: [
                          if (secondPageAnimation)
                            AnimatedTextKit(
                              key: UniqueKey(),
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Project & Portfolio',
                                  speed: const Duration(milliseconds: 200),
                                  textStyle:
                                      TextStyle(fontSize: state.platformDouble(20.spMin, 50, 60), fontWeight: FontWeight.bold, color: Colors.white),
                                  cursor: '_',
                                ),
                              ],
                            ),
                          SizedBox(height: 30.h),
                          const ProjectList(),
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
