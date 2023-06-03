import 'package:flutter/material.dart';

import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';

class ProfileAboutMe extends StatefulWidget {
  const ProfileAboutMe({Key? key, required this.titleController, required this.bodyController}) : super(key: key);

  final AnimationController titleController;
  final AnimationController bodyController;

  @override
  State<ProfileAboutMe> createState() => _ProfileAboutMeState();
}

class _ProfileAboutMeState extends State<ProfileAboutMe> with TickerProviderStateMixin {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeTransition(
          opacity: _titleOpacity,
          child: Text('About Me', style: Theme.of(context).textTheme.titleLarge),
        ),
        FadeTransition(
          opacity: _bodyOpacity,
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
      ],
    );
  }
}
