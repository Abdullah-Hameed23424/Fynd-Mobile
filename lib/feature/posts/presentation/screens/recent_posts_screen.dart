import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card_shimmer.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';

class RecentPostsScreen extends StatelessWidget {
  const RecentPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => createPostsCubit()..getRecentPosts(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          leading: PopButton(),
          title: const Text('Recent Posts'),
        ),
        body: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            if (state is RecentPostsLoading) {
              return SliverList.separated(
                itemBuilder: (context, index) => const RecentPostCardShimmer(),
                separatorBuilder: (context, index) => SizedBox(height: 14.h),
                itemCount: 7,
              );
            } else if (state is RecentPostsError) {
              return SliverToBoxAdapter(
                child: TryAgain(
                  onTap: () {
                    context.read<PostsCubit>().getRecentPosts();
                  },
                  message: state.msg,
                ),
              );
            } else if (state is RecentPostsLoaded) {
              final recentPosts = state.recentPosts;
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
        ),
      ),
    );
  }
}
