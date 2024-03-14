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

  bool secondPageAnimation = false;

  @override
  Widget build(BuildContext context) {
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
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                            ],
                          ),
                          const SizedBox(height: 10),
                          TweenAnimationBuilder(
                            tween: Tween(begin: 0.0, end: (1.sw / 2)),
                            curve: Curves.ease,
                            duration: const Duration(milliseconds: 4200),
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
                        children: [
                          if (secondPageAnimation)
                            AnimatedTextKit(
                              key: UniqueKey(),
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Project & Portfolio',
                                  speed: const Duration(milliseconds: 200),
                                  textStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
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
                SliverFillViewport(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (BuildContext context, int index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 0.7.sw,
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 0.6.sh,
                                aspectRatio: 19 / 10,
                                viewportFraction: 0.6,
                                enlargeFactor: 0.16,
                                enlargeCenterPage: true,
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index, int realIndex) {
                                final colors = [
                                  Colors.red,
                                  Colors.blue,
                                  Colors.green,
                                  Colors.yellow,
                                  Colors.purple,
                                ];
                                return Container(
                                  width: 1.sw,
                                  decoration: BoxDecoration(
                                    color: colors[index],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
