import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:go_router/go_router.dart';

class ContactSection extends StatefulWidget {
  /// Callback navigasi dari link footer "Resources". Diberikan oleh halaman
  /// (Desktop/Tablet) agar bisa melakukan smooth-scroll ke atas saat tujuannya
  /// halaman yang sama, atau pindah halaman lewat go_router.
  final void Function(String path)? onNavigate;

  const ContactSection({Key? key, this.onNavigate}) : super(key: key);

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
