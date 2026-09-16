import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/di/auth_dependencies.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/widgets/reset_password_btn.dart';
import 'package:fynd/feature/auth/presentation/widgets/reset_password_form.dart';
import 'package:fynd/feature/auth/presentation/widgets/title_and_description.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String resetToken;
  const ResetPasswordScreen({super.key, required this.resetToken});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final GlobalKey<FormState> _resetPasswordKey;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _resetPasswordKey = GlobalKey<FormState>();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => createAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          bottom: AppBar(
            leading: AuthAnimatedItem(
              index: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Image.asset(AppImages.appLogo),
              ),
            ),
            title: const AuthAnimatedItem(index: 0, child: Text('Fynd')),
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
                      children: <Widget>[
                        SizedBox(height: 32.h),

                        const TitleAndDescription(
                          title: 'Reset your password',
                          description: 'Enter and confirm the password',
                        ),

                        SizedBox(height: 28.h),

                        ResetPasswordForm(
                          resetToken: widget.resetToken,
                          resetPasswordKey: _resetPasswordKey,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                        ),

                        SizedBox(height: 100.h),

                        ResetPasswordBtn(
                          resetPasswordKey: _resetPasswordKey,
                          widget: widget,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
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
