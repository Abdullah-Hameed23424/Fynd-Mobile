import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/posts_dependencies.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/core/widgets/loading_dialog.dart';
import 'package:fynd/feature/posts/presentation/cubit/posts_cubit.dart';
import 'package:fynd/feature/posts/presentation/widgets/create_post_form.dart';
import 'package:fynd/feature/posts/presentation/widgets/post_type_selector.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  int? type;
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _locationController;
  DateTime? _selectedDate;
  int? _categoryId;
  late GlobalKey<LoadingDialogState> _loadKey;
  late final GlobalKey<FormState> _createPostKey;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _locationController = TextEditingController();
    _loadKey = GlobalKey<LoadingDialogState>();
    _createPostKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => createPostsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedItem(
            index: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Create post'),
                SizedBox(height: 4.h),
                Text(
                  'Help return an item to its owner',
                  style: context.bodyMedium16.copyWith(
                    color: AppColors.textGray,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Form(
          key: _createPostKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            children: <Widget>[
              SizedBox(height: 18.h),
              AnimatedItem(
                index: 2,
                child: FormField(
                  validator: (value) {
                    if (type == null) {
                      return 'Please choose a type';
                    }
                    return null;
                  },
                  builder: (field) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      PostTypeSelector(
                        leftBtnLabel: 'lost something',
                        rightBtnLabel: 'found something',
                        onChanged: (value) {
                          type = value;
                        },
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
                  ),
                ),
              ),

              SizedBox(height: 18.h),
              CreatePostForm(
                titleController: _titleController,
                descriptionController: _descriptionController,
                locationController: _locationController,
                onChangedDateAndCategory: (value) {
                  _selectedDate = value['pickedDate'];
                  _categoryId = value['categoryId'];
                },
              ),

              SizedBox(height: 18.h),
              BlocConsumer<PostsCubit, PostsState>(
                listener: (context, state) {
                  if (state is CreatePostLoading) {
                    LoadingDialog.show(_loadKey);
                    return;
                  }
                  if (state is CreatePostSuccess) {
                    LoadingDialog.hide(_loadKey);
                    snackBarService.showSuccess(
                      message: 'Has been create post Successfully',
                    );
                    NavigationCoordinator.toNavBar(
                      args: NavBarArguments(index: 0),
                    );
                    return;
                  }
                  if (state is CreatePostError) {
                    LoadingDialog.hide(_loadKey);
                    snackBarService.showError(message: state.msg);
                    return;
                  }
                },
                builder: (context, state) {
                  return AnimatedItem(
                    index: 13,
                    child: CustomButton(
                      label: 'Create Post',
                      onPressed: () {
                        if (!_createPostKey.currentState!.validate()) return;
                        context.read<PostsCubit>().createPost(
                          data: {
                            'type': type,
                            'title': _titleController.text.trim(),
                            'description': _descriptionController.text.trim(),
                            'location': _locationController.text.trim(),
                            'date':
                                _selectedDate?.toIso8601String() ??
                                DateTime.now().toIso8601String(),
                            'categoryId': _categoryId,
                          },
                        );
                      },
                      radius: 22.r,
                      backgroundColor: Colors.transparent,
                    ),
                  );
                },
              ),

              SizedBox(height: 22.h),
            ],
          ),
        ),
      ),
    );
  }
}
