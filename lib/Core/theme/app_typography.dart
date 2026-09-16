import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  static TextStyle get titleLarge => TextStyle(
    color: Colors.black,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get titleMedium => TextStyle(
    color: Colors.black,
    fontSize: 19.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get titleSmall => TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get bodyMedium => TextStyle(
    color: Colors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get bodySmall => TextStyle(
    color: Colors.black,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get headlineSmall => TextStyle(
    color: Colors.black,
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
  );
}
