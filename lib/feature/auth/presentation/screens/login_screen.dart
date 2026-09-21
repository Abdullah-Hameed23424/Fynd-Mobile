import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/auth_dependencies.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/widgets/login_footer.dart';
import 'package:fynd/feature/auth/presentation/widgets/login_form.dart';
import 'package:fynd/feature/auth/presentation/widgets/title_and_description.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _loginKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _loginKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => createAuthBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: AnimatedItem(
            index: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.h),
              child: Image.asset(AppImages.appLogo),
            ),
          ),
          title: const AnimatedItem(index: 0, child: Text('Fynd')),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 32.h),

                        const TitleAndDescription(
                          title: 'Welcome back',
                          description: 'Sign in to find or return an item',
                        ),

                        SizedBox(height: 28.h),

                        LoginForm(
                          loginKey: _loginKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),

                        SizedBox(height: 20.h),
                        LoginFooter(
                          loginKey: _loginKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
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
