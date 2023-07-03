import 'package:blog/utils/app_color.dart';
import 'package:blog/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProfileProject extends StatefulWidget {
  const ProfileProject({Key? key, required this.projectController}) : super(key: key);

  final AnimationController projectController;

  @override
  State<ProfileProject> createState() => _ProfileProjectState();
}

class _ProfileProjectState extends State<ProfileProject> {
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _opacity = Tween(begin: 0.0, end: 1.0)
        .chain(
          CurveTween(curve: Curves.easeOutQuint),
        )
        .animate(widget.projectController);
  }

  Widget projectImage() {
    return Container(
      margin: AppStyle.gapAll,
      padding: AppStyle.gapAll,
      decoration: BoxDecoration(
        color: AppColor.backgroundSub,
        borderRadius: AppStyle.borderRadius,
      ),
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          Image.asset(
            'assets/project/hycharge_1.webp',
            width: 250,
            // height: 541,
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/project/hycharge_2.webp',
            width: 250,
            // height: 541,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          FadeTransition(
            opacity: _opacity,
            child: Text('Project', style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 20),
          Text('실시간 수소차 충전정보 서비스를 제공하는 앱', style: Theme.of(context).textTheme.bodyMedium),
          projectImage(),
        ],
      ),
    );
  }
}
