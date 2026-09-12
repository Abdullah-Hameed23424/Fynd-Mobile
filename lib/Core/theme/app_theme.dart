import 'package:flutter/material.dart';
import 'package:fynd/core/config/app_config.dart';
import 'package:fynd/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: AppTypography.titleLarge,
      ),
      fontFamily: AppConfig.defaultFontFamily,
      textTheme: TextTheme(
        titleLarge: AppTypography.titleLarge,
        titleSmall: AppTypography.titleSmall,
        bodyMedium: AppTypography.bodyMedium,
        bodySmall: AppTypography.bodySmall,
        headlineSmall: AppTypography.headlineSmall,
      ).apply(bodyColor: Colors.black, displayColor: Colors.black),
    );
  }
}
