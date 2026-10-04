import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

const _ink = Color(0xFF151715);
const _surface = Color(0xFF202420);
const _rule = Color(0xFF424A42);
const _muted = Color(0xFFB9BDB6);
const _accent = AppColor.yellowgreen;

Widget blogCard(BuildContext context, Map<String, dynamic> blog, {int index = 1}) =>
    _JournalCard(blog: blog, index: index);

class _JournalCard extends StatefulWidget {
  const _JournalCard({required this.blog, required this.index});

  final Map<String, dynamic> blog;
  final int index;

  @override
  State<_JournalCard> createState() => _JournalCardState();
}

class _JournalCardState extends State<_JournalCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 800;
    final image = Container(
      width: double.infinity,
      height: compact ? 205 : 305,
      decoration: const BoxDecoration(
        color: _ink,
        image: DecorationImage(
          image: AssetImage('assets/image/blog_background.png'),
          fit: BoxFit.cover,
          opacity: .55,
        ),
      ),
      padding: const EdgeInsets.all(25),
      alignment: Alignment.bottomLeft,
      child: Text('DEV / NOTES', style: GoogleFonts.spaceMono(
        color: _accent, fontSize: 12, letterSpacing: 1.4)),
    );
    final details = Padding(
      padding: EdgeInsets.all(compact ? 24 : 42),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('FIELD NOTE  ${widget.index.toString().padLeft(2, '0')}',
          style: GoogleFonts.spaceMono(color: _accent, fontSize: 12, letterSpacing: 1.2)),
        const SizedBox(height: 18),
        Text(widget.blog['title']?.toString() ?? 'Untitled', style: GoogleFonts.poppins(
          color: Colors.white, fontSize: compact ? 27 : 36,
          fontWeight: FontWeight.w700, height: 1.2, letterSpacing: -1.2)),
        const SizedBox(height: 15),
        Text(widget.blog['subtitle']?.toString() ?? '', style: GoogleFonts.poppins(
          color: _muted, fontSize: compact ? 13 : 15, height: 1.7)),
        const SizedBox(height: 28),
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text('READ ARTICLE', style: GoogleFonts.spaceMono(
            color: _accent, fontSize: 12, letterSpacing: 1.1)),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_outward_rounded, size: 16, color: _accent),
        ]),
      ]),
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go('/blog/${widget.blog['id']}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          decoration: BoxDecoration(
            color: _surface,
            border: Border.all(color: _hovered ? _accent : _rule),
            boxShadow: _hovered
              ? [BoxShadow(color: _accent.withValues(alpha: .12), blurRadius: 26)]
              : null,
          ),
          child: compact
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [image, details])
            : Row(children: [Expanded(flex: 4, child: image), Expanded(flex: 6, child: details)]),
        ),
      ),
    );
  }
}
