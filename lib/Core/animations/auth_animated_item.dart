import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fynd/core/animations/auth_animation_config.dart';

class AuthAnimatedItem extends StatelessWidget {
  final Widget child;
  final int index;

  const AuthAnimatedItem({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * AuthAnimationConfig.delayStep),
      duration: AuthAnimationConfig.duration,
      child: child,
    );
  }
}
