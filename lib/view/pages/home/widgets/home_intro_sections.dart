import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/about_palette.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/animated_messy_line.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · editorial section · existing Poppins and paper/ink palette.
// Pre-emit critique: P5 H4 E4 S5 R5 V4.
const _ink = Color(0xFF151715);
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
  final portrait = _portrait(context, width, compact);
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
              children: [portrait, const SizedBox(height: 32), intro],
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

Widget _portrait(BuildContext context, double width, bool compact) {
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
                    cacheWidth:
                        (imageWidth * MediaQuery.devicePixelRatioOf(context))
                            .round()
                            .clamp(1, 900),
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

// Hallmark · About section · warm editorial composition, phone and process.
// Pre-emit critique: P5 H5 E4 S5 R5 V5.
Widget homeAbout(BuildContext context, double width, double height) {
  final stacked = width < 1050;
  final inset = stacked ? 24.0 : width * .075;
  final phoneWidth = stacked ? (width - inset * 2).clamp(0.0, 300.0) : 300.0;
  final phone = Center(
    child: RepaintBoundary(
      child: Hero(
        tag: phonePreviewHeroTag,
        child: PhoneWidget(
          height: (phoneWidth * 1.96).round(),
          width: phoneWidth.round(),
        ),
      ),
    ),
  );

  return Container(
    width: double.infinity,
    color: AboutPalette.paper,
    padding: EdgeInsets.fromLTRB(
      inset,
      stacked ? 72 : 104,
      inset,
      stacked ? 86 : 112,
    ),
    child: stacked
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [phone, const SizedBox(height: 56), _aboutCopy(context)],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 300, child: ScrollReveal(child: phone)),
              const SizedBox(width: 76),
              Expanded(
                child: ScrollReveal(
                  fromLeft: false,
                  child: _aboutCopy(context),
                ),
              ),
            ],
          ),
  );
}

Widget _aboutCopy(BuildContext context) => LayoutBuilder(
  builder: (context, constraints) {
    final narrow = constraints.maxWidth < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          decoration: BoxDecoration(
            color: AboutPalette.accent,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            'Who I am',
            style: GoogleFonts.poppins(
              color: AboutPalette.ink,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Messy problems in. Working software out.',
          style: GoogleFonts.poppins(
            color: AboutPalette.ink,
            fontSize: narrow ? 43 : 64,
            fontWeight: FontWeight.w700,
            height: 1.02,
            letterSpacing: narrow ? -1.8 : -3,
          ),
        ),
        const SizedBox(height: 24),
        const AnimatedMessyLine(),
        const SizedBox(height: 22),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 680),
          child: Text(
            "From 'it's complicated' to 'it just works.' I get close to the problem, give it shape, then ship something people can rely on.",
            style: GoogleFonts.poppins(
              color: AboutPalette.body,
              fontSize: 16,
              height: 1.55,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _aboutSteps(),
        const SizedBox(height: 30),
        OutlinedButton(
          onPressed: () => GoRouter.of(context).go('/formalities'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AboutPalette.ink,
            side: const BorderSide(color: AboutPalette.ink, width: 1.5),
            shape: const StadiumBorder(),
            minimumSize: const Size(0, 48),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'More about me',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 18),
              Text(
                '↗',
                style: GoogleFonts.poppins(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  },
);

Widget _aboutSteps() => LayoutBuilder(
  builder: (context, constraints) {
    final stacked = constraints.maxWidth < 720;
    final steps = [
      _aboutStep(
        '01',
        'Get curious',
        'Dig into the real problem, not just the request. Trace how things work today and where they break.',
      ),
      _aboutStep(
        '02',
        'Shape it',
        'Turn the chaos into a clear plan: the right features, the right behavior, a build that stays manageable.',
      ),
      _aboutStep(
        '03',
        'Ship and sharpen',
        'Build backend and frontend, test, deliver, then keep polishing long after launch.',
      ),
    ];
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(stacked ? 26 : 30),
      decoration: BoxDecoration(
        color: AboutPalette.charcoal,
        borderRadius: BorderRadius.circular(24),
      ),
      child: stacked
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  steps[i],
                  if (i < steps.length - 1) ...[
                    const SizedBox(height: 26),
                    Container(
                      height: 1,
                      color: AboutPalette.mutedOnDark.withValues(alpha: .35),
                    ),
                    const SizedBox(height: 26),
                  ],
                ],
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < steps.length; i++) ...[
                  Expanded(child: steps[i]),
                  if (i < steps.length - 1) const SizedBox(width: 24),
                ],
              ],
            ),
    );
  },
);

Widget _aboutStep(String number, String title, String description) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      number,
      style: GoogleFonts.poppins(
        color: AboutPalette.accent,
        fontSize: 40,
        height: 1,
        fontWeight: FontWeight.w700,
      ),
    ),
    const SizedBox(height: 18),
    Text(
      title,
      style: GoogleFonts.poppins(
        color: AboutPalette.paper,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.15,
      ),
    ),
    const SizedBox(height: 10),
    Text(
      description,
      style: GoogleFonts.poppins(
        color: AboutPalette.mutedOnDark,
        fontSize: 13,
        height: 1.55,
      ),
    ),
  ],
);
