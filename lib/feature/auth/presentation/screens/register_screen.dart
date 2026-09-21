import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/di/auth_dependencies.dart';
import 'package:fynd/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:fynd/feature/auth/presentation/widgets/register_footer.dart';
import 'package:fynd/feature/auth/presentation/widgets/register_form.dart';
import 'package:fynd/feature/auth/presentation/widgets/title_and_description.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final GlobalKey<FormState> _registerKey;
  late final TextEditingController _fullnameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _registerKey = GlobalKey<FormState>();
    _fullnameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
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
                          title: 'Create your account',
                          description:
                              'Join your community and help reunite lost items',
                        ),

                        SizedBox(height: 28.h),

                        RegisterForm(
                          registerKey: _registerKey,
                          fullnameController: _fullnameController,
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),

                        SizedBox(height: 20.h),
                        RegisterFooter(
                          registerKey: _registerKey,
                          fullnameController: _fullnameController,
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
