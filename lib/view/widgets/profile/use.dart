import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileUse extends StatefulWidget {
  const ProfileUse({Key? key, required this.useController}) : super(key: key);

  final AnimationController useController;

  @override
  State<ProfileUse> createState() => _ProfileUseState();
}

class _ProfileUseState extends State<ProfileUse> with TickerProviderStateMixin {
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _opacity = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.easeOutQuint),
        )
        .animate(widget.useController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO Web Release Svg Load 안되는 문제, webp 로 모두 변경 해야됨
    final useItemList = [
      {'name': 'Flutter', 'image': 'flutter.png'},
      {'name': 'React Native', 'image': 'react.png'},
      {'name': 'Firebase', 'image': 'firebase.png'},
      {'name': 'Dart', 'image': 'dart.png'},
      {'name': 'Kotlin', 'image': 'kotlin.png'},
      {'name': 'Java', 'image': 'java.png'},
      {'name': 'JavaScript', 'image': 'javascript.png'},
      {'name': 'TypeScript', 'image': 'typescript.png'},
      {'name': 'Github', 'image': 'github.png'},
      {'name': 'Slack', 'image': 'slack.png'},
      {'name': 'Notion', 'image': 'notion.png'},
      {'name': 'Figma', 'image': 'figma.png'},
      {'name': 'Markdown', 'image': 'markdown.png'},
      {'name': 'Vim', 'image': 'vim.png'},
      {'name': 'Android Studio', 'image': 'android_studio.png'},
      {'name': 'Xcode', 'image': 'xcode.png'},
      {'name': 'VSCode', 'image': 'vscode.png'},
      {'name': 'WebStorm', 'image': 'webstorm.png'},
    ];

    Widget useItem(String url, String text) {
      return Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/logo/$url',
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 5),
          Text(text, style: Theme.of(context).textTheme.titleSmall),
        ],
      );
    }

    return SizedBox(
      child: Column(
        children: [
          FadeTransition(
            opacity: _opacity,
            child: Text('Use', style: Theme.of(context).textTheme.titleLarge),
          ),
          FadeTransition(
            opacity: _opacity,
            child: Container(
              margin: AppStyle.gapAll,
              padding: AppStyle.gapAll,
              decoration: BoxDecoration(
                color: AppColor.backgroundSub,
                borderRadius: AppStyle.borderRadius,
              ),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  ...useItemList.map((e) {
                    return useItem(e['image']!, e['name']!);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
