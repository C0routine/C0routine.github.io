import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileUse extends StatefulWidget {
  const ProfileUse({Key? key, required this.titleController, required this.bodyController}) : super(key: key);

  final AnimationController titleController;
  final AnimationController bodyController;

  @override
  State<ProfileUse> createState() => _ProfileUseState();
}

class _ProfileUseState extends State<ProfileUse> with TickerProviderStateMixin {
  late Animation<double> _titleOpacity;
  late Animation<double> _bodyOpacity;

  // animation value 에 controller 할당
  Animation<double> animationSetting(AnimationController controller) {
    return Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeOutQuint)).animate(controller);
  }

  @override
  void initState() {
    super.initState();

    _titleOpacity = animationSetting(widget.titleController);
    _bodyOpacity = animationSetting(widget.bodyController);
  }

  @override
  Widget build(BuildContext context) {
    // TODO Web Release Svg Load 안되는 문제, webp 로 모두 변경 해야됨
    final useItemList = [
      {'name': 'Flutter', 'image': 'flutter.webp'},
      {'name': 'React Native', 'image': 'react.webp'},
      {'name': 'Firebase', 'image': 'firebase.webp'},
      {'name': 'Dart', 'image': 'dart.webp'},
      {'name': 'Kotlin', 'image': 'kotlin.webp'},
      {'name': 'Java', 'image': 'java.webp'},
      {'name': 'JavaScript', 'image': 'javascript.webp'},
      {'name': 'TypeScript', 'image': 'typescript.webp'},
      {'name': 'Github', 'image': 'github.webp'},
      {'name': 'Slack', 'image': 'slack.webp'},
      {'name': 'Notion', 'image': 'notion.webp'},
      {'name': 'Figma', 'image': 'figma.webp'},
      {'name': 'Markdown', 'image': 'markdown.webp'},
      {'name': 'Vim', 'image': 'vim.webp'},
      {'name': 'Android Studio', 'image': 'android_studio.webp'},
      {'name': 'Xcode', 'image': 'xcode.webp'},
      {'name': 'VSCode', 'image': 'vscode.webp'},
      {'name': 'WebStorm', 'image': 'webstorm.webp'},
    ];

    Widget useItem(String url, String text) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('/logo/$url', width: 50, height: 50, fit: BoxFit.cover,),
          const SizedBox(width: 10),
          Text(text, style: Theme.of(context).textTheme.titleSmall),
        ],
      );
    }

    return Column(
      children: [
        FadeTransition(
          opacity: _titleOpacity,
          child: Text('Use', style: Theme.of(context).textTheme.titleLarge),
        ),
        FadeTransition(
          opacity: _bodyOpacity,
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
    );
  }
}
