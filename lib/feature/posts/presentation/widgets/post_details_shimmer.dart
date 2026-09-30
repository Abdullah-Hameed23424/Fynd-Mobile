import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/dimensions/dimensions.dart';
import 'package:fynd/core/widgets/app_shimmer.dart';

class PostDetailsShimmer extends StatelessWidget {
  const PostDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppShimmer(
          child: Container(
            height: 316.h,
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        AppShimmer(
          child: Container(
            height: 143.h,
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),
        SizedBox(height: 18.h),
        AppShimmer(
          child: Container(
            height: Dimensions.autoSize(58),
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        AppShimmer(
          child: Container(
            height: Dimensions.autoSize(58),
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
          ),
        ),
      ],
    );
  }
}
