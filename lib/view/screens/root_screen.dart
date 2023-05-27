import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    print('rerender');
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // mobile, desktop
          if (constraints.maxWidth > 600) {
            return Container();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
