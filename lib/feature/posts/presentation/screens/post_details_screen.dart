import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/posts/domain/entities/post_entity.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/details_btns_section.dart';
import 'package:fynd/feature/posts/presentation/widgets/main_details_section.dart';
import 'package:fynd/feature/posts/presentation/widgets/other_details_info_section.dart';
import 'package:fynd/feature/posts/presentation/widgets/post_details_shimmer.dart';

class PostDetailsScreen extends StatelessWidget {
  final int postId;
  final int postType;
  const PostDetailsScreen({
    super.key,
    required this.postId,
    required this.postType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) =>
          createPostsCubit()
            ..getPostDetails(postId: postId, postType: postType),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 70.w,
          leading: AnimatedItem(
            index: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20.w),
              height: 48.w,
              width: 48.w,
              child: const Center(child: PopButton()),
            ),
          ),
          title: AnimatedItem(
            index: 0,
            child: Text(
              'Item details',
              style: context.bodyLarge20.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is PostDetailsLoading) {
                return const PostDetailsShimmer();
              } else if (state is PostDetailsError) {
                return SizedBox(
                  height: 1.sh - 200.h,
                  child: Center(
                    child: TryAgain(
                      onTap: () {
                        context.read<PostsCubit>().getPostDetails(
                          postId: postId,
                          postType: postType,
                        );
                      },
                      message: state.msg,
                    ),
                  ),
                );
              } else if (state is PostDetailsLoaded) {
                final PostEntity postData = state.postEntity;
                return Column(
                  children: <Widget>[
                    MainDetailsSection(postData: postData),

                    SizedBox(height: 18.h),

                    OtherDetailsInfoSection(postData: postData),

                    SizedBox(height: 18.h),

                    DetailsBtnsSection(postData: postData),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
