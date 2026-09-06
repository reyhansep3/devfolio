import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
  // Spasi vertikal pakai nilai tetap (bukan context.height) supaya footer
  // tidak ikut "loncat" saat browser di-resize vertikal. Inset horizontal
  // tetap mengikuti lebar agar responsif ke resize horizontal.
  static const double _horizontalInset = 0.15;
  static const double _verticalPad = 28.0;
  static const double _gap = 16.0;

  // Kolom "Resources" — setiap item navigasi ke rute go_router-nya.
  // About di-router memakai path '/formalities' (lihat main.dart).
  static const List<Map<String, String>> _resources = [
    {'label': 'Home', 'path': '/'},
    {'label': 'About', 'path': '/formalities'},
    {'label': 'Project', 'path': '/project'},
    {'label': 'Blog', 'path': '/blog'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        // Hanya SATU border atas — hindari garis dobel.
        border: Border(top: BorderSide(color: AppColor.white, width: 0.3)),
      ),
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Blok link footer.
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: context.width * _horizontalInset,
              vertical: _verticalPad,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reyhan Septri Asta',
                        style: AppFontStyle.poppinsBodyMedium
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(height: _gap),
                      Text(
                        'Crafting intuitive mobile experiences through clean architecture and thoughtful design',
                        style: AppFontStyle.poppinsBodySmall
                            .copyWith(color: AppColor.grey1),
                      ),
                      const SizedBox(height: _gap),
                      Text(
                        'Flutter Developer • Mobile Enthusiast',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'General',
                        style: AppFontStyle.poppinsBodySmall
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(height: _gap),
                      Text('Home',
                          style: AppFontStyle.poppinsBodySmall
                              .copyWith(color: AppColor.grey1)),
                      const SizedBox(height: _gap),
                      Text('Service',
                          style: AppFontStyle.poppinsBodySmall
                              .copyWith(color: AppColor.grey1)),
                      const SizedBox(height: _gap),
                      Text('Project',
                          style: AppFontStyle.poppinsBodySmall
                              .copyWith(color: AppColor.grey1)),
                      const SizedBox(height: _gap),
                      Text('Testimony',
                          style: AppFontStyle.poppinsBodySmall
                              .copyWith(color: AppColor.grey1)),
                      const SizedBox(height: _gap),
                      Text('Blog',
                          style: AppFontStyle.poppinsBodySmall
                              .copyWith(color: AppColor.grey1)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Resources',
                        style: AppFontStyle.poppinsBodySmall
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(height: _gap),
                      for (final item in _resources)
                        _FooterLink(
                          label: item['label']!,
                          path: item['path']!,
                          onNavigate: widget.onNavigate,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Garis pemisah — pakai Divider agar benar-benar membentang lebar,
          // dan sejajar dengan inset horizontal footer di atas.
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.width * _horizontalInset),
            child: const Divider(height: 1, thickness: 1, color: Colors.white24),
          ),
          const SizedBox(height: 15),

          // Copyright sejajar dengan link footer (kiri, inset sama).
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: context.width * _horizontalInset),
            child: Text(
              '© 2026 Reyhan. All rights reserved.',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white54,
              ),
            ),
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: _ContactSectionState._gap),
          child: Text(
            widget.label,
            style: AppFontStyle.poppinsBodySmall.copyWith(
              color: _hover ? AppColor.white : AppColor.grey1,
            ),
          ),
        ),
      ),
    );
  }
}
