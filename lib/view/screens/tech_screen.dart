import 'package:blog/utils/app_color.dart';
import 'package:flutter/material.dart';

class TechScreen extends StatefulWidget {
  const TechScreen({Key? key}) : super(key: key);

  @override
  State<TechScreen> createState() => _TechScreenState();
}

class _TechScreenState extends State<TechScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.auto_fix_high_outlined,
          color: AppColor.accent,
          size: 100,
        ),
        const SizedBox(height: 20),
        Text('현재 공사중이에요!', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
