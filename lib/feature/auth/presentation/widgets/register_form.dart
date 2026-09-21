import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/utils/validators/fullname_validator.dart';
import 'package:fynd/core/utils/validators/validators_barrel.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/widgets/custom_text_field.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';

class RegisterForm extends StatefulWidget {
  final GlobalKey<FormState> registerKey;
  final TextEditingController fullnameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const RegisterForm({
    super.key,
    required this.registerKey,
    required this.fullnameController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late final FocusNode _fullnameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _fullnameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _fullnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final isValid = widget.registerKey.currentState?.validate() ?? false;

    if (!isValid) return;

    if (!widget.registerKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      RegisterEvent(
        fullname: widget.fullnameController.text.trim(),
        email: widget.emailController.text.trim(),
        password: widget.passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.registerKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AnimatedItem(
            index: 3,
            child: Text('Full name', style: context.titleSmall12),
          ),
          SizedBox(height: 4.h),
          AnimatedItem(
            index: 4,
            child: CustomTextField(
              controller: widget.fullnameController,
              focusNode: _fullnameFocusNode,
              radius: 14.r,
              hintText: 'Your name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: FullNameValidator.validate,
              onFieldSubmitted: (_) {
                _emailFocusNode.requestFocus();
              },
            ),
          ),

          SizedBox(height: 20.h),
          AnimatedItem(
            index: 5,
            child: Text('Email', style: context.titleSmall12),
          ),
          SizedBox(height: 4.h),
          AnimatedItem(
            index: 6,
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

          AnimatedItem(
            index: 7,
            child: Text('Password', style: context.titleSmall12),
          ),
          SizedBox(height: 4.h),
          AnimatedItem(
            index: 8,
            child: CustomTextField(
              controller: widget.passwordController,
              focusNode: _passwordFocusNode,
              radius: 14.r,
              hintText: 'Create a strong password',
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: PasswordValidator.validate,
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
