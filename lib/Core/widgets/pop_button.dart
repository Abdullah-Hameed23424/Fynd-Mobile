import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopButton extends StatelessWidget {
  const PopButton({
    super.key,
    this.iconColor,
    this.onTap,
    this.color = Colors.black,
  });
  final Color? iconColor;
  final VoidCallback? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        fixedSize: Size(44.w, 44.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(14.r),
          side: const BorderSide(color: Color(0xffE0E5ED)),
        ),
      ),
      icon: Icon(Icons.arrow_back_ios_rounded, color: color, size: 20.sp),
      onPressed: () {
        if (onTap == null) {
          // AppAudioManager.playClick();
          Navigator.pop(context);
        } else {
          onTap!();
        }
      },
    );
  }
}
