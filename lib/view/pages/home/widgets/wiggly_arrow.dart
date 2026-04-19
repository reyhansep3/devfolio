import 'dart:math';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class WiggleArrow extends StatefulWidget {
  final String assetPath;
  final double amplitude; // wiggle height
  final Duration duration;
  final double width;

  const WiggleArrow({
    super.key,
    required this.assetPath,
    this.amplitude = 10,
    this.width = 200,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<WiggleArrow> createState() => _WiggleArrowState();
}

class _WiggleArrowState extends State<WiggleArrow>
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
            sin(_controller.value * 2 * pi) * widget.amplitude;

        return Transform.translate(
          offset: Offset(0, offsetY),
          child: child,
        );
      },
      child: SvgPicture.asset(
        widget.assetPath,
        width: widget.width,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}