import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/constants/app_images.dart';
import 'package:fynd/core/local_storage/shared_preferences/app_shared_preferences.dart';
import 'package:fynd/core/widgets/swipe_up_screen.dart';
import 'package:fynd/feature/auth/presentation/screens/login_screen.dart';
import 'package:fynd/feature/splash/presentation/widgets/app_features_section.dart';
import 'package:fynd/feature/splash/presentation/widgets/bouncing_arrow.dart';
import 'package:fynd/feature/splash/presentation/widgets/footer_section.dart';
import 'package:fynd/feature/splash/presentation/widgets/welcome_card.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SwipeUpScreen(
      onMove: () {
        AppSharedPreferences.saveFirstTime(false);
      },
      backgroundScreen: const LoginScreen(),

      foregroundScreen: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xffF8FAFC), Color(0xffEEF4FF)],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: const Color(0xffF8FAFC),
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
                        children: <Widget>[
                          const WelcomeCard(),

                          SizedBox(height: 24.h),

                          const AppFeaturesSection(),

                          SizedBox(height: 24.h),

                          const FooterSection(),

                          const Spacer(),

                          const BouncingArrow(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
