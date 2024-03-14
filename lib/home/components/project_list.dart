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
      description: '전국 실시간 전기차 충전소 안내 및 결제 서비스',
      logoAsset: 'assets/logo/project_logo/everycharge.png',
      imageUrlList: [],
      aosUrl: 'https://play.google.com/store/apps/details?id=org.ScalarData.EveryCharge',
      iosUrl: 'https://apps.apple.com/kr/app/id1565921202'
    ),
    ProjectListModel(
      title: '5초 광고',
      description: '지역기반 숏폼(5초) 광고 및 제작 서비스',
      logoAsset: 'assets/logo/project_logo/5sec.png',
      imageUrlList: [],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.fivesec.fivesecapp',
      iosUrl: 'https://apps.apple.com/kr/app/id6444328529'
    ),
    ProjectListModel(
      title: '웰카',
      description: '차량 구매 및 시공 등 차량 관련 용품 판매 서비스',
      logoAsset: 'assets/logo/project_logo/welcar.png',
      imageUrlList: [],
      webUrl: 'https://m.welcar.org/',
    ),
    ProjectListModel(
      title: '트릿',
      description: '지역기반 호텔 마사지 예약 서비스',
      logoAsset: 'assets/logo/project_logo/treat.png',
      imageUrlList: [],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.lnkwellness.spa',
      iosUrl: 'https://apps.apple.com/kr/app/id1670037715',
    ),
    ProjectListModel(
      title: '빌드하다',
      description: '소규모 건설을 위한 건축 올인원 서비스',
      logoAsset: 'assets/logo/project_logo/buildhada.png',
      imageUrlList: [],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.rightcode.build',
      iosUrl: 'https://apps.apple.com/kr/app/id6473385944',
    ),
    ProjectListModel(
      title: '메디바디',
      description: '헬스 케어 및 관련 용품 중고거래 및 판매 서비스',
      logoAsset: 'assets/logo/project_logo/medibody.png',
      imageUrlList: [],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.rightcode.medibody',
    ),
    ProjectListModel(
      title: 'Blog',
      description: '개인 블로그 및 포트폴리오',
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
        itemCount: projectList.length,
        axisDirection: Axis.horizontal,
        onIndexChanged: (index) {
          setState(() {
            focusIndex = index;
          });
        },
        itemBuilder: (context, itemIndex, realIndex) {
          final project = projectList[itemIndex];

          return Container(
            margin: itemIndex == focusIndex ? const EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: DefaultTextStyle(
              style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: CachedNetworkImage(imageUrl: project.logoAsset, fit: BoxFit.contain, height: 50),
                  ),
                  Text(project.title, style: TextStyle(),),
                  Text(project.description),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
