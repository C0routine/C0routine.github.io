import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      {'name': 'Flutter', 'png': 'flutter.png'},
      {'name': 'React Native', 'png': 'react.png'},
      {'name': 'Firebase', 'png': 'firebase.png'},
      {'name': 'Dart', 'png': 'dart.png'},
      {'name': 'Kotlin', 'png': 'kotlin.png'},
      {'name': 'Java', 'png': 'java.png'},
      {'name': 'JavaScript', 'png': 'javascript.png'},
      {'name': 'TypeScript', 'png': 'typescript.png'},
      {'name': 'Github', 'png': 'github.png'},
      {'name': 'Slack', 'png': 'slack.png'},
      {'name': 'Notion', 'png': 'notion.png'},
      {'name': 'Figma', 'png': 'figma.png'},
      {'name': 'Markdown', 'png': 'markdown.png'},
      {'name': 'Vim', 'png': 'vim.png'},
      {'name': 'Android Studio', 'png': 'android_studio.png'},
      {'name': 'Xcode', 'png': 'xcode.png'},
      {'name': 'VSCode', 'png': 'vscode.png'},
      {'name': 'WebStorm', 'png': 'webstorm.png'},
    ];

    Widget useItem(String url, String text) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/logo/$url', width: 50, height: 50, fit: BoxFit.cover,),
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
                  return useItem(e['png']!, e['name']!);
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
