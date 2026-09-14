import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/Core/theme/app_colors.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';
import 'package:fynd/core/dimensions/dimensions.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:pinput/pinput.dart';

class OtpPinput extends StatelessWidget {
  final bool enable;
  final TextEditingController otpController;
  final void Function(String code) onCompleted;
  OtpPinput({
    super.key,
    required this.enable,
    required this.otpController,
    required this.onCompleted,
  });

  final baseDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: const Color(0xffaaaaaa)),
    color: Colors.white12,
  );

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: Dimensions.autoSize(60),
      height: Dimensions.autoSize(60),
      textStyle: context.bodyMedium16.copyWith(
        fontSize: Dimensions.autoSize(20),
        fontWeight: FontWeight.bold,
      ),
      decoration: baseDecoration,
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: baseDecoration.copyWith(
        border: Border.all(color: AppColors.primary, width: 0.5),
        color: AppColors.primary.withAlpha(100),
      ),
    );
    return AuthAnimatedItem(
      index: 3,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          enabled: enable,
          separatorBuilder: (index) => SizedBox(width: 12.w),
          onSubmitted: onCompleted,
          controller: otpController,
          length: 4,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          onCompleted: onCompleted,
        ),
      ),
    );
  }
}
