import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class WhatDrivesMeSection extends StatefulWidget {
  const WhatDrivesMeSection({super.key});

  @override
  State<WhatDrivesMeSection> createState() => _WhatDrivesMeSectionState();
}

class _WhatDrivesMeSectionState extends State<WhatDrivesMeSection>
    with SingleTickerProviderStateMixin {
  static const _first = 'There are no limits to what you can achieve.';
  static const _second =
      'Whenever you doubt yourself, remember who you want to become.';
  static const _firstWords = 9;
  static const _wordFadeMs = 420;
  static const _wordStaggerMs = 75;
  static const _wordCount = 19;
  static const _durationMs = _wordFadeMs + (_wordCount - 1) * _wordStaggerMs;

  late final AnimationController _controller;
  ScrollPosition? _scrollPosition;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: _durationMs),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) => _attachToScroll());
  }

  void _attachToScroll() {
    if (!mounted || _started) return;
    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) {
      _start();
      return;
    }
    _scrollPosition = scrollable.position..addListener(_checkVisibility);
    _checkVisibility();
  }

  void _checkVisibility() {
    if (!mounted || _started || _scrollPosition == null) return;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return;
    final viewport = RenderAbstractViewport.of(renderObject);
    final sectionTop = viewport.getOffsetToReveal(renderObject, 0).offset;
    final trigger = _scrollPosition!.pixels +
        _scrollPosition!.viewportDimension * 0.8;
    if (sectionTop <= trigger) _start();
  }

  void _start() {
    if (_started || !mounted) return;
    _started = true;
    _scrollPosition?.removeListener(_checkVisibility);
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _scrollPosition?.removeListener(_checkVisibility);
    _controller.dispose();
    super.dispose();
  }

  Widget _animatedWords(
    String sentence, {
    required int startIndex,
    required TextStyle style,
    required double spacing,
  }) {
    final words = sentence.split(' ');
    return Wrap(
      spacing: spacing,
      runSpacing: 2,
      children: [
        for (var index = 0; index < words.length; index++)
          Opacity(
            opacity: Curves.easeOut.transform(
              ((_controller.value * _durationMs -
                          (startIndex + index) * _wordStaggerMs) /
                      _wordFadeMs)
                  .clamp(0.0, 1.0),
            ),
            child: Text(words[index], style: style),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF151715);
    const accent = Color(0xFFC8F55A);
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 800;
    final inset = compact ? 24.0 : width * .09;

    return Container(
      width: double.infinity,
      color: accent,
      padding: EdgeInsets.fromLTRB(
        inset,
        compact ? 88 : 125,
        inset,
        compact ? 82 : 112,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '05  /  WHAT DRIVES ME',
            style: GoogleFonts.spaceMono(
              color: ink,
              fontSize: 12,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: compact ? 38 : 55),
          Semantics(
            label: '$_first $_second',
            child: ExcludeSemantics(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) => ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _animatedWords(
                        _first,
                        startIndex: 0,
                        style: GoogleFonts.poppins(
                          color: ink,
                          fontSize: compact
                              ? (width * .105).clamp(34.0, 46.0)
                              : (width * .052).clamp(54.0, 75.0),
                          fontWeight: FontWeight.w700,
                          height: 1.16,
                          letterSpacing: -1.9,
                        ),
                        spacing: compact ? 9 : 16,
                      ),
                      SizedBox(height: compact ? 30 : 42),
                      _animatedWords(
                        _second,
                        startIndex: _firstWords,
                        style: GoogleFonts.poppins(
                          color: ink.withValues(alpha: .78),
                          fontSize: compact
                              ? (width * .075).clamp(27.0, 34.0)
                              : (width * .036).clamp(38.0, 52.0),
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                          letterSpacing: -1.1,
                        ),
                        spacing: compact ? 7 : 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: compact ? 70 : 100),
          const Divider(height: 1, color: Color(0x66151715)),
          const SizedBox(height: 20),
          Text(
            'A REMINDER TO KEEP MOVING FORWARD',
            style: GoogleFonts.spaceMono(
              color: ink,
              fontSize: 12,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
