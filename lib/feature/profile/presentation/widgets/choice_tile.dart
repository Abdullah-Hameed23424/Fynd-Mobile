import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';

class ChoiceTile extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  const ChoiceTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
          side: const BorderSide(color: Color(0xffE0E5ED)),
        ),
        title: Text(
          title,
          style: context.bodySmall14.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 15.sp),
        onTap: onTap,
      ),
    );
  }
}
