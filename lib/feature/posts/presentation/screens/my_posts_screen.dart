import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_shimmer.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/posts_section.dart';

class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => createPostsCubit()..getMyPosts(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80.h,
          title: AnimatedItem(
            index: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('My Posts'),
                SizedBox(height: 4.h),
                Text(
                  'Manage the items you posted',
                  style: context.bodyMedium16.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: BlocBuilder<PostsCubit, PostsState>(
                  builder: (context, state) {
                    if (state is MyPostsLoading) {
                      return Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: AppShimmer(
                          child: Container(
                            width: 200.w,
                            height: 18.h,
                            color: Colors.white,
                          ),
                        ),
                      );
                    }
                    if (state is MyPostsLoaded) {
                      return AnimatedItem(
                        index: 0,
                        child: Text(
                          '${state.postResponseEntity.posts.length} result',
                          style: context.bodyMedium16.copyWith(
                            color: AppColors.textGray,
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),

            PostsSection(
              onTap: () {
                context.read<PostsCubit>().getMyPosts();
              },
              isLoading: (state) => state is MyPostsLoading,
              getErrorMessage: (state) =>
                  state is MyPostsError ? state.msg : null,
              getPosts: (state) => state is MyPostsLoaded
                  ? state.postResponseEntity.posts
                  : <PostEntity>[],
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20.h)),
          ],
        ),
      ),
    );
  }
}
