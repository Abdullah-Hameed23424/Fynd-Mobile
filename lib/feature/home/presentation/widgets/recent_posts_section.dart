import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/home/presentation/cubit/home_cubit.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card_shimmer.dart';

class RecentPostsSection extends StatelessWidget {
  const RecentPostsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SliverList.separated(
            itemBuilder: (context, index) => const RecentPostCardShimmer(),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: 3,
          );
        } else if (state is HomeError) {
          return SliverToBoxAdapter(
            child: TryAgain(onTap: () {}, message: state.msg),
          );
        } else if (state is HomeLoaded) {
          final recentPosts = state.homeEntity.recentPosts;
          return SliverList.separated(
            itemBuilder: (context, index) => AnimatedItem(
              index: index,
              child: RecentPostCard(recentPostEntity: recentPosts[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: recentPosts.take(7).length,
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
