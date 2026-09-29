import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/posts/domain/params/post_filter.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';

// ignore: must_be_immutable
class CategoriesMenu extends StatelessWidget {
  PostFilter? filter;
  final ValueChanged<int?>? onSelected;
  final double menuWidth;
  final FormFieldValidator<String>? validator;
  CategoriesMenu({
    super.key,
    this.filter,
    this.onSelected,
    required this.menuWidth,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is CategoriesError) {
          return TryAgain(
            onTap: context.read<PostsCubit>().getCategories,
            message: state.msg,
          );
        }
        return FormField<String>(
          initialValue: filter?.categoryId.toString(),
          validator: validator,
          builder: (field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownMenu<int>(
                  width: menuWidth,
                  hintText: 'Choose a Category',
                  textStyle: context.bodyMedium16,

                  inputDecorationTheme: InputDecorationTheme(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(color: Color(0xffE0E5ED)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(color: Color(0xffE0E5ED)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 1.2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(color: AppColors.errorColor),
                    ),
                    hintStyle: context.bodyMedium16.copyWith(
                      color: AppColors.textGray,
                    ),
                  ),

                  menuHeight: 250.h,

                  menuStyle: MenuStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      AppColors.primaryLight,
                    ),
                    elevation: const WidgetStatePropertyAll(4),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                    ),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 6.h),
                    ),
                  ),

                  trailingIcon: state is CategoriesLoading
                      ? const AppLoading()
                      : null,

                  initialSelection: filter?.categoryId,

                  onSelected: (value) {
                    field.didChange(value.toString());
                    onSelected?.call(value);
                  },

                  dropdownMenuEntries: state is CategoriesLoaded
                      ? state.categories.map((category) {
                          return DropdownMenuEntry<int>(
                            value: category.id,
                            label: category.name,
                            labelWidget: Text(
                              category.name,
                              style: context.bodyMedium16,
                            ),
                          );
                        }).toList()
                      : [],
                ),

                if (field.hasError)
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 12.w),
                    child: Text(
                      field.errorText!,
                      style: context.headlineSmall12.copyWith(
                        color: AppColors.errorColor,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
