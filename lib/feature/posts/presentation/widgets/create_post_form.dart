import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/validators/empty_validator.dart';
import 'package:fynd/core/utils/validators/post_description_validator.dart';
import 'package:fynd/core/utils/validators/post_location_validator.dart';
import 'package:fynd/core/utils/validators/post_title_validator.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/categories_menu.dart';

class CreatePostForm extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController locationController;
  final ValueChanged<Map> onChangedDateAndCategory;
  const CreatePostForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.locationController,
    required this.onChangedDateAndCategory,
  });

  @override
  State<CreatePostForm> createState() => _CreatePostFormState();
}

class _CreatePostFormState extends State<CreatePostForm> {
  late final FocusNode _titleFocusNode;
  late final FocusNode _descriptionFocusNode;
  late final FocusNode _locationFocusNode;
  DateTime? _selectedDate;
  int? _categoryId;

  @override
  void initState() {
    super.initState();
    _titleFocusNode = FocusNode();
    _descriptionFocusNode = FocusNode();
    _locationFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _locationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 3,
            child: Text(
              'Title',
              style: context.titleSmall12.copyWith(color: AppColors.textGray),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.titleController,
              focusNode: _titleFocusNode,
              radius: 14.r,
              hintText: 'e.g. Black wallet',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: PostTitleValidator.validate,
              onFieldSubmitted: (_) {
                _descriptionFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 14.h),
          AnimatedItem(
            index: 5,
            child: Text(
              'Description',
              style: context.titleSmall12.copyWith(color: AppColors.textGray),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedItem(
            index: 6,
            child: CustomTextField(
              controller: widget.descriptionController,
              focusNode: _descriptionFocusNode,
              radius: 14.r,
              hintText: 'Describe the item...',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: PostDescriptionValidator.validate,
              maxLines: 4,
              onFieldSubmitted: (_) {
                _locationFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 14.h),
          AnimatedItem(
            index: 7,
            child: Text(
              'Location',
              style: context.titleSmall12.copyWith(color: AppColors.textGray),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedItem(
            index: 8,
            child: CustomTextField(
              controller: widget.locationController,
              focusNode: _locationFocusNode,
              radius: 14.r,
              hintText: 'Where was it lost/found?',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: PostLocationValidator.validate,
              onFieldSubmitted: (_) {
                // _descriptionFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 14.h),
          AnimatedItem(
            index: 9,
            child: Text(
              'Category',
              style: context.titleSmall12.copyWith(color: AppColors.textGray),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedItem(
            index: 10,
            child: BlocProvider<PostsCubit>(
              create: (context) => createPostsCubit()..getCategories(),
              child: CategoriesMenu(
                validator: EmptyValidator.validate,
                onSelected: (categoryId) => {
                  _categoryId = categoryId,
                  widget.onChangedDateAndCategory.call({
                    'pickedDate': _selectedDate,
                    'categoryId': categoryId,
                  }),
                },
                menuWidth: 1.sw - 60.w,
              ),
            ),
          ),
          SizedBox(height: 14.h),
          AnimatedItem(
            index: 11,
            child: Text(
              'Date',
              style: context.titleSmall12.copyWith(color: AppColors.textGray),
            ),
          ),
          SizedBox(height: 8.h),
          AnimatedItem(
            index: 12,
            child: InkWell(
              onTap: () async {
                // اختيار التاريخ
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (pickedDate == null) return;

                // اختيار الوقت
                final TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: _selectedDate != null
                      ? TimeOfDay.fromDateTime(_selectedDate!)
                      : TimeOfDay.now(),
                );

                if (pickedTime == null) return;

                // دمج التاريخ والوقت
                final DateTime selectedDateTime = DateTime(
                  pickedDate.year,
                  pickedDate.month,
                  pickedDate.day,
                  pickedTime.hour,
                  pickedTime.minute,
                );

                setState(() {
                  _selectedDate = selectedDateTime;
                });

                widget.onChangedDateAndCategory.call({
                  'pickedDate': selectedDateTime,
                  'categoryId': _categoryId,
                });
              },
              borderRadius: BorderRadius.circular(14.r),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: const Color(0xffE0E5ED)),
                ),
                child: Text(
                  _selectedDate == null
                      ? 'Select date & time'
                      : '${_selectedDate!.day.toString().padLeft(2, '0')}/'
                            '${_selectedDate!.month.toString().padLeft(2, '0')}/'
                            '${_selectedDate!.year} - '
                            '${_selectedDate!.hour.toString().padLeft(2, '0')}:'
                            '${_selectedDate!.minute.toString().padLeft(2, '0')}',
                  style: context.bodyMedium16.copyWith(
                    color: _selectedDate == null
                        ? AppColors.textGray
                        : AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
