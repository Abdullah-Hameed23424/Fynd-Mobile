import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/utils/validators/validators_barrel.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class ForgetPasswordForm extends StatefulWidget {
  final GlobalKey<FormState> forgetPasswordKey;
  final TextEditingController emailController;
  const ForgetPasswordForm({
    super.key,
    required this.forgetPasswordKey,
    required this.emailController,
  });

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  void _submit() {
    final isValid = widget.forgetPasswordKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (!widget.forgetPasswordKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      ForgetPasswordEvent(email: widget.emailController.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.forgetPasswordKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 3,
            child: Text('Email', style: context.titleSmall12),
          ),

          SizedBox(height: 4.h),

          AnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.emailController,
              radius: 14.r,
              hintText: 'you@example.com',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: EmailValidator.validate,
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
