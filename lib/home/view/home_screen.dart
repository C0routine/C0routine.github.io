import 'package:blog/home/components/rectangle_frame.dart';
import 'package:blog/home/components/scroll_mover.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            alignment: Alignment.center,
            children: [
              CustomScrollView(
                controller: _controller,
                physics: const PageScrollPhysics(),
                slivers: [
                  SliverFillViewport(
                    delegate: SliverChildBuilderDelegate(
                      childCount: 1,
                      (BuildContext context, int index) {
                        return Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedTextKit(
                                // key: UniqueKey(),
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
                              width: 150.w,
                              child: CarouselSlider.builder(
                                options: CarouselOptions(
                                  height: 300.h,
                                  aspectRatio: 1,
                                  viewportFraction: 0.5,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.2,
                                ),
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index, int realIndex) {
                                  final colors = [
                                    Colors.red,
                                    Colors.blue,
                                    Colors.green,
                                    Colors.yellow,
                                    Colors.purple,
                                  ];
                                  return Container(
                                    width: 100.w,
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
              Positioned(
                right: 20.w,
                child: ScrollMover(
                  controller: _controller,
                  pages: const ['00', '01', '02'],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
