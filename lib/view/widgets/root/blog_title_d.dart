import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

/// Root Screen Blog Title
class BlogTitle extends StatefulWidget {
  const BlogTitle({super.key});

  @override
  State<StatefulWidget> createState() => _BlogTitle();
}

class _BlogTitle extends State<BlogTitle> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    );
    _animation = CurveTween(curve: Curves.easeIn).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(opacity: _animation.value, child: child);
      },
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const RadialGradient(
            center: Alignment(1, 0.1),
            radius: 1.6,
            colors: <Color>[AppColor.white, AppColor.darkAccent],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: Text(
          'C0routine Blog',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 55,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
        ),
      ),
    );
  }
}
