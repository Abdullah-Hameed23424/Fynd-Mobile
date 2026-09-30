import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/posts_section.dart';

class RecentPostsScreen extends StatelessWidget {
  const RecentPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => createPostsCubit()..getRecentPosts(),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 110.w,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const PopButton(),
              AnimatedItem(
                index: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 45.w,
                    height: 45.h,
                  ),
                ),
              ),
            ],
          ),
          title: const AnimatedItem(index: 0, child: Text('Recent Posts')),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            PostsSection(
              onTap: () {
                context.read<PostsCubit>().getRecentPosts();
              },

              isLoading: (state) => state is RecentPostsLoading,

              getErrorMessage: (state) =>
                  state is RecentPostsError ? state.msg : null,

              getPosts: (state) => state is RecentPostsLoaded
                  ? state.recentPosts
                  : <PostEntity>[],
            ),
          ],
        ),
      ),
    );
  }
}
