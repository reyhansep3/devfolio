import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · pre-emit critique: P5 H5 E4 S5 R5 V4.
// The notebook uses the same yellow-green accent as the portfolio.
abstract final class _NightColors {
  static const background = Color(0xFF151715);
  static const paper = Color(0xFFF1EFE8);
  static const body = Color(0xFFD1D1C9);
  static const muted = Color(0xFFB9BDB6);
  static const rule = Color(0xFF424A42);
  static const outline = Color(0xFF687168);
  static const accent = AppColor.yellowgreen;
}

class AfterHoursSection extends StatelessWidget {
  const AfterHoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 900;
    final phone = width < 600;
    final inset = width < 800 ? 24.0 : width * .09;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 900),
      color: _NightColors.background,
      padding: EdgeInsets.fromLTRB(
        inset,
        phone ? 36 : 48,
        inset,
        phone ? 48 : 56,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: phone ? 64 : 90),
          compact
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Intro(phone: phone),
                    const SizedBox(height: 64),
                    const _OrbitAndEntries(),
                  ],
                )
              : const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _Intro(phone: false)),
                    SizedBox(width: 56),
                    Expanded(flex: 5, child: _OrbitAndEntries()),
                  ],
                ),
          SizedBox(height: phone ? 64 : 90),
          const _NotebookFooter(),
        ],
      ),
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro({required this.phone});
  final bool phone;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 680),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '04  /  NIGHT SHIFT',
          style: GoogleFonts.spaceMono(
            color: _NightColors.accent,
            fontSize: phone ? 11 : 13,
            letterSpacing: 1.3,
          ),
        ),
        const SizedBox(height: 28),
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(text: 'After the commit, the '),
              TextSpan(
                text: 'curiosity',
                style: TextStyle(
                  color: _NightColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(text: ' clocks in.'),
            ],
          ),
          style: GoogleFonts.spaceGrotesk(
            color: _NightColors.paper,
            fontSize: phone ? 48 : 78,
            height: 1.02,
            letterSpacing: phone ? -2.1 : -4,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 28),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(
            'Side quests, half-built tools and odd little experiments. They start as a question nobody asked, and the good ones grow up to solve a real problem.',
            style: GoogleFonts.inter(
              color: _NightColors.body,
              fontSize: phone ? 16 : 18,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _NotebookButton(
              label: 'Open the logbook',
              filled: true,
              onPressed: () => context.go('/blog'),
            ),
            _NotebookButton(
              label: 'See what is brewing',
              onPressed: () => context.go('/project'),
            ),
          ],
        ),
      ],
    ),
  );
}

class _NotebookButton extends StatelessWidget {
  const _NotebookButton({
    required this.label,
    required this.onPressed,
    this.filled = false,
  });
  final String label;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    );
    final textStyle = GoogleFonts.poppins(
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );
    if (filled) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.menu_book_outlined, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: _NightColors.accent,
          foregroundColor: _NightColors.background,
          shape: shape,
          minimumSize: const Size(0, 48),
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
          textStyle: textStyle,
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_outward_rounded, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: _NightColors.paper,
        side: const BorderSide(color: _NightColors.outline),
        shape: shape,
        minimumSize: const Size(0, 48),
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        textStyle: textStyle,
      ),
    );
  }
}

class _OrbitAndEntries extends StatelessWidget {
  const _OrbitAndEntries();

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 520),
    child: Column(
      children: [
        Semantics(
          label: 'Orbit sketch with small planets around a crescent moon',
          image: true,
          child: AspectRatio(
            aspectRatio: 420 / 220,
            child: CustomPaint(painter: _OrbitPainter()),
          ),
        ),
        const SizedBox(height: 28),
        const _LogbookEntry(
          '01',
          'Open a repo that is not mine',
          'Read code the way others read novels.',
        ),
        const _LogbookEntry(
          '02',
          'Break something small, on purpose',
          'A prototype with no deadline and no users.',
        ),
        const _LogbookEntry(
          '03',
          'Ask a smaller model a real question',
          'Local, quiet, surprisingly useful.',
        ),
        const _LogbookEntry(
          '04',
          'Write it down before sleeping',
          'Notes today, a post or a tool tomorrow.',
        ),
      ],
    ),
  );
}

class _OrbitPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 420, size.height / 220);
    final orbit = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = _NightColors.rule;
    for (final radius in [46.0, 108.0]) {
      canvas.drawCircle(const Offset(210, 110), radius, orbit);
    }
    for (var i = 0; i < 90; i++) {
      final angle = i * 2 * math.pi / 90;
      if (i.isEven) {
        canvas.drawArc(
          Rect.fromCircle(center: const Offset(210, 110), radius: 80),
          angle,
          2 * math.pi / 90,
          false,
          orbit,
        );
      }
    }
    void dot(double x, double y, double radius, Color color) =>
        canvas.drawCircle(Offset(x, y), radius, Paint()..color = color);
    dot(210, 110, 22, _NightColors.paper);
    dot(220, 104, 20, _NightColors.background);
    dot(130, 110, 5, _NightColors.accent);
    dot(266, 52, 4, _NightColors.paper);
    dot(318, 142, 6, _NightColors.accent);
    dot(150, 190, 3, _NightColors.paper);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LogbookEntry extends StatelessWidget {
  const _LogbookEntry(this.time, this.title, this.description);
  final String time;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: _NightColors.rule)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 66,
          child: Text(
            time,
            style: GoogleFonts.spaceMono(
              color: _NightColors.accent,
              fontSize: 15,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.spaceGrotesk(
                  color: _NightColors.paper,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: GoogleFonts.inter(
                  color: _NightColors.muted,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _NotebookFooter extends StatelessWidget {
  const _NotebookFooter();

  @override
  Widget build(BuildContext context) => const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _FooterText('lights low · terminal on'),
      _FooterText('keep scrolling ↓'),
    ],
  );
}

class _FooterText extends StatelessWidget {
  const _FooterText(this.value);
  final String value;

  @override
  Widget build(BuildContext context) => Text(
    value,
    style: GoogleFonts.spaceMono(color: _NightColors.muted, fontSize: 11),
  );
}
