import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/blog/widget/blog_card.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _body = Color(0xFF515850);
const _accent = AppColor.yellowgreen;

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  late final Future<List<Map<String, dynamic>>> _blogs = _loadBlogs();

  Future<List<Map<String, dynamic>>> _loadBlogs() async {
    final raw = await rootBundle.loadString('assets/json/blog.json');
    final decoded = jsonDecode(raw);
    final items = decoded is Map<String, dynamic> ? decoded['blog'] : decoded;
    if (items is! List) throw const FormatException('Invalid blog data');

    final seen = <String>{};
    return items.whereType<Map>().map((item) => Map<String, dynamic>.from(item)).where((blog) {
      // The source currently repeats the same article under multiple IDs.
      final identity = jsonEncode([blog['title'], blog['subtitle'], blog['sections']]);
      return seen.add(identity);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 800;
    final inset = compact ? 24.0 : width * .09;

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _blogs,
      builder: (context, snapshot) {
        final blogs = snapshot.data ?? const <Map<String, dynamic>>[];
        return Column(children: [
          Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: compact ? 0 : MediaQuery.sizeOf(context).height),
            decoration: const BoxDecoration(
              color: _ink,
              image: DecorationImage(
                image: AssetImage('assets/image/blog_background.png'),
                fit: BoxFit.cover,
                opacity: .25,
              ),
            ),
            padding: EdgeInsets.fromLTRB(inset, compact ? 80 : 155, inset, compact ? 86 : 110),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('WRITING  /  FIELD NOTES', style: GoogleFonts.spaceMono(
                    color: _accent, fontSize: 12, letterSpacing: 1.3)),
                  const SizedBox(height: 26),
                  Text('Ideas, lessons,\nand things worth\nsharing.', style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: compact ? (width * .115).clamp(37.0, 54.0) : (width * .055).clamp(54.0, 78.0),
                    fontWeight: FontWeight.w700,
                    height: 1.07,
                    letterSpacing: -2.5,
                  )),
                  const SizedBox(height: 26),
                  Container(width: 58, height: 3, color: _accent),
                  const SizedBox(height: 25),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Text('Thoughts from building mobile products: the problems, experiments, and lessons along the way.',
                      style: GoogleFonts.poppins(color: const Color(0xFFB9BDB6),
                        fontSize: compact ? 14 : 16, height: 1.75)),
                  ),
                ],
              ))),
            ]),
          ),
          Container(
            width: double.infinity,
            color: _paper,
            padding: EdgeInsets.fromLTRB(inset, compact ? 76 : 105, inset, compact ? 88 : 110),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('01  /  THE JOURNAL', style: GoogleFonts.spaceMono(
                color: _body, fontSize: 12, letterSpacing: 1.3)),
              const SizedBox(height: 24),
              Text('Latest writing.', style: GoogleFonts.poppins(
                color: _ink, fontSize: compact ? 42 : 62,
                fontWeight: FontWeight.w700, letterSpacing: -2.2)),
              const SizedBox(height: 18),
              Container(width: 58, height: 3, color: _ink),
              SizedBox(height: compact ? 38 : 52),
              if (snapshot.hasError)
                Text('Articles are unavailable right now.', style: GoogleFonts.poppins(color: _body))
              else if (!snapshot.hasData)
                const Center(child: CircularProgressIndicator(color: _ink))
              else if (blogs.isEmpty)
                Text('No articles yet.', style: GoogleFonts.poppins(color: _body))
              else
                for (var index = 0; index < blogs.length; index++) ...[
                  ScrollReveal(fromLeft: index.isEven,
                    child: blogCard(context, blogs[index], index: index + 1)),
                  if (index != blogs.length - 1) const SizedBox(height: 22),
                ],
            ]),
          ),
        ]);
      },
    );
  }
}
