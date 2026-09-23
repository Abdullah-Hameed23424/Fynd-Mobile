import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(AppImages.appLogo, width: 96.w, height: 96.w),

          SizedBox(height: 18.h),
          Text('Fynd', style: context.titleLarge32),
          SizedBox(height: 10.h),
          Text(
            'Find it. Return it. Together.',
            style: context.bodySmall14.copyWith(color: AppColors.textGray),
          ),

          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: const Color(0xffF8FAFC),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: const Color(0xffE0E5ED)),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  'A premium community for lost and found',
                  style: context.bodySmall14.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Beautifully designed for every step of the journey.',
                  style: context.bodySmall14.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
