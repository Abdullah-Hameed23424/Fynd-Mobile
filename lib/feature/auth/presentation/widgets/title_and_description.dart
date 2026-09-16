import 'package:flutter/material.dart';
import 'package:fynd/core/theme/app_colors.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/animations/auth_animated_item.dart';

class TitleAndDescription extends StatelessWidget {
  final String title;
  final String description;
  final CrossAxisAlignment crossAxisAlignment;
  const TitleAndDescription({
    super.key,
    required this.title,
    required this.description,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        AuthAnimatedItem(
          index: 1,
          child: Text(title, style: context.titleLarge32),
        ),

        AuthAnimatedItem(
          index: 2,
          child: Text(
            description,
            style: context.bodyMedium16.copyWith(color: AppColors.textGray),
          ),
        ),
      ],
    );
  }
}
