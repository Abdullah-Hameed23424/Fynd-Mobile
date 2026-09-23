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
import 'package:fynd/feature/auth/presentation/widgets/password_info_card.dart';

class RegisterBtn extends StatelessWidget {
  final GlobalKey<FormState> registerKey;
  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterBtn({
    super.key,
    required this.registerKey,
    required this.fullnameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const PasswordInfoCard(animationIndex: 9, color: Color(0xffF8FAFC)),

        SizedBox(height: 14.h),

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
            return AnimatedItem(
              index: 10,
              child: CustomButton(
                backgroundColor: Colors.transparent,
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
      ],
    );
  }
}
