import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/profile_dependencies.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/confirmation_dialog.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/core/widgets/custom_card.dart';
import 'package:fynd/core/widgets/loading_dialog.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/core/widgets/title_and_description.dart';
import 'package:fynd/core/widgets/try_again.dart';
import 'package:fynd/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:fynd/feature/profile/presentation/widgets/edit_profile_form.dart';

class EditProfileScreen extends StatefulWidget {
  final VoidCallback onSuccess;
  const EditProfileScreen({super.key, required this.onSuccess});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late final GlobalKey<FormState> _editProfileKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _phoneNumberController;
  late final GlobalKey<LoadingDialogState> _loadKey;

  @override
  void initState() {
    _editProfileKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _loadKey = GlobalKey<LoadingDialogState>();
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => createProfileCubit()..getProfile(),
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
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomCard(
                          children: <Widget>[
                            const TitleAndDescription(
                              title: 'Edit Profile',
                              description:
                                  'Update and Manage Profile Information',
                            ),

                            SizedBox(height: 16.h),
                            BlocConsumer<ProfileCubit, ProfileState>(
                              listener: (context, state) {
                                log(state.runtimeType.toString());
                                if (state is EditProfileLoading) {
                                  LoadingDialog.show(_loadKey);
                                } else if (state is EditProfileError) {
                                  snackBarService.showError(message: state.msg);
                                } else if (state is EditProfileSuccess) {
                                  snackBarService.showSuccess(
                                    message: 'Done successfully',
                                  );
                                  context.read<ProfileCubit>().getProfile();
                                  widget.onSuccess.call();
                                  Navigator.pop(context);
                                }
                                LoadingDialog.hide(_loadKey);
                              },
                              builder: (context, state) {
                                if (state is ProfileLoading) {
                                  return const AppLoading();
                                } else if (state is ProfileError) {
                                  return TryAgain(
                                    onTap: () {
                                      context.read<ProfileCubit>().getProfile();
                                    },
                                    message: state.msg,
                                    small: true,
                                  );
                                }
                                if (context
                                    .read<ProfileCubit>()
                                    .profileDataLoaded) {
                                  if (_fullnameController.text.isEmpty) {
                                    _fullnameController.text = context
                                        .read<ProfileCubit>()
                                        .profileEntity
                                        .userName;
                                    _phoneNumberController.text = context
                                        .read<ProfileCubit>()
                                        .profileEntity
                                        .phoneNumber;
                                  }
                                  return EditProfileForm(
                                    editProfileKey: _editProfileKey,
                                    fullnameController: _fullnameController,
                                    phoneNumberController:
                                        _phoneNumberController,
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 16.h),

                        AnimatedItem(
                          index: 7,
                          child: CustomButton(
                            label: 'Update',
                            onPressed: () {
                              if (!_editProfileKey.currentState!.validate()) {
                                return;
                              }
                              ConfirmationDialog.show(
                                context,
                                title: 'Update Profile',
                                content: 'Are you sure?',
                                onConfirm: () {
                                  context.read<ProfileCubit>().editProfile(
                                    data: {
                                      'userName': _fullnameController.text
                                          .trim(),
                                      'phoneNumber': _phoneNumberController.text
                                          .trim(),
                                    },
                                  );
                                },
                              );
                            },
                            radius: 22.r,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
