import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileAboutMe extends StatefulWidget {
  const ProfileAboutMe({Key? key, required this.bodyController, required this.headerController}) : super(key: key);

  final AnimationController bodyController;
  final AnimationController headerController;

  @override
  State<ProfileAboutMe> createState() => _ProfileAboutMeState();
}

class _ProfileAboutMeState extends State<ProfileAboutMe> with TickerProviderStateMixin {
  late Animation<double> _titleOpacity;
  late Animation<double> _bodyScale;

  @override
  void initState() {
    super.initState();
    _titleOpacity = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.decelerate),
        )
        .animate(widget.headerController);

    _bodyScale = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.decelerate),
        )
        .animate(widget.bodyController);
  }

  @override
  Widget build(BuildContext context) {
    final useItemList = [
      {'name': 'Flutter', 'svg': 'flutter.svg'},
      {'name': 'React Native', 'svg': 'react.svg'},
      {'name': 'Dart', 'svg': 'dart.svg'},
      {'name': 'Kotlin', 'svg': 'kotlin.svg'},
      {'name': 'JavaScript', 'svg': 'javascript.svg'},
      {'name': 'TypeScript', 'svg': 'typescript.svg'},
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: _titleOpacity,
          child: Text('About Me', style: Theme.of(context).textTheme.titleLarge),
        ),
        ScaleTransition(
          scale: _bodyScale,
          child: Container(
            margin: AppStyle.gapAll,
            padding: AppStyle.gapAll,
            decoration: BoxDecoration(
              color: AppColor.backgroundSub,
              borderRadius: BorderRadius.circular(16),
            ),
            constraints: BoxConstraints(maxWidth: 800),
            child: Text(
                '현재 Flutter 를 사용하여 프론트엔드 개발을 하고 있습니다.'
                '\n사용자 경험(UX) 과 최적화 부분에 많은 관심을 가지고 있습니다.'
                '\n장기적으로는 사람들에게 도움이 되는 서비스를 만들고 운영하고 싶습니다!',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        Text('Use', style: Theme.of(context).textTheme.titleLarge),
        Container(
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
      ],
    );
  }
}
