import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/time_formatter.dart';
import 'package:fynd/core/widgets/custom_post_badge.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';

class MainDetailsSection extends StatelessWidget {
  final PostEntity postData;
  const MainDetailsSection({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomPostBadge(postType: postData.type),
                Text(
                  TimeFormatter.format(postData.createdAt ?? DateTime.now()),
                  style: context.headlineSmall12.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 14.h),

          AnimatedItem(
            index: 2,
            child: Container(
              height: 180.h,
              decoration: BoxDecoration(
                color: const Color(0xffF3F4F6),
                borderRadius: BorderRadius.circular(20.r),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                AppImages.appLogo,
                height: 100.h,
                width: 100.w,
              ),
            ),
          ),

          SizedBox(height: 14.h),

          AnimatedItem(
            index: 3,
            child: Text(
              postData.title,
              style: context.titleMedium19.copyWith(fontSize: 24.sp),
            ),
          ),

          SizedBox(height: 6.h),

          AnimatedItem(
            index: 4,
            child: Text(
              postData.description,
              style: context.headlineSmall12.copyWith(
                color: AppColors.textGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
