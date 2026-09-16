import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/screens/reset_password_screen.dart';

class ResetPasswordBtn extends StatelessWidget {
  const ResetPasswordBtn({
    super.key,
    required GlobalKey<FormState> resetPasswordKey,
    required this.widget,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _resetPasswordKey = resetPasswordKey,
       _passwordController = passwordController,
       _confirmPasswordController = confirmPasswordController;

  final GlobalKey<FormState> _resetPasswordKey;
  final ResetPasswordScreen widget;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccess) {
          NavigationCoordinator.toLogin();
          snackBarService.showSuccess(
            message: 'The password has been successfully reset',
          );
        } else if (state is ResetPasswordError) {
          snackBarService.showError(message: state.msg);
        }
      },
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return const AppLoading();
        }
        return AuthAnimatedItem(
          index: 7,
          child: CustomButton(
            label: 'Reset',
            onPressed: () {
              if (!_resetPasswordKey.currentState!.validate()) return;
              context.read<AuthBloc>().add(
                ResetPasswordEvent(
                  resetToken: widget.resetToken,
                  password: _passwordController.text.trim(),
                  confirmPassword: _confirmPasswordController.text.trim(),
                ),
              );
            },
            radius: 14.r,
          ),
        );
      },
    );
  }
}
