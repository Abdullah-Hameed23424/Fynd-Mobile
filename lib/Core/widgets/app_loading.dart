import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/Core/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.discreteCircle(
        thirdRingColor: AppColors.primary.withAlpha(50),
        secondRingColor: AppColors.primary.withAlpha(150),
        color: color ?? AppColors.primary,
        size: 36.sp,
      ),
    );
  }
}
