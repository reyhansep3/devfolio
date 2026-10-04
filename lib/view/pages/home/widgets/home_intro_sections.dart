import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _muted = Color(0xFFB9BDB6);
const _accent = AppColor.yellowgreen;

Widget homeHero(BuildContext context, double width, double height) {
  final compact = width < 800;
  final portrait = _portrait(width, compact);
  final intro = _heroCopy(width, compact);
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: height - kNavbarHeight),
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
                FadeInRight(config: BaseAnimationConfig(delay: 180.ms, duration: 750.ms, child: portrait)),
                const SizedBox(height: 32),
                FadeInLeft(config: BaseAnimationConfig(delay: 320.ms, duration: 750.ms, child: intro)),
              ],
            )
          : Row(
              children: [
                Expanded(
                  flex: 6,
                  child: FadeInLeft(config: BaseAnimationConfig(delay: 150.ms, duration: 750.ms, child: intro)),
                ),
                SizedBox(width: width * .055),
                Expanded(
                  flex: 5,
                  child: FadeInRight(config: BaseAnimationConfig(delay: 260.ms, duration: 750.ms, child: portrait)),
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
    Text('REYHAN SEPTRI ASTA  /  MOBILE DEVELOPER', style: GoogleFonts.spaceMono(
      fontSize: compact ? 12 : 13, letterSpacing: 1.2, color: _accent, fontWeight: FontWeight.w600,
    )),
    const SizedBox(height: 27),
    Text('Building digital\nexperiences\nthat feel right.', style: GoogleFonts.poppins(
      fontSize: compact ? (width * .108).clamp(34.0, 52.0) : (width * .047).clamp(44.0, 75.0),
      fontWeight: FontWeight.w700, height: 1.07, letterSpacing: -2.5, color: Colors.white,
    )),
    const SizedBox(height: 28),
    Container(width: 58, height: 3, color: _accent),
    const SizedBox(height: 25),
    ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 460),
      child: Text('I’m a Flutter-focused software engineer in Jakarta. I turn ideas into thoughtful, fast, and useful mobile products.',
        style: GoogleFonts.poppins(fontSize: compact ? 14 : 16, height: 1.75, color: _muted)),
    ),
    const SizedBox(height: 33),
    Row(mainAxisSize: MainAxisSize.min, children: [
      Text('SCROLL TO EXPLORE', style: GoogleFonts.spaceMono(color: Colors.white, fontSize: 12, letterSpacing: 1.2)),
      const SizedBox(width: 14),
      const Icon(Icons.arrow_downward_rounded, color: _accent, size: 19),
    ]),
  ],
);

Widget _portrait(double width, bool compact) {
  final imageHeight = compact
      ? (width * .72).clamp(230.0, 350.0)
      : (width * .43).clamp(370.0, 560.0);
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 13, bottom: 13),
        child: Container(
          height: imageHeight,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: _accent, width: 1.5)),
          child: ClipRect(child: Image.asset('assets/image/profile2.png', fit: BoxFit.cover,
            alignment: const Alignment(0, -.34), semanticLabel: 'Portrait of Reyhan Septri Asta')),
        ),
      ),
      Positioned(right: 0, bottom: 0, child: Container(width: 60, height: 60, color: _accent,
        child: const Icon(Icons.north_east_rounded, color: _ink, size: 27))),
      Positioned(left: 16, bottom: 30, child: Text('01  /  INTRODUCTION',
        style: GoogleFonts.spaceMono(color: Colors.white, fontSize: 12, letterSpacing: 1.2))),
    ],
  );
}

Widget homeAbout(BuildContext context, double width, double height) {
  final compact = width < 800;
  final phoneWidth = compact ? (width * .63).clamp(205.0, 270.0).round() : (width * .24).clamp(220.0, 280.0).round();
  final phone = Center(child: RepaintBoundary(child: PhoneWidget(height: (phoneWidth * 1.96).round(), width: phoneWidth)));
  final copy = _aboutCopy(context, compact);
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: compact ? 0.0 : height.clamp(650.0, 980.0)),
    color: _paper,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 24 : width * .09, vertical: compact ? 76 : 90),
      child: compact
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: copy)),
            const SizedBox(height: 48),
            FadeInRight(config: BaseAnimationConfig(delay: 160.ms, duration: 750.ms, child: phone)),
          ])
        : Row(children: [
            Expanded(flex: 5, child: FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: copy))),
            SizedBox(width: width * .07),
            Expanded(flex: 4, child: FadeInRight(config: BaseAnimationConfig(delay: 150.ms, duration: 750.ms, child: phone))),
          ]),
    ),
  );
}

Widget _aboutCopy(BuildContext context, bool compact) => Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('02  /  THE PERSON BEHIND THE CODE', style: GoogleFonts.spaceMono(
      fontSize: 12, letterSpacing: 1.2, color: AppColor.darkUI)),
    const SizedBox(height: 26),
    Text('A little more\nabout me.', style: GoogleFonts.poppins(
      fontSize: compact ? 43 : 64, fontWeight: FontWeight.w700, height: 1.08,
      letterSpacing: -2.3, color: _ink)),
    const SizedBox(height: 25),
    Container(height: 3, width: 58, color: _ink),
    const SizedBox(height: 25),
    ConstrainedBox(constraints: const BoxConstraints(maxWidth: 480),
      child: Text('I’m Reyhan, a mobile developer based in Jakarta. I enjoy shaping ideas into products people love to use, from the first interaction to the details that make everything feel effortless.',
        style: GoogleFonts.poppins(fontSize: compact ? 14 : 16, height: 1.8, color: AppColor.darkUI))),
    const SizedBox(height: 34),
    OutlinedButton.icon(
      onPressed: () => GoRouter.of(context).go('/formalities'),
      icon: const Icon(Icons.arrow_outward_rounded, size: 18),
      label: const Text('More about me'),
      style: OutlinedButton.styleFrom(
        foregroundColor: _ink, side: const BorderSide(color: _ink),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    ),
  ],
);
