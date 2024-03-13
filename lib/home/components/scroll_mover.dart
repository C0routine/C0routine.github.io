import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 스크롤을 움직이는 위젯
class ScrollMover extends StatefulWidget {
  const ScrollMover({
    super.key,
    required this.controller,
    required this.pages,
    this.onPaged,
  });

  final ScrollController controller;
  final List<String> pages;
  final List<Function()>? onPaged;

  @override
  State<ScrollMover> createState() => _ScrollMoverState();
}

class _ScrollMoverState extends State<ScrollMover> {
  Offset offset = const Offset(0, 0);
  int currentIndex = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      double maxScrollExtent = widget.controller.position.maxScrollExtent;
      double branchScrollExtent = maxScrollExtent / widget.pages.length;

      for (int i = 0; i < widget.pages.length; i++) {
        if (widget.controller.offset >= branchScrollExtent * i && widget.controller.offset < branchScrollExtent * (i + 1)) {
          setState(() {
            offset = Offset(0, i.toDouble());
            currentIndex = i;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onExit: (event) {
        if (currentIndex != offset.dy.toInt()) {
          setState(() {
            offset = Offset(0, currentIndex.toDouble());
          });
        }
      },
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.pages.mapIndexed((index, page) {
                  return GestureDetector(
                    onTap: () {
                      widget.controller.animateTo(
                        index * widget.controller.position.viewportDimension,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      setState(() {
                        offset = Offset(0, index.toDouble());
                        currentIndex = index;
                      });
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          offset = Offset(0, index.toDouble());
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                          height: 50.h,
                          child: Center(
                            child: Text(page),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            AnimatedSlide(
              offset: offset,
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              child: Container(
                width: 3,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            ),
            const VerticalDivider(width: 1, thickness: 1, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
