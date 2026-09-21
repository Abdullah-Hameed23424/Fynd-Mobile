import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/widgets/app_shimmer.dart';

class RecentPostCardShimmer extends StatelessWidget {
  const RecentPostCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: const Color(0xffE0E5ED), width: 1.w),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 102.w,
              height: 102.w,
              decoration: BoxDecoration(
                color: const Color(0xffEDF0F5),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Image.asset(AppImages.appLogo),
            ),
          ],
        ),
      ),
    );
  }
}
