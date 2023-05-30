import 'package:blog/utils/app_color.dart';
import 'package:blog/viewmodel/provider/responsive_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileAboutMe extends StatefulWidget {
  const ProfileAboutMe({Key? key}) : super(key: key);

  @override
  State<ProfileAboutMe> createState() => _ProfileAboutMeState();
}

class _ProfileAboutMeState extends State<ProfileAboutMe> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.select((ResponsiveVM vm) => vm.extend);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('About Me', style: Theme.of(context).textTheme.titleLarge),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColor.backgroundSub,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
              '현재 Flutter 를 사용한 프론트엔드 개발을 하고 있습니다.'
              '\n사용자 경험(UX) 과 최적화 부분에 많은 관심을 가지고 있습니다.'
              '\n장기적으로는 나만의 서비스를 만들고 운영하고 싶습니다!',
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
