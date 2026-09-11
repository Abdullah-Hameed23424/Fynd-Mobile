import 'package:flutter/material.dart';
import 'package:fynd/Core/config/app_config.dart';
import 'package:fynd/Core/theme/app_typography.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: AppConfig.defaultFontFamily,
      textTheme: TextTheme(
        titleLarge: AppTypography.titleLarge,
        bodyMedium: AppTypography.bodyMedium,
      ),
    );
  }
}
