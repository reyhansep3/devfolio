import 'package:flutter/material.dart';

class HoverTextReveal extends StatefulWidget {
  const HoverTextReveal({
    super.key,
    required this.text,
    this.baseColor = Colors.black,
    this.hoverColor = Colors.white,
    this.circleRadius = 80,
  });

  final String text;
  final Color baseColor;
  final Color hoverColor;
  final double circleRadius;

  @override
  State<HoverTextReveal> createState() => _HoverTextRevealState();
}

class _HoverTextRevealState extends State<HoverTextReveal> {
  Offset? mousePosition;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          mousePosition = event.localPosition;
        });
      },
      onExit: (_) {
        setState(() {
          mousePosition = null;
        });
      },
      child: CustomPaint(
        painter: _HoverTextPainter(
          text: widget.text,
          mousePosition: mousePosition,
          baseColor: widget.baseColor,
          hoverColor: widget.hoverColor,
          circleRadius: widget.circleRadius,
        ),
        size: const Size(double.infinity, 120),
      ),
    );
  }
}

class _HoverTextPainter extends CustomPainter {
  _HoverTextPainter({
    required this.text,
    required this.mousePosition,
    required this.baseColor,
    required this.hoverColor,
    required this.circleRadius,
  });

  final String text;
  final Offset? mousePosition;
  final Color baseColor;
  final Color hoverColor;
  final double circleRadius;

  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.w500,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle.copyWith(color: baseColor),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    final offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    // Base text
    textPainter.paint(canvas, offset);

    if (mousePosition == null) return;

    canvas.save();

    // Circle mask
    final circlePath = Path()
      ..addOval(
        Rect.fromCircle(
          center: mousePosition!,
          radius: circleRadius,
        ),
      );

    canvas.clipPath(circlePath);

    // Draw the second version of the text
    final hoverPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle.copyWith(
          color: hoverColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    hoverPainter.paint(canvas, offset);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _HoverTextPainter oldDelegate) {
    return oldDelegate.mousePosition != mousePosition;
  }
}