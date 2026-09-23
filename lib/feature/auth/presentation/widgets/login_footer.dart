import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_coordinator.dart';
import 'package:fynd/core/theme/app_colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AnimatedItem(
          index: 11,
          child: Text.rich(
            TextSpan(
              style: context.bodySmall14.copyWith(color: AppColors.textGray),
              children: [
                const TextSpan(text: 'New here? '),
                TextSpan(
                  text: 'Create an account',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      NavigationCoordinator.toRegister();
                    },
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 10.h),

        AnimatedItem(
          index: 12,
          child: Text(
            'By continuing, you agree to our Terms and Privacy Policy.',
            style: context.headlineSmall12.copyWith(color: AppColors.textGray),
          ),
        ),
      ],
    );
  }
}
