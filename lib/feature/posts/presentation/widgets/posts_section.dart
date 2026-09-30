import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card.dart';
import 'package:fynd/feature/home/presentation/widgets/recent_post_card_shimmer.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';

class PostsSection extends StatelessWidget {
  final VoidCallback onTap;

  final bool Function(PostsState state) isLoading;
  final String? Function(PostsState state) getErrorMessage;
  final List<PostEntity> Function(PostsState state) getPosts;

  const PostsSection({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.getErrorMessage,
    required this.getPosts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      sliver: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (isLoading(state)) {
            return SliverList.separated(
              itemBuilder: (context, index) => const RecentPostCardShimmer(),
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemCount: 7,
            );
          }

          final errorMessage = getErrorMessage(state);

          if (errorMessage != null) {
            return SliverToBoxAdapter(
              child: TryAgain(onTap: onTap, message: errorMessage),
            );
          }

          final posts = getPosts(state);

          return SliverList.separated(
            itemBuilder: (context, index) => AnimatedItem(
              index: index,
              child: RecentPostCard(recentPostEntity: posts[index]),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 14.h),
            itemCount: posts.length,
          );
        },
      ),
    );
  }
}

// class PostsSection extends StatelessWidget {
//   final VoidCallback onTap;
//   const PostsSection({super.key, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: EdgeInsets.symmetric(horizontal: 12.w),
//       sliver: BlocBuilder<PostsCubit, PostsState>(
//         builder: (context, state) {
//           if (state is RecentPostsLoading) {
//             return SliverList.separated(
//               itemBuilder: (context, index) => const RecentPostCardShimmer(),
//               separatorBuilder: (context, index) => SizedBox(height: 14.h),
//               itemCount: 7,
//             );
//           } else if (state is RecentPostsError) {
//             return SliverToBoxAdapter(
//               child: TryAgain(onTap: onTap, message: state.msg),
//             );
//           } else if (state is RecentPostsLoaded) {
//             final recentPosts = state.recentPosts;
//             return SliverList.separated(
//               itemBuilder: (context, index) => AnimatedItem(
//                 index: index,
//                 child: RecentPostCard(recentPostEntity: recentPosts[index]),
//               ),
//               separatorBuilder: (context, index) => SizedBox(height: 14.h),
//               itemCount: recentPosts.length,
//             );
//           }
//           return const SliverToBoxAdapter(child: SizedBox.shrink());
//         },
//       ),
//     );
//   }
// }
