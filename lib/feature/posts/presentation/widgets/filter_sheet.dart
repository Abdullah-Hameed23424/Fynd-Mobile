import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/screens/helper/posts_helper.dart';
import 'package:fynd/feature/posts/presentation/widgets/categories_menu.dart';
import 'package:fynd/feature/posts/presentation/widgets/post_type_selector.dart';

// ignore: must_be_immutable
class FilterSheet extends StatelessWidget {
  PostFilter filter;
  final ScrollController scrollController;
  final PostsCubit baseCubit;
  final ValueChanged<PostFilter> onChanged;
  FilterSheet({
    super.key,
    required this.filter,
    required this.scrollController,
    required this.baseCubit,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsCubit>(
      create: (context) => createPostsCubit()..getCategories(),
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: const BoxDecoration(
          color: Color(0xffF8FAFC),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel, color: AppColors.errorColor),
                ),
              ),

              SizedBox(height: 14.h),
              Text('Category', style: context.titleSmall12),
              SizedBox(height: 7.h),
              CategoriesMenu(
                filter: filter,
                onSelected: (categoryId) =>
                    PostsHelper.onSelectedCategory(categoryId, filter),
                menuWidth: 1.sw - 24.w,
              ),
              SizedBox(height: 14.h),

              Text('Type', style: context.titleSmall12),
              SizedBox(height: 7.h),
              PostTypeSelector(
                leftBtnLabel: 'Lost',
                rightBtnLabel: 'Found',
                filter: filter,
                onChanged: (value) {
                  filter = filter.copyWith(type: value);
                  log(filter.type.toString());
                },
              ),
              SizedBox(height: 14.h),

              SizedBox(height: 60.h),
              CustomButton(
                label: 'Send',
                onPressed: () {
                  baseCubit.getPosts(filter: filter);
                  onChanged.call(filter);
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                radius: 14.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
