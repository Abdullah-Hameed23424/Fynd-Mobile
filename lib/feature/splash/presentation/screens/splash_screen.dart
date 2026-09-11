import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:fynd/Core/constants/app_images.dart';
import 'package:fynd/Core/theme/app_colors.dart';
import 'package:fynd/Core/theme/text_theme_extension.dart';
import 'package:fynd/Core/navigation/routes_constants.dart';
import 'package:fynd/feature/splash/domain/usecases/check_auth_status_use_case.dart';
import 'package:fynd/feature/splash/presentation/cubits/splash_cubit.dart';
import 'package:fynd/feature/splash/presentation/cubits/splash_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    context.read<SplashCubit>().checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(CheckAuthStatusUseCase()),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            Navigator.pushReplacementNamed(context, Routes.home);
          }
          if (state is SplashUnauthenticated) {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
          if (state is SplashError) {
            Navigator.pushReplacementNamed(context, Routes.login);
          }
        },
        child: Scaffold(
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeIn(
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 175.w,
                    height: 175.h,
                    fit: BoxFit.cover,
                  ),
                ),

                FadeIn(
                  delay: const Duration(milliseconds: 100),
                  child: Text('Fynd', style: context.titleLarge34),
                ),

                SizedBox(height: 10.h),

                FadeIn(
                  delay: const Duration(milliseconds: 200),
                  child: Text(
                    'Find it. Return it. Together.',
                    style: context.bodyMedium16.copyWith(
                      color: AppColors.textGray,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
