import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// One-shot fade and slide for a section as it approaches the viewport.
///
/// This intentionally does not continuously map the animation to the scroll
/// offset. That approach repaints large sections every scroll frame and can
/// flicker when a section sits near the viewport edge.
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    this.fromLeft = true,
    this.delay = Duration.zero,
  });

  final Widget child;
  final bool fromLeft;
  final Duration delay;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slide;
  ScrollPosition? _scrollPosition;
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 480),
    );
    _slide = Tween<Offset>(
      begin: Offset(widget.fromLeft ? -0.08 : 0.08, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    WidgetsBinding.instance.addPostFrameCallback((_) => _attachToScrollView());
  }

  void _attachToScrollView() {
    if (!mounted || _revealed) return;
    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) {
      _reveal();
      return;
    }
    _scrollPosition = scrollable.position..addListener(_checkVisibility);
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted || _revealed || _scrollPosition == null) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;
    final viewport = RenderAbstractViewport.of(renderObject);
    if (viewport == null) return;

    final revealOffset = viewport.getOffsetToReveal(renderObject, 0).offset;
    final triggerOffset =
        _scrollPosition!.pixels + _scrollPosition!.viewportDimension * 0.85;
    if (revealOffset <= triggerOffset) _reveal();
  }

  void _reveal() {
    if (_revealed || !mounted) return;
    _revealed = true;
    _scrollPosition?.removeListener(_checkVisibility);
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
      return;
    }
    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: FadeTransition(
        opacity: _controller,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}
