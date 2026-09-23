import 'package:flutter/material.dart';

class SwipeUpScreen extends StatefulWidget {
  final Widget backgroundScreen;
  final Widget foregroundScreen;
  final double threshold;
  final VoidCallback? onMove;

  const SwipeUpScreen({
    super.key,
    required this.backgroundScreen,
    required this.foregroundScreen,
    this.threshold = 0.3,
    this.onMove,
  });

  @override
  State<SwipeUpScreen> createState() => _SwipeUpScreenState();
}

class _SwipeUpScreenState extends State<SwipeUpScreen> {
  double _drag = 0;

  void _onDragUpdate(DragUpdateDetails details) {
    final delta = details.delta.dy;

    if (_drag == 0 && delta > 0) {
      return;
    }

    setState(() {
      _drag -= delta;

      final screenHeight = MediaQuery.of(context).size.height;

      _drag = _drag.clamp(0, screenHeight);
    });
  }

  void _onDragEnd(DragEndDetails details) {
    final screenHeight = MediaQuery.of(context).size.height;

    setState(() {
      if (_drag > screenHeight * widget.threshold) {
        _drag = screenHeight;
        if (widget.onMove != null) {
          widget.onMove!();
        }
      } else {
        _drag = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        widget.backgroundScreen,

        Positioned(
          top: -_drag,
          left: 0,
          right: 0,
          height: screenHeight,
          child: GestureDetector(
            onVerticalDragUpdate: _onDragUpdate,
            onVerticalDragEnd: _onDragEnd,
            child: widget.foregroundScreen,
          ),
        ),
      ],
    );
  }
}
