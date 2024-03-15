import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:collection/collection.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:blog/core/constant/app_data.dart';
import 'package:blog/core/models/data/project_list_model.dart';

class ProjectDetailModal extends StatefulWidget {
  const ProjectDetailModal({super.key, required this.project});

  final ProjectListModel project;

  @override
  State<ProjectDetailModal> createState() => _ProjectDetailModalState();
}

class _ProjectDetailModalState extends State<ProjectDetailModal> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 300,
              maxWidth: 600,
              maxHeight: 560,
            ),
            child: InfiniteCarousel.builder(
              itemCount: widget.project.imageUrlList.length,
              itemExtent: 270,
              itemBuilder: (BuildContext context, int itemIndex, int realIndex) {
                final imageUrl = '$blogAsset${widget.project.imageUrlList[itemIndex]}';

                return Container(
                  margin: itemIndex == currentIndex ? const EdgeInsets.symmetric(horizontal: 10) : const EdgeInsets.all(10),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.cover),
                );
              },
              onIndexChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.project.imageUrlList.mapIndexed((index, imageUrl) {
              return Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == currentIndex ? Colors.lightGreen : Colors.transparent,
                  border: Border.all(color: index == currentIndex ? Colors.lightGreen : Colors.white, width: 2),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            child: Row(
              /// 2.584
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.project.aosUrl != null) ...[
                  GestureDetector(
                    onTap: () {
                      window.open(widget.project.aosUrl!, '_blank');
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SizedBox(
                        width: 140,
                        height: 54,
                        child: CachedNetworkImage(
                          imageUrl: '$asset${'icon/play_store.png'}',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ],
                const SizedBox(width: 12),
                if (widget.project.iosUrl != null) ...[
                  GestureDetector(
                    onTap: () {
                      window.open(widget.project.iosUrl!, '_blank');
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: SizedBox(
                        width: 140,
                        height: 54,
                        child: SvgPicture.network(
                          '$asset${'icon/app_store_black.svg'}',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
