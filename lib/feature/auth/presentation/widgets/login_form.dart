import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/utils/validators/validators_barrel.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  final GlobalKey<FormState> loginKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.loginKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = widget.loginKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (!widget.loginKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      LoginEvent(
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.loginKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AuthAnimatedItem(
            index: 3,
            child: Text('Email', style: context.titleSmall12),
          ),

          SizedBox(height: 4.h),

          AuthAnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.emailController,
              focusNode: _emailFocusNode,
              radius: 14.r,
              hintText: 'you@example.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: EmailValidator.validate,
              onFieldSubmitted: (_) {
                _passwordFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 20.h),

          AuthAnimatedItem(
            index: 5,
            child: Text('Password', style: context.titleSmall12),
          ),

          SizedBox(height: 4.h),

          AuthAnimatedItem(
            index: 6,
            child: CustomTextField(
              controller: widget.passwordController,
              focusNode: _passwordFocusNode,
              radius: 14.r,
              hintText: 'Enter your password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: PasswordValidator.validate,
              isPassword: true,
              onFieldSubmitted: (_) {
                _submit();
              },
            ),
          ),

          AuthAnimatedItem(
            index: 7,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: NavigationCoordinator.toForgetPassword,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  surfaceTintColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(14.r),
                  ),
                ),
                child: Text(
                  'Forgot password?',
                  style: context.titleSmall12.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
