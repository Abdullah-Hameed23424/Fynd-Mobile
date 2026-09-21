import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fynd/core/animations/animation_config.dart';

class AnimatedItem extends StatelessWidget {
  final Widget child;
  final int index;

  const AnimatedItem({super.key, required this.child, required this.index});

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * AnimationConfig.delayStep),
      duration: AnimationConfig.duration,
      child: child,
    );
  }
}
