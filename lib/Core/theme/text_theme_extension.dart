import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [TITLE]
  TextStyle get titleLarge34 => textTheme.headlineLarge!;

  TextStyle get bodyMedium16 => textTheme.bodyMedium!;
}
