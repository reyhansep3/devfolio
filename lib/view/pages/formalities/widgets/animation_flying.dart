import 'dart:math';
import 'package:flutter/material.dart';

class FlyingWidget extends StatefulWidget {
  final Widget widget;
  final double amplitude;
  final Duration duration;
  final int math;

  const FlyingWidget({
    super.key,
    required this.widget,
    this.amplitude = 10,
    this.math = 1,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<FlyingWidget> createState() => _FlyingWidgetState();
}

class _FlyingWidgetState extends State<FlyingWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: _controller,

      builder: (context, child) {

        final double offsetY =
            sin(_controller.value * widget.math * pi) *
            widget.amplitude;

        return Transform.translate(
          offset: Offset(0, offsetY),
          child: child,
        );
      },

      /// 🔥 FIX DI SINI
      child: widget.widget,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}