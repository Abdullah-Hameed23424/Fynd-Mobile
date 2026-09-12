import 'package:flutter/material.dart';
import 'package:fynd/core/dimensions/dimensions.dart';
import 'package:fynd/core/extensions/text_theme_extension.dart';
import 'package:fynd/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final TextStyle? buttonStyle;
  final Size? size;
  final Color? backgroundColor;
  final BorderSide? border;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final bool isEnabled;
  final double? elevation;
  final Color shadowColor;
  const CustomButton({
    super.key,
    required this.label,
    this.buttonStyle,
    this.size,
    this.padding,
    this.icon,
    required this.onPressed,
    this.radius,
    this.backgroundColor,
    this.border,
    this.elevation = 2,
    this.isEnabled = true,
    this.shadowColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      iconAlignment: IconAlignment.start,
      icon: icon,
      label: Text(
        textAlign: TextAlign.center,
        label,
        style:
            buttonStyle ??
            context.bodyMedium16.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      onPressed: isEnabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor,
        animationDuration: const Duration(milliseconds: 300),
        elevation: elevation,
        minimumSize:
            size ??
            Size(MediaQuery.sizeOf(context).width, Dimensions.autoSize(58)),
        backgroundColor: backgroundColor ?? AppColors.primary,
        surfaceTintColor: AppColors.primary,
        disabledBackgroundColor: const Color(0XFFAEAEEA),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side: border ?? BorderSide.none,
          borderRadius: BorderRadius.circular(
            Dimensions.autoSize(radius ?? Dimensions.autoSize(50)),
          ),
        ),
      ),
    );
  }
}
