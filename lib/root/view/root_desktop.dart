import 'dart:math';

import 'package:flutter/material.dart';

class RootDesktop extends StatefulWidget {
  const RootDesktop({super.key});

  @override
  State<RootDesktop> createState() => _RootDesktopState();
}

class _RootDesktopState extends State<RootDesktop> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            transform: Matrix4(
              1, 0, 0, 0.001,
              0, 1, 0, 0,
              0, 0, 1, 0.001,
              0, 0, 0, 1,
            )
              ..rotateX(x)
              ..rotateY(y)
              ..rotateZ(z)
              // ..setEntry(3, 2, 0.001)
              // ..setEntry(3, 1, 0.0005),
            ,alignment: FractionalOffset.center,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  y = y - details.delta.dx / 100;
                  // x = x + details.delta.dy / 100;
                });
              },
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Colors.red,
                  //     width: 10,
                  //   ),
                  //   bottom: BorderSide(
                  //     color: Colors.blue,
                  //     width: 10,
                  //   ),
                  //   left: BorderSide(
                  //     color: Colors.purple,
                  //     width: 10,
                  //   ),
                  //   right: BorderSide(
                  //     color: Colors.green,
                  //     width: 10,
                  //   ),
                  // ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
