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
    return Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.decelerate)).animate(controller);
  }

  @override
  void initState() {
    super.initState();

    _titleOpacity = animationSetting(widget.titleController);
    _bodyOpacity = animationSetting(widget.bodyController);
  }

  @override
  Widget build(BuildContext context) {
    final useItemList = [
      {'name': 'Flutter', 'svg': 'flutter.svg'},
      {'name': 'React Native', 'svg': 'react.svg'},
      {'name': 'Firebase', 'svg': 'firebase.svg'},
      {'name': 'Dart', 'svg': 'dart.svg'},
      {'name': 'Kotlin', 'svg': 'kotlin.svg'},
      {'name': 'Java', 'svg': 'java.svg'},
      {'name': 'JavaScript', 'svg': 'javascript.svg'},
      {'name': 'TypeScript', 'svg': 'typescript.svg'},
      {'name': 'Github', 'svg': 'github.svg'},
      {'name': 'Slack', 'svg': 'slack.svg'},
      {'name': 'Notion', 'svg': 'notion.svg'},
      {'name': 'Figma', 'svg': 'figma.svg'},
      {'name': 'Markdown', 'svg': 'markdown.svg'},
      {'name': 'Vim', 'svg': 'vim.svg'},
      {'name': 'Android Studio', 'svg': 'android_studio.svg'},
      {'name': 'Xcode', 'svg': 'xcode.svg'},
      {'name': 'VSCode', 'svg': 'vscode.svg'},
      {'name': 'WebStorm', 'svg': 'webstorm.svg'},
    ];

    Widget useItem(String url, String text) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('logo/$url', width: 50, height: 50),
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
                  return useItem(e['svg']!, e['name']!);
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
