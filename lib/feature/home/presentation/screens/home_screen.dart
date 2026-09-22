import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/home_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fynd/feature/home/presentation/widgets/browse_categories_section.dart';
import 'package:fynd/feature/home/presentation/widgets/info_card_widget.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_posts_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => createHomeCubit()..getHomeInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedItem(
            index: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Fynd'),
                SizedBox(height: 4.h),
                Text(
                  'Find it. Return it. Together.',
                  style: context.bodyMedium16.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 50.h),
            child: AnimatedItem(
              index: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomTextField(
                  controller: TextEditingController(),
                  radius: 14.r,
                  hintText: 'Search lost or found items…',
                  keyboardType: TextInputType.text,
                  onFieldSubmitted: (value) {},
                ),
              ),
            ),
          ),
          toolbarHeight: 100.h,
        ),

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),

              SliverToBoxAdapter(
                child: AnimatedItem(
                  index: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Recent Posts', style: context.titleMedium19),
                      TextButton(
                        onPressed: NavigationCoordinator.toRecentPosts,
                        style: TextButton.styleFrom(),
                        child: Text(
                          'See all',
                          style: context.headlineSmall12.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const RecentPostsSection(),

              SliverToBoxAdapter(child: SizedBox(height: 25.h)),
              SliverToBoxAdapter(
                child: AnimatedItem(
                  index: 3,
                  child: Text(
                    'Browse categories',
                    style: context.titleMedium19,
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
              const BrowseCategoriesSection(),
              SliverToBoxAdapter(child: SizedBox(height: 26.h)),

              const InfoCardWidget(),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            ],
          ),
        ),
      ),
    );
  }
}
