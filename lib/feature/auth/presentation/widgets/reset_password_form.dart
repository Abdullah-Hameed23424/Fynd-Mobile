import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/utils/validators/confirm_password_validator.dart';
import 'package:fynd/core/utils/validators/validators_barrel.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class ResetPasswordForm extends StatefulWidget {
  final String resetToken;
  final GlobalKey<FormState> resetPasswordKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const ResetPasswordForm({
    super.key,
    required this.resetToken,
    required this.resetPasswordKey,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _confirmPasswordFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = widget.resetPasswordKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (!widget.resetPasswordKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      ResetPasswordEvent(
        resetToken: widget.resetToken,
        password: widget.passwordController.text.trim(),
        confirmPassword: widget.confirmPasswordController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.resetPasswordKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 3,
            child: Text('Password', style: context.titleSmall12),
          ),

          SizedBox(height: 4.h),

          AnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.passwordController,
              focusNode: _passwordFocusNode,
              radius: 14.r,
              hintText: 'Enter your password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              validator: PasswordValidator.validate,
              isPassword: true,
              onFieldSubmitted: (_) {
                _confirmPasswordFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 20.h),

          AnimatedItem(
            index: 5,
            child: Text('Confirm Password', style: context.titleSmall12),
          ),

          SizedBox(height: 4.h),

          AnimatedItem(
            index: 6,
            child: CustomTextField(
              controller: widget.confirmPasswordController,
              focusNode: _confirmPasswordFocusNode,
              radius: 14.r,
              hintText: 'Enter your confirm password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: (value) => ConfirmPasswordValidator.validate(
                value,
                widget.passwordController.text.trim(),
              ),
              isPassword: true,
              onFieldSubmitted: (_) {
                _submit();
              },
            ),
          ),
        ],
      ),
    );
  }
}
