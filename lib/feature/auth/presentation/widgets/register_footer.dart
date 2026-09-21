import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class RegisterFooter extends StatelessWidget {
  final GlobalKey<FormState> registerKey;
  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterFooter({
    super.key,
    required this.registerKey,
    required this.fullnameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              NavigationCoordinator.toNavBar(args: NavBarArguments(index: 0));
              snackBarService.showSuccess(
                message: 'The account has been successfully created',
              );
            } else if (state is RegisterError) {
              snackBarService.showError(message: state.msg);
            }
          },
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const AppLoading();
            }
            return AuthAnimatedItem(
              index: 9,
              child: CustomButton(
                label: 'Create account',
                onPressed: () {
                  if (!registerKey.currentState!.validate()) return;
                  context.read<AuthBloc>().add(
                    RegisterEvent(
                      fullname: fullnameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    ),
                  );
                },
                radius: 14.r,
              ),
            );
          },
        ),
        SizedBox(height: 12.h),
        AuthAnimatedItem(
          index: 10,
          child: Text(
            'Use 8+ characters with letters and numbers',
            style: context.headlineSmall12.copyWith(color: AppColors.textGray),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 20.h),

        AuthAnimatedItem(
          index: 11,
          child: Text.rich(
            TextSpan(
              style: context.bodySmall14.copyWith(color: AppColors.textGray),
              children: [
                const TextSpan(text: 'Already have an account? '),
                TextSpan(
                  text: 'Sign in',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      NavigationCoordinator.toLogin();
                    },
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 75.h),

        AuthAnimatedItem(
          index: 12,
          child: Text(
            'By creating an account, you agree to our Terms and Privacy Policy.',
            style: context.headlineSmall12.copyWith(color: AppColors.textGray),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
