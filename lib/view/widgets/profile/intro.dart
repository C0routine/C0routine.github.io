
import 'package:blog/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProfileIntro extends StatefulWidget {
  const ProfileIntro({Key? key}) : super(key: key);

  @override
  State<ProfileIntro> createState() => _ProfileIntroState();
}

class _ProfileIntroState extends State<ProfileIntro> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Hello!\nI\'m 채종건', textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.titleLarge,),
        Divider(thickness: 1, endIndent: AppStyle.widthPercent(context, 0.5)),
      ],
    );
  }
}
