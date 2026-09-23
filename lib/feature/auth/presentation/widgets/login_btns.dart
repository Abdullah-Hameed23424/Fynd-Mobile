import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/navigation/route_arguments.dart';
import 'package:fynd/core/services/snackbar_service.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/widgets/app_loading.dart';
import 'package:fynd/core/widgets/custom_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class LoginBtns extends StatelessWidget {
  final GlobalKey<FormState> loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginBtns({
    super.key,
    required this.loginKey,
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
            if (state is LoginSuccess) {
              NavigationCoordinator.toNavBar(args: NavBarArguments(index: 0));
              snackBarService.showSuccess(message: 'Logged in successfully');
            } else if (state is LoginError) {
              snackBarService.showError(message: state.msg);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const AppLoading();
            }
            return AnimatedItem(
              index: 8,
              child: CustomButton(
                label: 'Sign In',
                backgroundColor: Colors.transparent,
                onPressed: () {
                  if (!loginKey.currentState!.validate()) return;
                  context.read<AuthBloc>().add(
                    LoginEvent(
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

        SizedBox(height: 14.h),

        AnimatedItem(
          index: 9,
          child: Text(
            'OR',
            style: context.titleSmall12.copyWith(
              fontWeight: FontWeight.normal,
              color: AppColors.textGray,
            ),
          ),
        ),

        SizedBox(height: 14.h),

        AnimatedItem(
          index: 10,
          child: CustomButton(
            label: 'Continue with Google',
            onPressed: () {},
            radius: 14.r,
            backgroundColor: Colors.white,
            border: const BorderSide(color: Color(0xffE2E9F0), width: 1),
            buttonStyle: context.bodyMedium16.copyWith(
              fontWeight: FontWeight.bold,
            ),
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: AppColors.primary,
            ),
            elevation: 0,
          ),
        ),
      ],
    );
  }
}
