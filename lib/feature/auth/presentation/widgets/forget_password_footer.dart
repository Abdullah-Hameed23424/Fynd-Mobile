import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/theme/app_colors.dart';

class ForgetPasswordFooter extends StatelessWidget {
  const ForgetPasswordFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedItem(
          index: 6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(22.r),
              border: Border.all(color: const Color(0xffD6E4FF)),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 17.5.r,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.shield_outlined,
                    size: 20.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Secure recovery',
                        style: context.bodyMedium16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'The One-Time Password (OTP) expires after a limited period of time',
                        style: context.headlineSmall12.copyWith(
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 18.h),

        AnimatedItem(
          index: 7,
          child: Text(
            'Remember your password?',
            style: context.bodySmall14.copyWith(color: AppColors.textGray),
          ),
        ),
        AnimatedItem(
          index: 8,
          child: TextButton(
            onPressed: NavigationCoordinator.toLogin,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              surfaceTintColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14.r),
              ),
            ),
            child: Text(
              'Back to sign in',
              style: context.titleSmall12.copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
