import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RectangleFrame extends StatelessWidget {
  const RectangleFrame({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  final String imageUrl;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 450,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey, width: 1.w),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          title,
          style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          description,
          style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w400, color: Colors.white),
        ),
      ],
    );
  }
}
