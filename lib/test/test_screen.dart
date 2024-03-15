import 'dart:math';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
            alignment: Alignment.center,
            transform: Matrix4(
              1, 0, 0, 0,
              0, 1, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1,
            )
              ..rotateX(x)
              ..rotateY(y)
              ..rotateZ(z),
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  y = y - details.delta.dx / 100;
                  x = x + details.delta.dy / 100;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.green,
                  ),
                  Container(
                    width: 200,
                    height: 10,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ),

          //   Transform(
          //     transform: Matrix4(
          //       1, 0, 0, 0.001,
          //       0, 1, 0, 0,
          //       0, 0, 1, 0.001,
          //       0, 0, 0, 1,
          //     )
          //       ..rotateX(x)
          //       ..rotateY(y)
          //       ..rotateZ(z)
          //       // ..setEntry(3, 2, 0.001)
          //       // ..setEntry(3, 1, 0.0005),
          //     ,alignment: FractionalOffset.center,
          //     child: GestureDetector(
          //       onPanUpdate: (details) {
          //         setState(() {
          //           y = y - details.delta.dx / 100;
          //           // x = x + details.delta.dy / 100;
          //         });
          //       },
          //       child: Container(
          //         width: 300,
          //         height: 300,
          //         color: Colors.green,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
