import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/about_palette.dart';

/// Flutter rendering of assets/icons/messy_to_clean.svg.
/// The SVG's SMIL animation is not interpreted by flutter_svg, so this draws
/// the same path with its stroke reveal timing in the Flutter canvas.
class AnimatedMessyLine extends StatefulWidget {
  const AnimatedMessyLine({super.key});

  @override
  State<AnimatedMessyLine> createState() => _AnimatedMessyLineState();
}

class _AnimatedMessyLineState extends State<AnimatedMessyLine>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  );
  late final Animation<double> _progress = CurvedAnimation(
    parent: _controller,
    curve: const Cubic(0.2, 0.6, 0.3, 1),
  );
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else if (!_started) {
      _started = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Semantics(
    image: true,
    label: 'A tangled line that straightens out',
    child: SizedBox(
      width: double.infinity,
      height: 40,
      child: AnimatedBuilder(
        animation: _progress,
        builder: (context, _) => CustomPaint(
          painter: _MessyLinePainter(_progress.value),
        ),
      ),
    ),
  );
}

class _MessyLinePainter extends CustomPainter {
  const _MessyLinePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / 600;
    double x(double value) => value * scaleX;

    // M0 20 C20 0,40 40,60 20 S100 0,120 24
    // S160 38,180 14 S220 6,240 22 S270 20,300 20 L600 20.
    // Each S control point reflects the previous cubic control point.
    final path = Path()
      ..moveTo(x(0), 20)
      ..cubicTo(x(20), 0, x(40), 40, x(60), 20)
      ..cubicTo(x(80), 0, x(100), 0, x(120), 24)
      ..cubicTo(x(140), 48, x(160), 38, x(180), 14)
      ..cubicTo(x(200), -10, x(220), 6, x(240), 22)
      ..cubicTo(x(260), 38, x(270), 20, x(300), 20)
      ..lineTo(x(600), 20);
    final paint = Paint()
      ..color = AboutPalette.ink
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    for (final metric in path.computeMetrics()) {
      canvas.drawPath(metric.extractPath(0, metric.length * progress), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _MessyLinePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
