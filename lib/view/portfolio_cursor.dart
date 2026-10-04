import 'dart:math' as math;
import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

/// A decorative pointer layer for the web portfolio. It never receives taps.
class PortfolioCursor extends StatefulWidget {
  const PortfolioCursor({super.key, required this.child});

  final Widget child;

  @override
  State<PortfolioCursor> createState() => _PortfolioCursorState();
}

class _CursorFrame {
  const _CursorFrame(this.dot, this.bubble, this.target);

  final Offset dot;
  final Offset bubble;
  final Offset target;
}

class _PortfolioCursorState extends State<PortfolioCursor>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<_CursorFrame?> _frame = ValueNotifier(null);
  late final Ticker _ticker;
  Offset? _target;
  Offset _dot = Offset.zero;
  Offset _bubble = Offset.zero;
  Duration? _lastTick;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(_tick);
  }

  void _move(PointerEvent event) {
    if (event.kind != PointerDeviceKind.mouse) return;
    final position = event.localPosition;
    if (_target == null) {
      _dot = position;
      _bubble = position;
      _frame.value = _CursorFrame(_dot, _bubble, position);
    }
    _target = position;
    if (!_ticker.isActive) {
      _lastTick = null;
      _ticker.start();
    }
  }

  void _tick(Duration elapsed) {
    final target = _target;
    if (target == null) return;
    final seconds = _lastTick == null
        ? 1 / 60
        : ((elapsed - _lastTick!).inMicroseconds / 1000000).clamp(0.001, 0.05);
    _lastTick = elapsed;

    // The dot stays close to the pointer; the label trails just enough to sway.
    _dot = Offset.lerp(_dot, target, 1 - math.exp(-seconds / 0.025))!;
    _bubble = Offset.lerp(_bubble, target, 1 - math.exp(-seconds / 0.095))!;
    if ((_dot - target).distance < 0.2 &&
        (_bubble - target).distance < 0.2) {
      _dot = target;
      _bubble = target;
      _ticker.stop();
    }
    _frame.value = _CursorFrame(_dot, _bubble, target);
  }

  void _exit(PointerEvent event) {
    _target = null;
    _ticker.stop();
    _lastTick = null;
    _frame.value = null;
  }

  @override
  void dispose() {
    _ticker.dispose();
    _frame.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) return widget.child;

    return LayoutBuilder(builder: (context, constraints) {
      return MouseRegion(
        cursor: SystemMouseCursors.none,
        onEnter: _move,
        onHover: _move,
        onExit: _exit,
        child: Listener(
          behavior: HitTestBehavior.translucent,
          onPointerHover: _move,
          onPointerMove: _move,
          child: Stack(children: [
            widget.child,
            Positioned.fill(
              child: IgnorePointer(
                child: ExcludeSemantics(
                  child: ValueListenableBuilder<_CursorFrame?>(
                    valueListenable: _frame,
                    builder: (context, frame, _) {
                      if (frame == null) return const SizedBox.shrink();
                      final bubbleLeft = frame.bubble.dx + 16 + 56 > constraints.maxWidth
                          ? frame.bubble.dx - 64
                          : frame.bubble.dx + 16;
                      final bubbleTop = (frame.bubble.dy - 17)
                          .clamp(4.0, (constraints.maxHeight - 32).clamp(4.0, double.infinity));
                      final tilt = ((frame.target.dx - frame.bubble.dx) / 220)
                          .clamp(-0.06, 0.06);
                      return Stack(children: [
                        Positioned(
                          left: frame.dot.dx - 5,
                          top: frame.dot.dy - 5,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC8F55A),
                              shape: BoxShape.circle,
                              border: Border.all(color: const Color(0xFF151715), width: 1),
                            ),
                          ),
                        ),
                        Positioned(
                          left: bubbleLeft.clamp(4.0, constraints.maxWidth - 52),
                          top: bubbleTop,
                          child: Transform.rotate(
                            angle: tilt,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF151715),
                                border: Border.all(color: const Color(0xFFC8F55A)),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text('You', style: GoogleFonts.spaceMono(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              )),
                            ),
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
