import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/time_formatter.dart';
import 'package:fynd/core/widgets/custom_post_badge.dart';
import 'package:fynd/feature/home/domain/entities/recent_post_entity.dart';

class RecentPostCard extends StatelessWidget {
  final RecentPostEntity recentPostEntity;
  const RecentPostCard({super.key, required this.recentPostEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
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

          SizedBox(width: 12.w),

          Expanded(
            child: SizedBox(
              height: 102.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomPostBadge(postType: recentPostEntity.type),
                  ),

                  Text(
                    recentPostEntity.title,
                    style: context.bodyMedium16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 4.h),
                  Text.rich(
                    style: context.headlineSmall12.copyWith(
                      color: AppColors.textGray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    TextSpan(
                      children: <InlineSpan>[
                        TextSpan(text: recentPostEntity.location),
                        const TextSpan(text: ' · \n'),
                        TextSpan(
                          text: TimeFormatter.format(
                            recentPostEntity.createdAt ?? DateTime.now(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text.rich(
                    style: context.headlineSmall12.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: 'View details '),
                        WidgetSpan(
                          child: Icon(
                            Icons.arrow_forward,
                            size: 12.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
