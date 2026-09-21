import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/config/app_config.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/theme/app_colors.dart';

class TryAgain extends StatelessWidget {
  const TryAgain({
    super.key,
    required this.onTap,
    required this.message,
    this.small = false,
  });

  final VoidCallback onTap;
  final String message;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.errorImage, width: small ? 125.w : 215.w),
            SizedBox(height: small ? 8.h : 35.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConfig.defaultFontFamily,
                  color: AppColors.primary,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(height: small ? 14.h : 35.h),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(0.6.sw, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppConfig.defaultFontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
