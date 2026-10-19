import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/feature/profile/domain/entities/profile_entity.dart';

class ProfileHeader extends StatelessWidget {
  final ProfileEntity profileEntity;
  const ProfileHeader({super.key, required this.profileEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 35.r,
            backgroundColor: AppColors.primary.withAlpha(40),
            child: Text(
              profileEntity.userName[0].toUpperCase(),
              style: context.headlineMedium24.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                profileEntity.userName,
                style: context.bodyLarge20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                profileEntity.email,
                style: context.headlineSmall12.copyWith(
                  color: AppColors.textGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
