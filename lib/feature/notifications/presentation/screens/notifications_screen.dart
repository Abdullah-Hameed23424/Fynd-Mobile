import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/di/notifications_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/no_data.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/notifications/presentation/cubit/notifications_cubit.dart';
import 'package:fynd/feature/notifications/presentation/widgets/notification_card.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  void _markAllAsRead(BuildContext context) {
    context.read<NotificationsCubit>().markAllAsRead();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsCubit>(
      create: (context) => createNotificationsCubit()..getUnreadCount(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70.w,
          leading: AnimatedItem(
            index: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20.w),
              height: 48.w,
              width: 48.w,
              alignment: Alignment.center,
              child: const PopButton(),
            ),
          ),
          title: AnimatedItem(
            index: 0,
            child: Text(
              'Notifications',
              style: context.bodyLarge20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
          child: CustomScrollView(
            slivers: <Widget>[
              /// [Helper Texts]
              SliverToBoxAdapter(
                child: AnimatedItem(
                  index: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Stay in the loop',
                            style: context.titleMedium19,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            true == 0
                                ? 'You’re all caught up'
                                : 'You have 2 new '
                                      '${1 == 1 ? 'notification' : 'notifications'}',
                            style: context.bodyMedium16.copyWith(
                              color: AppColors.textGray,
                            ),
                          ),
                        ],
                      ),
                      if (1 > 0)
                        BlocConsumer<NotificationsCubit, NotificationsState>(
                          listener: (context, state) {
                            if (state is ReadAllSuccess) {
                              snackBarService.showSuccess(message: 'Job Done');
                            }
                          },
                          builder: (context, state) {
                            if (state is ReadAllLoading) {
                              return const AppLoading();
                            }
                            return TextButton(
                              onPressed: () => _markAllAsRead(context),
                              child: Text(
                                'Mark all read',
                                style: context.headlineSmall12.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 24.h)),

              /// [Notifications List]
              SliverPadding(
                padding: EdgeInsets.only(bottom: 10.h),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Notifications List',
                    style: context.titleMedium19,
                  ),
                ),
              ),
              BlocConsumer<NotificationsCubit, NotificationsState>(
                listener: (context, state) {
                  if (state is ReadOneSuccess) {
                    context.read<NotificationsCubit>().getAllNotifications();
                    snackBarService.showSuccess(message: 'Job Done');
                  } else if (state is ReadOneError) {
                    snackBarService.showError(message: state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is NotificationsLoading) {
                    return const SliverToBoxAdapter(child: AppLoading());
                  } else if (state is NotificationsError) {
                    return SliverToBoxAdapter(
                      child: TryAgain(
                        onTap: () {
                          context
                              .read<NotificationsCubit>()
                              .getAllNotifications();
                          context.read<NotificationsCubit>().getUnreadCount();
                        },
                        message: state.msg,
                      ),
                    );
                  } else if (context.read<NotificationsCubit>().dataLoaded) {
                    final response = context
                        .read<NotificationsCubit>()
                        .notificationResponseEntity;

                    if (context
                        .read<NotificationsCubit>()
                        .notificationResponseEntity
                        .notifications
                        .isEmpty) {
                      return const SliverToBoxAdapter(child: NoData());
                    }

                    return SliverList.separated(
                      itemBuilder: (context, index) {
                        return NotificationCard(
                          notification: response.notifications[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemCount: response.notifications.length,
                    );
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
