import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:blog/core/constant/app_data.dart';
import 'package:blog/core/providers/current_platform_providers.dart';
import 'package:blog/core/extension/extension_current_platform.dart';

class ContactAnimated extends StatefulWidget {
  const ContactAnimated({super.key, required this.state});

  final CurrentPlatform state;

  @override
  State<ContactAnimated> createState() => _ContactAnimatedState();
}

class _ContactAnimatedState extends State<ContactAnimated> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  bool isFront = true;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1700));
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.ease),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isFront) {
          _controller.forward();
        } else {
          _controller.reverse();
        }

        setState(() {
          isFront = !isFront;
        });
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          final y = pi * _animation.value;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(2, 1, 0.04)
              ..rotateY(y),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(widget.state.platformDouble(7, 12, 15.0)),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff000000),
                    Color(0xff434343),
                  ],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: y < (pi / 2) ? 1.0 : 0.0,
                    child: SizedBox(
                      width: 0.3.sw,
                      height: 29.sp,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: AnimatedTextKit(
                          totalRepeatCount: 1,
                          onFinished: () {
                            if (isFront) _controller.forward();
                          },
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Contact Me.',
                              speed: const Duration(milliseconds: 200),
                              textStyle: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold, color: Colors.white),
                              cursor: '_',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: y > (pi / 2) ? 1.0 : 0.0,
                    child: IgnorePointer(
                      ignoring: y > (pi / 2) ? false : true,
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()..rotateY(pi * 1),
                        child: DefaultTextStyle(
                          style: TextStyle(fontSize: 10.sp, color: Colors.white, fontWeight: FontWeight.w500, height: 1.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.network('$asset${'icon/github_icon.svg'}', width: 50, height: 50),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      launchUrlString('https://github.com/C0routine');
                                    },
                                    child: const MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: SizedBox(
                                        width: 200,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text('github.com/C0routine'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.network('$asset${'icon/gmail_icon.svg'}', width: 50, height: 50),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(const ClipboardData(text: 'whdrjsco@gmail.com'));
                                      showDialog(
                                        context: context,
                                        barrierColor: Colors.transparent,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              width: 100,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10.r),
                                              ),
                                              child: const Center(
                                                child: Text('복사되었습니다'),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                      Future.delayed(const Duration(milliseconds: 500), () => context.pop());
                                    },
                                    child: const MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: SizedBox(
                                        width: 200,
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text('whdrjsco@gmail.com'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
