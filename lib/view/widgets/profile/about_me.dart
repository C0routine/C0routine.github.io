import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: _titleOpacity,
          child: Text('About Me', style: Theme.of(context).textTheme.titleLarge),
        ),
        ScaleTransition(
          scale: _bodyScale,
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColor.backgroundSub,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
                '현재 Flutter 를 사용하여 프론트엔드 개발을 하고 있습니다.'
                '\n사용자 경험(UX) 과 최적화 부분에 많은 관심을 가지고 있습니다.'
                '\n장기적으로는 나만의 서비스를 만들고 운영하고 싶습니다!',
                style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
      ],
    );
  }
}
