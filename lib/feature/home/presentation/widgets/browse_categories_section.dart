import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animation_config.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/feature/home/presentation/cubit/home_cubit.dart';

class BrowseCategoriesSection extends StatelessWidget {
  const BrowseCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SliverToBoxAdapter(child: Center(child: AppLoading()));
        } else if (state is HomeLoaded) {
          final categories = state.homeEntity.categories;
          return SliverToBoxAdapter(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 10.w,
              runSpacing: 10.h,
              children: List.generate(
                categories.length,
                (index) => FadeIn(
                  delay: Duration(
                    milliseconds: AnimationConfig.delayStep * index,
                  ),
                  duration: AnimationConfig.duration,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 4.h,
                    ),
                    width: 78.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(color: const Color(0xffE0E5ED)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      categories[index].name,
                      style: context.headlineSmall12.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
