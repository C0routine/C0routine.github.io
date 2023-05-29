import 'package:flutter/material.dart';

class HomeAlphaTitle extends StatefulWidget {
  const HomeAlphaTitle({super.key});

  @override
  State<StatefulWidget> createState() => _HomeAlphaTitle();
}

class _HomeAlphaTitle extends State<HomeAlphaTitle> with TickerProviderStateMixin {
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
            colors: <Color>[Color(0xFFFFFFFF), Color(0xFF006fff)],
            tileMode: TileMode.mirror,
          ).createShader(bounds);
        },
        child: const Text(
          'C0routine Blog',
          style: TextStyle(
            fontSize: 55,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
