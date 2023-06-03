import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileAboutMe extends StatefulWidget {
  const ProfileAboutMe({Key? key, required this.aboutMeController}) : super(key: key);

  final AnimationController aboutMeController;

  @override
  State<ProfileAboutMe> createState() => _ProfileAboutMeState();
}

class _ProfileAboutMeState extends State<ProfileAboutMe> with TickerProviderStateMixin {
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _opacity = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.easeOutQuint),
        )
        .animate(widget.aboutMeController);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: _opacity,
            child: Text('About Me', style: Theme.of(context).textTheme.titleLarge),
          ),
          FadeTransition(
            opacity: _opacity,
            child: Container(
              margin: AppStyle.gapAll,
              padding: AppStyle.gapAll,
              decoration: BoxDecoration(
                color: AppColor.backgroundSub,
                borderRadius: BorderRadius.circular(16),
              ),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                  '현재 Flutter 를 사용하여 프론트엔드 개발을 하고 있습니다.'
                  '\n사용자 경험(UX) 과 최적화 부분에 많은 관심을 가지고 있습니다.'
                  '\n장기적으로는 사람들에게 도움이 되는 서비스를 만들고 운영하고 싶습니다!',
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ),
        ],
      ),
    );
  }
}
