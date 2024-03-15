import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:blog/core/constant/app_data.dart';
import 'package:blog/core/models/data/project_list_model.dart';
import 'package:blog/home/components/project_detail_modal.dart';

/// 프로젝트 & 포트폴리오 리스트
/// [webUrl] 의 경우 WebPage 로 이동
/// [aosUrl] 의 경우 Android App 으로 이동
/// [iosUrl] 의 경우 Ios App 으로 이동
/// Mouse Hover 시 Focus 블러하여 해당 프로젝트에 대한 설명을 보여준다.
/// 상세보기 버튼 클릭시 해당 프로젝트에 대한 상세 페이지로 이동 (Web 의 경우 해당 페이지로 이동)
/// 그외는 여러장의 이미지를 보여준다.
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
        imageUrlList: [
          'project/everycharge/everycharge_main.webp',
          'project/everycharge/everycharge_01.webp',
          'project/everycharge/everycharge_02.webp',
          'project/everycharge/everycharge_03.webp',
          'project/everycharge/everycharge_04.webp',
          'project/everycharge/everycharge_05.webp',
        ],
        aosUrl: 'https://play.google.com/store/apps/details?id=org.ScalarData.EveryCharge',
        iosUrl: 'https://apps.apple.com/kr/app/id1565921202'),
    ProjectListModel(
      title: '하이차지',
      description: '전국 실시간 수소차 충전소 안내 서비스',
      imageUrlList: [
        'project/hycharge/hycharge_main.webp',
        'project/hycharge/hycharge_01.webp',
        'project/hycharge/hycharge_02.webp',
        'project/hycharge/hycharge_03.webp',
        'project/hycharge/hycharge_04.webp',
        'project/hycharge/hycharge_05.webp',
        'project/hycharge/hycharge_06.webp',
      ],
      iosUrl: 'https://apps.apple.com/kr/app/id6449397480',
    ),
    ProjectListModel(
      title: '5초 광고',
      description: '지역기반 숏폼(5초) 광고 및 제작 서비스',
      imageUrlList: [
        'project/fivesec/fivesec_main.webp',
        'project/fivesec/fivesec_01.webp',
        'project/fivesec/fivesec_02.webp',
        'project/fivesec/fivesec_03.webp',
        'project/fivesec/fivesec_04.webp',
        'project/fivesec/fivesec_05.webp',
      ],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.fivesec.fivesecapp',
      iosUrl: 'https://apps.apple.com/kr/app/id6444328529',
    ),
    ProjectListModel(
      title: '웰카',
      description: '차량 구매 및 시공 등 차량 관련 용품 판매 서비스',
      imageUrlList: ['project/welcar/welcar_main.webp'],
      webUrl: 'https://m.welcar.org/',
    ),
    ProjectListModel(
      title: '트릿',
      description: '트리니티 브랜드 호텔 마사지 예약 서비스',
      imageUrlList: [
        'project/treat/treat_main.webp',
        'project/treat/treat_01.webp',
        'project/treat/treat_02.webp',
        'project/treat/treat_03.webp',
        'project/treat/treat_04.webp',
        'project/treat/treat_05.webp',
        'project/treat/treat_06.webp',
      ],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.lnkwellness.spa',
      iosUrl: 'https://apps.apple.com/kr/app/id1670037715',
    ),
    ProjectListModel(
      title: '빌드하다',
      description: '건축(설계, 시공, 유지보수, 인테리어) 올인원 서비스',
      imageUrlList: [
        'project/buildhada/buildhada_main.webp',
        'project/buildhada/buildhada_01.webp',
        'project/buildhada/buildhada_02.webp',
        'project/buildhada/buildhada_03.webp',
        'project/buildhada/buildhada_04.webp',
        'project/buildhada/buildhada_05.webp',
        'project/buildhada/buildhada_06.webp',
        'project/buildhada/buildhada_07.webp',
        'project/buildhada/buildhada_08.webp',
        'project/buildhada/buildhada_09.webp',
        'project/buildhada/buildhada_10.webp',
        'project/buildhada/buildhada_11.webp',
      ],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.rightcode.build',
      iosUrl: 'https://apps.apple.com/kr/app/id6473385944',
    ),
    ProjectListModel(
      title: '메디바디',
      description: '헬스 케어 및 관련 용품 중고거래 및 판매 서비스',
      imageUrlList: [
        'project/medibody/medibody_main.webp',
        'project/medibody/medibody_01.webp',
        'project/medibody/medibody_02.webp',
        'project/medibody/medibody_03.webp',
        'project/medibody/medibody_04.webp',
        'project/medibody/medibody_05.webp',
      ],
      aosUrl: 'https://play.google.com/store/apps/details?id=com.rightcode.medibody',
    ),
    ProjectListModel(
      title: 'C0routine Blog',
      description: '개인 블로그',
      imageUrlList: ['project/blog/blog_2.webp'],
      webUrl: 'https://c0routine.github.io/',
    ),
  ];

  /// 현재 Focus 된 Index
  int focusIndex = 0;

  /// 현재 Hover 된 Index
  int? hoverIndex;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 300,
        maxWidth: 1000,
        maxHeight: 560,
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
            hoverIndex = null;
          });
        },
        itemBuilder: (context, itemIndex, realIndex) {
          final project = projectList[itemIndex];

          return MouseRegion(
            onHover: (event) {
              setState(() {
                hoverIndex = itemIndex;
              });
            },
            onExit: (event) {
              setState(() {
                hoverIndex = null;
              });
            },
            child: Container(
              margin: (hoverIndex == null ? itemIndex == focusIndex : itemIndex == hoverIndex)
                  ? const EdgeInsets.symmetric(horizontal: 10)
                  : const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: CachedNetworkImageProvider('$blogAsset${project.imageUrlList.first}'),
                  fit: project.webUrl == null ? BoxFit.cover : BoxFit.contain,
                ),
              ),
              child: (hoverIndex == null ? itemIndex == focusIndex : itemIndex == hoverIndex)
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            project.title,
                            style: TextStyle(fontSize: 22.spMin, color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              project.description.replaceAllMapped(RegExp(r'(\S)(?=\S)'), (m) => '${m[1]}\u200D'),
                              style: TextStyle(fontSize: 15.spMin, color: Colors.white, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              /// WebUrl 이 존재할 경우 WebPage 로 이동
                              if (project.webUrl != null) {
                                window.open(project.webUrl!, '_blank');
                                return;
                              }

                              return showDialog(
                                context: context,
                                barrierColor: Colors.black54.withOpacity(0.8),
                                builder: (BuildContext context) {
                                  return ProjectDetailModal(project: project);
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightGreen,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (project.webUrl != null) ...[
                                  Icon(CupertinoIcons.link, color: Colors.white, size: 15.spMin),
                                  const SizedBox(width: 5),
                                ],
                                Text(
                                  '상세보기',
                                  style: TextStyle(fontSize: 15.spMin, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
