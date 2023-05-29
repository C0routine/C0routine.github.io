import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAlphaBody extends StatefulWidget {
  const HomeAlphaBody({super.key, required this.title, required this.selectType});

  final String title;
  final int selectType;

  @override
  State<StatefulWidget> createState() => _HomeAlphaBody();
}

class _HomeAlphaBody extends State<HomeAlphaBody> with TickerProviderStateMixin {
  bool onFocus = false;

  late final AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    );
    _animation = Tween(begin: -75.0, end: 0.0).chain(CurveTween(curve: Curves.bounceOut)).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(offset: Offset(_animation.value, 0.0), child: child);
      },
      child: GestureDetector(
        onTap: () {
          if (widget.selectType == 0) {
            context.go('/portfolio');
            return;
          }

          if (widget.selectType == 1) {
            context.go('/tech');
            return;
          }
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => onFocus = true),
          onExit: (_) => setState(() => onFocus = false),
          child: Container(
            width: 400,
            height: 100,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: onFocus ? const Color(0xFF006fff).withOpacity(0.3) : Colors.transparent,
              border: Border.all(width: 5, color: const Color(0xFFFFFFFF)),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
