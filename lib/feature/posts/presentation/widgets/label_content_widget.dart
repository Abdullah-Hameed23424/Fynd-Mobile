import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

class LabelContentWidget extends StatelessWidget {
  final String label;
  final String content;
  const LabelContentWidget({
    super.key,
    required this.label,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: context.headlineSmall12.copyWith(color: AppColors.textGray),
        ),

        SizedBox(height: 4.h),

        Text(
          content,
          style: context.bodyMedium16.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
