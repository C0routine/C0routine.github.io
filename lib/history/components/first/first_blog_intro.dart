import 'package:flutter/material.dart';

import 'package:blog/core/constant/app_color.dart';
import 'package:blog/core/models/data/data_strings.dart';
import 'package:blog/history/components/first/first_blog_app_style.dart';
import 'package:blog/history/components/first/first_blog_screen_case.dart';

class FirstBlogIntro extends StatefulWidget {
  const FirstBlogIntro({super.key});

  @override
  State<FirstBlogIntro> createState() => _FirstBlogIntroState();
}

class _FirstBlogIntroState extends State<FirstBlogIntro> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    introBuild(int mode) {
      return Container(
        color: AppColor.backgroundBlack,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Padding(
                padding: FirstBlogAppStyle.gapHorizontal,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      DataStrings.introTitle,
                      style: FirstBlogAppStyle.titleText(<double>[65, 85, 100][mode], true),
                    ),
                  ),
                ),
              ),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: (FirstBlogAppStyle.getSize(context).width / 2)),
              curve: Curves.elasticOut,
              duration: const Duration(milliseconds: 2600),
              builder: (BuildContext context, double value, Widget? child) {
                return Container(
                  width: value,
                  height: FirstBlogAppStyle.reactiveSize(7, context),
                  decoration: const BoxDecoration(
                    color: AppColor.backgroundWhite,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16), bottomRight: Radius.circular(16)),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: FirstBlogAppStyle.getSize(context).height,
      ),
      // mode 0: mobile, 1:tablet, 2:desktop
      child: FirstBlogScreenCase(
        mobile: introBuild(0),
        tablet: introBuild(1),
        desktop: introBuild(2),
      ),
    );
  }
}
