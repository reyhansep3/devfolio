import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  /// Callback navigasi dari link footer "Resources". Diberikan oleh halaman
  /// (Desktop/Tablet) agar bisa melakukan smooth-scroll ke atas saat tujuannya
  /// halaman yang sama, atau pindah halaman lewat go_router.
  final void Function(String path)? onNavigate;
  final bool editorialStyle;
  final bool homeContact;
  final bool darkStyle;
  final String eyebrow;
  final String headline;

  const ContactSection({
    super.key,
    this.onNavigate,
    this.editorialStyle = false,
    this.homeContact = false,
    this.darkStyle = false,
    this.eyebrow = '04  /  GET IN TOUCH',
    this.headline = 'Have an idea?\nLet’s make it real.',
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  static const List<Map<String, String>> _resources = [
    {'label': 'Home', 'path': '/'},
    {'label': 'About', 'path': '/formalities'},
    {'label': 'Project', 'path': '/project'},
    {'label': 'Blog', 'path': '/blog'},
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.editorialStyle) {
      return _EditorialContact(
        onNavigate: widget.onNavigate,
        homeContact: widget.homeContact,
        darkStyle: widget.darkStyle,
        eyebrow: widget.eyebrow,
        headline: widget.headline,
      );
    }
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 720;
    final horizontalPadding = (width * (compact ? 0.07 : 0.12))
        .clamp(24.0, 180.0)
        .toDouble();

    return Container(
      color: AppColor.primary,
      padding: EdgeInsets.fromLTRB(horizontalPadding, 64, horizontalPadding, 32),
      child: Column(
        children: [
          compact
              ? Column(
                  children: [
                    const _ContactIntro(),
                    const SizedBox(height: 18),
                    _NavigationCard(onNavigate: widget.onNavigate),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 5, child: _ContactIntro()),
                    const SizedBox(width: 18),
                    Expanded(
                      flex: 4,
                      child: _NavigationCard(onNavigate: widget.onNavigate),
                    ),
                  ],
                ),
          const SizedBox(height: 24),
          const Divider(height: 1, color: Color(0x26313948)),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '© 2026 Reyhan Septri Asta. Built with care.',
              style: AppFontStyle.poppinsBodySmall.copyWith(
                color: AppColor.darkGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _contactInk = Color(0xFF151715);
const _contactPaper = Color(0xFFF0F0EB);
const _contactMuted = Color(0xFF515850);
const _contactRule = Color(0xFFB9BDB6);
const _contactMutedDark = Color(0xFFB9BDB6);
const _contactRuleDark = Color(0xFF424A42);
const _contactAccent = AppColor.yellowgreen;

class _EditorialContact extends StatelessWidget {
  const _EditorialContact({
    this.onNavigate,
    required this.homeContact,
    required this.darkStyle,
    required this.eyebrow,
    required this.headline,
  });

  final void Function(String path)? onNavigate;
  final bool homeContact;
  final bool darkStyle;
  final String eyebrow;
  final String headline;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 800;
    final inset = compact ? 24.0 : width * .09;
    final foreground = darkStyle ? Colors.white : _contactInk;
    final muted = darkStyle ? _contactMutedDark : _contactMuted;
    final rule = darkStyle ? _contactRuleDark : _contactRule;
    final accent = darkStyle ? _contactAccent : _contactInk;
    final intro = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(homeContact ? '04  /  CONTACT ME' : eyebrow, style: GoogleFonts.spaceMono(
          color: darkStyle ? _contactAccent : muted, fontSize: 12, letterSpacing: 1.3)),
        const SizedBox(height: 26),
        Text(homeContact ? 'Let’s stay\nin touch.' : headline, style: GoogleFonts.poppins(
          color: foreground,
          fontSize: compact ? 43 : 64,
          fontWeight: FontWeight.w700,
          height: 1.08,
          letterSpacing: -2.3,
        )),
        const SizedBox(height: 25),
        Container(width: 58, height: 3, color: accent),
        const SizedBox(height: 25),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Text(
            homeContact
                ? 'Feel free to contact me if you want to connect'
                : 'I care about the details that make a product useful. Explore my work and connect with me online.',
            style: GoogleFonts.poppins(
              color: muted,
              fontSize: compact ? 14 : 16,
              height: 1.75,
            ),
          ),
        ),
        const SizedBox(height: 33),
        if (homeContact) ...[
          FilledButton.icon(
            onPressed: () => launchUrl(Uri(
              scheme: 'mailto',
              path: 'reyhanseptri@gmail.com',
            )),
            icon: const Icon(Icons.mail_outline_rounded, size: 19),
            label: const Text('reyhanseptri@gmail.com'),
            style: FilledButton.styleFrom(
              backgroundColor: _contactInk,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
              textStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 31),
          Text('OR FIND ME HERE', style: GoogleFonts.spaceMono(
            color: muted, fontSize: 12, letterSpacing: 1.3)),
          const SizedBox(height: 15),
        ],
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse('https://www.linkedin.com/in/reyhan-septri-asta')),
              icon: const FaIcon(FontAwesomeIcons.linkedin, size: 17),
              label: const Text('LinkedIn'),
              style: FilledButton.styleFrom(
                backgroundColor: homeContact
                    ? Colors.transparent
                    : (darkStyle ? _contactAccent : _contactInk),
                foregroundColor: homeContact
                    ? foreground
                    : (darkStyle ? _contactInk : Colors.white),
                side: homeContact ? BorderSide(color: rule) : null,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                textStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => launchUrl(Uri.parse('https://github.com/reyhansep3')),
              icon: const FaIcon(FontAwesomeIcons.github, size: 17),
              label: const Text('GitHub'),
              style: OutlinedButton.styleFrom(
                foregroundColor: foreground,
                side: BorderSide(color: rule),
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                textStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => launchUrl(Uri.parse('https://www.instagram.com/reyhansep3asta/')),
              icon: const FaIcon(FontAwesomeIcons.instagram, size: 17),
              label: const Text('Instagram'),
              style: OutlinedButton.styleFrom(
                foregroundColor: foreground,
                side: BorderSide(color: rule),
                padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 18),
                textStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
    final links = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('KEEP EXPLORING', style: GoogleFonts.spaceMono(
          color: muted, fontSize: 12, letterSpacing: 1.3)),
        const SizedBox(height: 20),
        for (final item in _ContactSectionState._resources)
          _EditorialContactLink(
            label: item['label']!,
            path: item['path']!,
            onNavigate: onNavigate,
            darkStyle: darkStyle,
          ),
      ],
    );

    return Container(
      width: double.infinity,
      color: darkStyle ? _contactInk : _contactPaper,
      padding: EdgeInsets.fromLTRB(inset, compact ? 76 : 110, inset, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          compact
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ScrollReveal(child: intro),
                const SizedBox(height: 72),
                ScrollReveal(fromLeft: false, delay: const Duration(milliseconds: 150), child: links),
              ])
            : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(flex: 6, child: ScrollReveal(child: intro)),
                SizedBox(width: width * .09),
                Expanded(flex: 3, child: ScrollReveal(fromLeft: false, delay: const Duration(milliseconds: 150), child: links)),
              ]),
          SizedBox(height: compact ? 80 : 110),
          Divider(height: 1, color: rule),
          const SizedBox(height: 21),
          Text('© 2026 Reyhan Septri Asta. Built with care.',
            style: GoogleFonts.poppins(color: muted, fontSize: 12)),
        ],
      ),
    );
  }
}

class _EditorialContactLink extends StatefulWidget {
  const _EditorialContactLink({
    required this.label,
    required this.path,
    required this.darkStyle,
    this.onNavigate,
  });

  final String label;
  final String path;
  final bool darkStyle;
  final void Function(String path)? onNavigate;

  @override
  State<_EditorialContactLink> createState() => _EditorialContactLinkState();
}

class _EditorialContactLinkState extends State<_EditorialContactLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onNavigate != null) {
          widget.onNavigate!(widget.path);
        } else {
          GoRouter.of(context).go(widget.path);
        }
      },
      onHover: (value) => setState(() => _hovered = value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(
          color: widget.darkStyle ? _contactRuleDark : _contactRule))),
        child: Row(children: [
          Expanded(child: Text(widget.label, style: GoogleFonts.poppins(
            color: widget.darkStyle ? Colors.white : _contactInk,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ))),
          AnimatedSlide(
            duration: const Duration(milliseconds: 180),
            offset: Offset(_hovered ? .2 : 0, 0),
            child: Container(
              width: 30,
              height: 30,
              color: _hovered ? _contactAccent : Colors.transparent,
              child: Icon(Icons.arrow_outward_rounded, size: 18,
                color: widget.darkStyle && !_hovered ? _contactAccent : _contactInk),
            ),
          ),
        ]),
      ),
    );
  }
}

class _ContactIntro extends StatelessWidget {
  const _ContactIntro();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A313948),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColor.yellowgreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'LET’S CONNECT',
              style: AppFontStyle.vcrMonoSmall.copyWith(
                color: AppColor.darkUI,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Good products start\nwith clear thinking.',
            style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
              color: AppColor.darkUI,
              fontSize: 30,
              height: 1.08,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Flutter developer focused on reliable mobile experiences, clean architecture, and thoughtful interface details.',
            style: AppFontStyle.poppinsBodySmall.copyWith(
              color: AppColor.darkGray,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationCard extends StatelessWidget {
  const _NavigationCard({this.onNavigate});

  final void Function(String path)? onNavigate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColor.darkUI,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORE',
            style: AppFontStyle.vcrMonoSmall.copyWith(
              color: AppColor.yellowgreen,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          for (final item in _ContactSectionState._resources)
            _FooterLink(
              label: item['label']!,
              path: item['path']!,
              onNavigate: onNavigate,
            ),
        ],
      ),
    );
  }
}


class _FooterLink extends StatefulWidget {
  final String label;
  final String path;
  final void Function(String path)? onNavigate;
  const _FooterLink({
    required this.label,
    required this.path,
    this.onNavigate,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: () {
          if (widget.onNavigate != null) {
            widget.onNavigate!(widget.path);
          } else {
            GoRouter.of(context).go(widget.path);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          transform: Matrix4.translationValues(_hover ? 4 : 0, 0, 0),
          decoration: BoxDecoration(
            color: _hover ? AppColor.yellowgreen : Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: AppFontStyle.poppinsBodySmall.copyWith(
                    color: _hover ? AppColor.darkUI : AppColor.pureWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_outward_rounded,
                size: 17,
                color: _hover ? AppColor.darkUI : AppColor.yellowgreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
