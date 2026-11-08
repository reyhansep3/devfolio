import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · editorial section · existing Poppins and paper/ink palette.
// Pre-emit critique: P5 H4 E4 S5 R5 V4.
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _muted = Color(0xFFB9BDB6);
const _accent = AppColor.yellowgreen;

Widget homeHero(BuildContext context, double width, double height) {
  final compact = width < 800;
  final heroHeight = compact
      ? (height - kToolbarHeight - MediaQuery.paddingOf(context).top).clamp(
          0.0,
          height,
        )
      : height;
  final portrait = _portrait(width, compact);
  final intro = _heroCopy(width, compact);
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: heroHeight),
    color: _ink,
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        compact ? 24 : width * .075,
        compact ? 96 : 116,
        compact ? 24 : width * .075,
        compact ? 52 : 62,
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScrollReveal(
                  fromLeft: false,
                  delay: const Duration(milliseconds: 180),
                  child: portrait,
                ),
                const SizedBox(height: 32),
                ScrollReveal(
                  delay: const Duration(milliseconds: 320),
                  child: intro,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 6,
                  child: ScrollReveal(
                    delay: const Duration(milliseconds: 150),
                    child: intro,
                  ),
                ),
                SizedBox(width: width * .055),
                Expanded(
                  flex: 5,
                  child: ScrollReveal(
                    fromLeft: false,
                    delay: const Duration(milliseconds: 260),
                    child: portrait,
                  ),
                ),
              ],
            ),
    ),
  );
}

Widget _heroCopy(double width, bool compact) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      'REYHAN SEPTRI ASTA  /  MOBILE DEVELOPER',
      style: GoogleFonts.poppins(
        fontSize: compact ? 12 : 13,
        letterSpacing: 1.2,
        color: _accent,
        fontWeight: FontWeight.w600,
      ),
    ),
    const SizedBox(height: 27),
    Text(
      'Building digital\nexperiences\nthat feel right.',
      style: GoogleFonts.poppins(
        fontSize: compact
            ? (width * .108).clamp(34.0, 52.0)
            : (width * .047).clamp(44.0, 75.0),
        fontWeight: FontWeight.w700,
        height: 1.07,
        letterSpacing: -2.5,
        color: Colors.white,
      ),
    ),
    const SizedBox(height: 28),
    Container(width: 58, height: 3, color: _accent),
    const SizedBox(height: 25),
    ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 460),
      child: Text(
        'I’m a Flutter-focused software engineer in Jakarta. I turn ideas into thoughtful, fast, and useful mobile products.',
        style: GoogleFonts.poppins(
          fontSize: compact ? 14 : 16,
          height: 1.75,
          color: _muted,
        ),
      ),
    ),
    const SizedBox(height: 33),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SCROLL TO EXPLORE',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 12,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(width: 14),
        const Icon(Icons.arrow_downward_rounded, color: _accent, size: 19),
      ],
    ),
  ],
);

Widget _portrait(double width, bool compact) {
  final imageWidth = compact
      ? (width - 48).clamp(220.0, 320.0)
      : (width * .29).clamp(300.0, 420.0);
  return Align(
    alignment: compact ? Alignment.centerLeft : Alignment.centerRight,
    child: SizedBox(
      width: imageWidth,
      child: AspectRatio(
        aspectRatio: 900 / 1167,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 13, bottom: 13),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: _accent, width: 1.5),
                ),
                child: ClipRect(
                  child: Image.asset(
                    'assets/image/profile2.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    semanticLabel: 'Portrait of Reyhan Septri Asta',
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 60,
                height: 60,
                color: _accent,
                child: const Icon(
                  Icons.north_east_rounded,
                  color: _ink,
                  size: 27,
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 30,
              child: Text(
                '01  /  INTRODUCTION',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget homeAbout(BuildContext context, double width, double height) {
  final compact = width < 800;
  final phoneWidth = width < 600
      ? (width * .69).clamp(205.0, 290.0).round()
      : compact
      ? (width * .72).clamp(210.0, 300.0).round()
      : (width * .245).clamp(255.0, 330.0).round();
  final phone = Center(
    child: RepaintBoundary(
      child: Hero(
        tag: phonePreviewHeroTag,
        child: PhoneWidget(
          height: (phoneWidth * 1.96).round(),
          width: phoneWidth,
        ),
      ),
    ),
  );
  final copy = _aboutCopy(context, compact);
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(
      minHeight: compact ? 0.0 : height.clamp(650.0, 980.0),
    ),
    color: _paper,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 24 : width * .09,
        vertical: compact ? 76 : 90,
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScrollReveal(child: copy),
                const SizedBox(height: 48),
                ScrollReveal(
                  fromLeft: false,
                  delay: const Duration(milliseconds: 120),
                  child: phone,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 4, child: ScrollReveal(child: phone)),
                SizedBox(width: width * .07),
                Expanded(
                  flex: 5,
                  child: ScrollReveal(fromLeft: false, child: copy),
                ),
              ],
            ),
    ),
  );
}

Widget _aboutCopy(BuildContext context, bool compact) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      '02  /  THE PERSON BEHIND THE CODE',
      style: GoogleFonts.poppins(
        fontSize: 12,
        letterSpacing: 1.2,
        color: AppColor.darkUI,
      ),
    ),
    const SizedBox(height: 26),
    Text(
      'I build things that make life easier.',
      style: GoogleFonts.poppins(
        fontSize: compact ? 36 : 48,
        fontWeight: FontWeight.w700,
        height: 1.08,
        letterSpacing: compact ? -1.3 : -1.8,
        color: _ink,
      ),
    ),
    const SizedBox(height: 32),
    _aboutPrinciple('01', 'UNDERSTAND', 'Find the real problem.'),
    _aboutPrinciple('02', 'CREATE', 'Build simple, useful solutions.'),
    _aboutPrinciple('03', 'EVOLVE', 'Keep learning. Keep improving.'),
    const SizedBox(height: 28),
    OutlinedButton.icon(
      onPressed: () => GoRouter.of(context).go('/formalities'),
      icon: const Icon(Icons.arrow_outward_rounded, size: 18),
      label: const Text('More about me'),
      style: OutlinedButton.styleFrom(
        foregroundColor: _ink,
        side: const BorderSide(color: _ink),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    ),
  ],
);

Widget _aboutPrinciple(String number, String title, String description) =>
    Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 19),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: _ink.withValues(alpha: .18))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            number,
            style: AppFontStyle.poppinsBodySmall.copyWith(
              height: 1.7,
              color: AppColor.darkUI,
            ),
          ),
          const SizedBox(width: 14),
          const Text(
            '—',
            style: TextStyle(color: AppColor.darkUI, height: 1.5),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFontStyle.poppinsBodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: _ink,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    height: 1.6,
                    color: AppColor.darkUI,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
