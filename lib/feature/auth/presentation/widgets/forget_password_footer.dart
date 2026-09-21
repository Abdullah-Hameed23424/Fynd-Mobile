import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class ForgetPasswordFooter extends StatelessWidget {
  final GlobalKey<FormState> forgetPasswordKey;
  final TextEditingController emailController;
  const ForgetPasswordFooter({
    super.key,
    required this.forgetPasswordKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ForgetPasswordSuccess) {
              NavigationCoordinator.toOtp(
                args: OtpArguments(email: emailController.text.trim()),
              );
              snackBarService.showSuccess(
                message:
                    'The verification code (OTP) has been sent successfully',
              );
            } else if (state is ForgetPasswordError) {
              snackBarService.showError(message: state.msg);
            }
          },
          builder: (context, state) {
            if (state is ForgetPasswordLoading) {
              return const AppLoading();
            }
            return AnimatedItem(
              index: 5,
              child: CustomButton(
                label: 'Send reset link',
                onPressed: () {
                  if (!forgetPasswordKey.currentState!.validate()) return;
                  context.read<AuthBloc>().add(
                    ForgetPasswordEvent(email: emailController.text.trim()),
                  );
                },
                radius: 14.r,
              ),
            );
          },
        ),

        SizedBox(height: 30.h),

        AnimatedItem(
          index: 6,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 17.5.r,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.done,
                    size: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Secure recovery',
                        style: context.bodyMedium16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'The One-Time Password (OTP) expires after a limited period of time',
                        style: context.headlineSmall12.copyWith(
                          color: AppColors.textGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 56.h),

        AnimatedItem(
          index: 7,
          child: Text(
            'Remember your password?',
            style: context.bodySmall14.copyWith(color: AppColors.textGray),
          ),
        ),
        AnimatedItem(
          index: 8,
          child: TextButton(
            onPressed: NavigationCoordinator.toLogin,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              surfaceTintColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14.r),
              ),
            ),
            child: Text(
              'Back to sign in',
              style: context.titleSmall12.copyWith(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}
