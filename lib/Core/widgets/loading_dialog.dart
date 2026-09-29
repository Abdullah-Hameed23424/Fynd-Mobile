import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/navigation/navigation_service.dart';
import 'package:fynd/core/theme/app_colors.dart';

import 'dart:ui';

/// [ديالوج لعرض سلوك بقيام شيء بعملية تحميل مخصص]
class LoadingDialog extends StatefulWidget {
  const LoadingDialog({super.key});
  static void hide(GlobalKey<LoadingDialogState> key) {
    if (key.currentState != null) {
      NavigationService.goBack();
    }
  }

  static void show(GlobalKey<LoadingDialogState> key) {
    showDialog(
      context: NavigationService.navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (context) => LoadingDialog(key: key),
    );
  }

  @override
  State<LoadingDialog> createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Center(
          child: Container(
            width: 150.w,
            height: 150.w,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(225),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(25),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Text(
                  'Loading...',
                  textAlign: TextAlign.center,
                  style: context.bodyMedium16.copyWith(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
