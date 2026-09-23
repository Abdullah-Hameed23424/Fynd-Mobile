import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/animations/animated_item.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

class PasswordInfoCard extends StatelessWidget {
  final int animationIndex;
  final Color color;
  const PasswordInfoCard({
    super.key,
    required this.animationIndex,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedItem(
      index: animationIndex,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          color: color,
          border: Border.all(color: const Color(0xffE0E5ED)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        child: Row(
          children: <Widget>[
            const Icon(Icons.shield_outlined, color: AppColors.primary),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                'Use 8+ characters with letters and numbers',
                style: context.headlineSmall12.copyWith(
                  color: AppColors.textGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
