import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/di/auth_dependencies.dart';
import 'package:fynd/core/widgets/pop_button.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/widgets/forget_password_form.dart';
import 'package:fynd/feature/auth/presentation/widgets/forget_password_footer.dart';
import 'package:fynd/feature/auth/presentation/widgets/title_and_description.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final GlobalKey<FormState> _forgetPasswordKey;
  late final TextEditingController _emailController;

  @override
  void initState() {
    _forgetPasswordKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => createAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: const PopButton(),
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 60.h),
            child: AppBar(
              leading: AnimatedItem(
                index: 0,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 50.w,
                    height: 50.h,
                  ),
                ),
              ),
              leadingWidth: 80.w,
              title: const AnimatedItem(index: 0, child: Text('Fynd')),
            ),
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
                          title: 'Forget Password',
                          description:
                              'Enter your email address, and we will send a verification code (OTP)',
                        ),

                        SizedBox(height: 28.h),

                        ForgetPasswordForm(
                          forgetPasswordKey: _forgetPasswordKey,
                          emailController: _emailController,
                        ),

                        SizedBox(height: 26.h),

                        ForgetPasswordFooter(
                          forgetPasswordKey: _forgetPasswordKey,
                          emailController: _emailController,
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
