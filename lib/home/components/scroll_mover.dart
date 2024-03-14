import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 스크롤을 움직이는 위젯
class ScrollMover extends StatefulWidget {
  const ScrollMover({
    super.key,
    required this.controller,
    required this.pages,
  });

  final ScrollController controller;
  final List<String> pages;

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
            offset = Offset(i.toDouble(), 0);
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
        if (currentIndex != offset.dx.toInt()) {
          setState(() {
            offset = Offset(currentIndex.toDouble(), 0);
          });
        }
      },
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                const Divider(height: 1, thickness: 1, color: Colors.white),
                AnimatedSlide(
                  offset: offset,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: Container(
                    width: 35.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DefaultTextStyle(
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: widget.pages.mapIndexed((index, page) {
                  return GestureDetector(
                    onTap: () {
                      widget.controller.animateTo(
                        index * widget.controller.position.viewportDimension,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                      // setState(() {
                      //   offset = Offset(0, index.toDouble());
                      //   currentIndex = index;
                      // });
                      // if (widget.onPaged != null) {
                      //   widget.onPaged!(index);
                      // }
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (event) {
                        setState(() {
                          offset = Offset(index.toDouble(), 0);
                        });
                      },
                      child: SizedBox(
                        width: 35.w,
                        child: Center(
                          child: Text(page),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
