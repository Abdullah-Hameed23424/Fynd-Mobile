import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class ForgetPasswordBtn extends StatelessWidget {
  final GlobalKey<FormState> forgetPasswordKey;
  final TextEditingController emailController;
  const ForgetPasswordBtn({
    super.key,
    required this.forgetPasswordKey,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          NavigationCoordinator.toOtp(
            args: OtpArguments(email: emailController.text.trim()),
          );
          snackBarService.showSuccess(
            message: 'The verification code (OTP) has been sent successfully',
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
            backgroundColor: Colors.transparent,
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
    );
  }
}
