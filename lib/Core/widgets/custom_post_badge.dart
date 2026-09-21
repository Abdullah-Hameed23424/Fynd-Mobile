import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/enums/app_enums.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';

class CustomPostBadge extends StatelessWidget {
  final PostType postType;
  const CustomPostBadge({super.key, required this.postType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68.w,
      height: 26.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: postType.color.withAlpha(50),
        borderRadius: BorderRadius.circular(13.r),
      ),
      child: Text(
        postType.name,
        style: context.headlineSmall12.copyWith(
          color: postType.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
