import 'package:blog/core/models/data/project_list_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({super.key});

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  final List<ProjectListModel> projectList = [
    ProjectListModel(
      title: '모두의 충전',
      description: '실시간 전기차 충전소 안내 서비스',
      logoAsset: 'assets/logo/project_logo/everycharge.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: '5초 광고',
      description: '5초 광고 플랫폼',
      logoAsset: 'assets/logo/project_logo/5sec.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: '트릿',
      description: '마사지 예약 서비스',
      logoAsset: 'assets/logo/project_logo/treat.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: '빌드하다',
      description: '건설업 플랫폼',
      logoAsset: 'assets/logo/project_logo/buildhada.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: '웰카',
      description: '차량 서비스',
      logoAsset: 'assets/logo/project_logo/welcar.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: '메디바디',
      description: '건강 관리 서비스',
      logoAsset: 'assets/logo/project_logo/medibody.png',
      imageUrlList: [],
    ),
    ProjectListModel(
      title: 'Blog',
      description: '건강 관리 서비스',
      logoAsset: 'assets/logo/project_logo/everycharge.png',
      imageUrlList: [],
    ),
  ];

  int focusIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 1000,
        maxHeight: 480,
      ),
      child: InfiniteCarousel.builder(
        loop: true,
        center: true,
        itemExtent: 270,
        // velocityFactor: 0.2,
        itemCount: projectList.length,
        axisDirection: Axis.horizontal,
        onIndexChanged: (index) {
          setState(() {
            focusIndex = index;
          });
        },
        // controller: controller,
        itemBuilder: (context, itemIndex, realIndex) {
          final project = projectList[itemIndex];

          return Container(
            margin: itemIndex == focusIndex ? const EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 8.sp, color: Colors.white, fontWeight: FontWeight.w400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    child: CachedNetworkImage(imageUrl: project.logoAsset, fit: BoxFit.cover),
                  ),
                  Text('모두의 충전'),
                  Text('실시간 전기차 충전소 안내 서비스'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
