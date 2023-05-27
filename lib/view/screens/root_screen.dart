import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog/viewmodel/provider/theme_vm.dart';


class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RootScreen();
}

class _RootScreen extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeVM>().light ? Colors.white : Colors.black,
      body: Center(
        child: Switch(
          value: context.watch<ThemeVM>().light,
          onChanged: (bool value) {
            context.read<ThemeVM>().change();
          },
        ),
      ),
    );
  }
}
