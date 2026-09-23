import 'package:flutter/material.dart';
import 'package:fynd/core/config/app_config.dart';
import 'package:fynd/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xffF8FAFC),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xffF8FAFC),
        surfaceTintColor: const Color(0xffF8FAFC),
        titleTextStyle: AppTypography.titleLarge,
      ),
      fontFamily: AppConfig.defaultFontFamily,
      textTheme: TextTheme(
        titleLarge: AppTypography.titleLarge,
        titleMedium: AppTypography.titleMedium,
        titleSmall: AppTypography.titleSmall,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        headlineSmall: AppTypography.headlineSmall,
      ).apply(bodyColor: Colors.black, displayColor: Colors.black),
    );
  }
}
