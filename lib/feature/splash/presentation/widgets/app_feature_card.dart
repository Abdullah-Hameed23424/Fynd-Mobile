import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';

class AppFeatureCard extends StatelessWidget {
  final String label;
  const AppFeatureCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: const Color(0xffE0E5ED)),
      ),
      child: Text(
        label,
        style: context.headlineSmall12.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
