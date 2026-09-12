import 'dart:ui';

import 'package:flutter/material.dart';

/// --------------------------------------------------------------------------
///   GLASS CUSTOM SNACKBAR
/// --------------------------------------------------------------------------

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar.success({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const SizedBox.shrink(),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.backgroundColor = const Color(0xff00E676),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  });

  const CustomSnackBar.info({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const SizedBox.shrink(),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.backgroundColor = const Color(0xff2196F3),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  });

  const CustomSnackBar.error({
    super.key,
    required this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const SizedBox.shrink(),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
    this.textAlign = TextAlign.center,
  });

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;
  final TextAlign textAlign;

  @override
  State<CustomSnackBar> createState() => CustomSnackBarState();
}

class CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: 80,
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: widget.backgroundColor.withValues(alpha: 0.35),
            borderRadius: widget.borderRadius,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.25),
              width: 1,
            ),
            boxShadow: widget.boxShadow,
          ),
          child: Center(
            child: Padding(
              padding: widget.messagePadding,
              child: Text(
                widget.message,
                style: theme.textTheme.bodyMedium?.merge(widget.textStyle),
                textAlign: widget.textAlign,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines,
                textScaler: TextScaler.linear(widget.textScaleFactor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// --------------------------------------------------------------------------
///   DEFAULT GLASS SHADOW
/// --------------------------------------------------------------------------

const kDefaultBoxShadow = [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0, 8),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

/// --------------------------------------------------------------------------
///   DEFAULT BORDER RADIUS
/// --------------------------------------------------------------------------

const kDefaultBorderRadius = BorderRadius.all(Radius.circular(12));
