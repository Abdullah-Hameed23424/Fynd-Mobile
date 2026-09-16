import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// [TITLE]
  TextStyle get titleLarge32 => textTheme.titleLarge!.copyWith();
  TextStyle get titleMedium19 => textTheme.titleMedium!.copyWith();
  TextStyle get titleSmall12 => textTheme.titleSmall!.copyWith();

  TextStyle get bodyMedium16 => textTheme.bodyMedium!.copyWith();
  TextStyle get bodySmall14 => textTheme.bodySmall!.copyWith();

  TextStyle get headlineSmall12 => textTheme.headlineSmall!.copyWith();
}
