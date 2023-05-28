import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:blog/utils/app_color.dart';

class NavigatorSelectorDesktop extends StatefulWidget {
  const NavigatorSelectorDesktop({super.key, required this.title, required this.selectType});

  final String title;
  final int selectType;

  @override
  State<StatefulWidget> createState() => _NavigatorSelectorDesktop();
}

class _NavigatorSelectorDesktop extends State<NavigatorSelectorDesktop> {
  bool onFocus = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: onFocus ? AppColor.darkAccent.withOpacity(0.3) : Colors.transparent,
            border: Border.all(width: 5, color: AppColor.white),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
