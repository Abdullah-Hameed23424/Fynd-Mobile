import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/Core/theme/app_colors.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/utils/custom_timer.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class OtpFooter extends StatelessWidget {
  final CustomTimer timer;
  final String email;
  final TextEditingController otpController;
  const OtpFooter({
    super.key,
    required this.timer,
    required this.email,
    required this.otpController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is VerifyOtpLoading) {
              return const AppLoading();
            }
            return AuthAnimatedItem(
              index: 4,
              child: CustomButton(
                label: 'Send',
                onPressed: () {
                  // if (!loginKey.currentState!.validate())
                  //   return;
                  context.read<AuthBloc>().add(
                    VerifyOtpEvent(
                      email: email,
                      otp: otpController.text.trim(),
                    ),
                  );
                },
                radius: 14.r,
              ),
            );
          },
        ),

        SizedBox(height: 28.h),

        AuthAnimatedItem(
          index: 5,
          child: ValueListenableBuilder<int>(
            valueListenable: timer.remainingSeconds,
            builder: (context, seconds, child) {
              return Text.rich(
                style: context.bodySmall14.copyWith(color: AppColors.textGray),
                TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(text: 'Resend code after '),
                    TextSpan(text: '00:${seconds.toString().padLeft(2, '0')}'),
                  ],
                ),
              );
            },
          ),
        ),

        SizedBox(height: 10.h),

        AuthAnimatedItem(
          index: 6,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                snackBarService.showSuccess(
                  message:
                      'The verification code (OTP) has been sent successfully',
                );
              } else if (state is ForgetPasswordError) {
                snackBarService.showError(message: state.msg);
              }
            },
            builder: (context, state) {
              return ValueListenableBuilder(
                valueListenable: timer.remainingSeconds,
                builder: (context, seconds, child) {
                  if (state is ForgetPasswordLoading) {
                    return const AppLoading();
                  }
                  return TextButton(
                    onPressed: (seconds == 0)
                        ? () {
                            context.read<AuthBloc>().add(
                              ForgetPasswordEvent(email: email),
                            );
                            timer.start(59);
                          }
                        : null,
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(14.r),
                      ),
                    ),
                    child: Text(
                      'Resend',
                      style: context.titleSmall12.copyWith(
                        color: (seconds == 0)
                            ? AppColors.primary
                            : AppColors.textGray,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
