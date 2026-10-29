import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/time_formatter.dart';
import 'package:fynd/feature/notifications/domain/entities/notification_entity.dart';
import 'package:fynd/feature/notifications/presentation/cubit/notifications_cubit.dart';

class NotificationCard extends StatelessWidget {
  final NotificationEntity notification;
  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: !notification.isRead ? AppColors.primaryLight : Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      child: InkWell(
        onTap: () {
          context.read<NotificationsCubit>().markAsRead(id: notification.id);
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: !notification.isRead
                  ? const Color(0xffD7E6FF)
                  : const Color(0xffE0E5ED),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 44.w,
                height: 44.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.primary,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            notification.title,
                            style: context.bodyMedium16.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (!notification.isRead) ...<Widget>[
                          SizedBox(width: 8.w),
                          Container(
                            width: 8.w,
                            height: 8.w,
                            margin: EdgeInsets.only(top: 6.h),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      notification.message,
                      style: context.headlineSmall12.copyWith(
                        color: AppColors.textGray,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      TimeFormatter.format(
                        notification.createdAt ?? DateTime.now(),
                      ),
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
    );
  }
}
