import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/blog/widget/blog_card.dart';

class BlogDashboardDesktop extends StatefulWidget {
  const BlogDashboardDesktop({super.key});

  @override
  State<BlogDashboardDesktop> createState() => _BlogDashboardDesktopState();
}

class _BlogDashboardDesktopState extends State<BlogDashboardDesktop> {
  List<Map<String, dynamic>> blogs = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBlogs();
  }

  Future<void> _loadBlogs() async {
    try {
      final raw = await rootBundle.loadString(
        'assets/json/blog.json',
      );

      final decoded = json.decode(raw);

      List<dynamic> blogList;

      // JSON:
      //
      // {
      //   "blog": [...]
      // }

      if (decoded is Map<String, dynamic>) {
        final data = decoded['blog'];

        if (data is! List) {
          throw Exception(
            'Property "blog" bukan List',
          );
        }

        blogList = data;
      }

      // JSON:
      //
      // [
      //   {...},
      //   {...}
      // ]

      else if (decoded is List) {
        blogList = decoded;
      } else {
        throw Exception(
          'Format blog.json tidak valid',
        );
      }

      final result = blogList
          .whereType<Map>()
          .map(
            (item) => Map<String, dynamic>.from(item),
          )
          .toList();

      debugPrint(
        'BLOG COUNT: ${result.length}',
      );

      for (final blog in result) {
        debugPrint(
          'BLOG: ${blog['id']} - ${blog['title']}',
        );

        debugPrint(
          'SECTIONS TYPE: ${blog['sections']?.runtimeType}',
        );

        debugPrint(
          'SECTIONS COUNT: '
          '${blog['sections'] is List ? (blog['sections'] as List).length : 0}',
        );
      }

      if (!mounted) return;

      setState(() {
        blogs = result;
        isLoading = false;
      });
    } catch (e, stackTrace) {
      debugPrint('ERROR LOAD BLOG: $e');
      debugPrintStack(stackTrace: stackTrace);

      if (!mounted) return;

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    if (isLoading) {
      return Container(
        decoration: const BoxDecoration(
        color: Colors.black
        ),
        width: mq.MediaQueryValues(context).width,
        height: MediaQuery.of(context).size.height - 80.0,
      );
    }

    if (blogs.isEmpty) {
      return const Center(
        child: Text(
          'No blog available',
        ),
      );
    }
    final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
    const navbarHeight = 80.0; // masih belum fix

    return Container(
      padding: EdgeInsets.only(
        left: mq.MediaQueryValues(context).width * 0.15,
        right: mq.MediaQueryValues(context).width * 0.15,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff00285d),
      ),
      width: mq.MediaQueryValues(context).width,
      height: screenHeight - navbarHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withValues(alpha: 0.04),
                          Colors.white.withValues(alpha: 0.02),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.06),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 12,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      'BLOG',
                      style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Insights & Articles',
                    style: AppFontStyle.poppinsBodyLarge.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
              Text(
                "Thoughts, tutorials, and things I’ve learned",
                style: AppFontStyle.poppinsBodyLarge.copyWith(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height * 0.01),
              Container(
                height: 1,
                width: mq.MediaQueryValues(context).width * 0.35,
                color: AppColor.white.withValues(alpha: 0.2),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
              Text(
                "Sharing my journey in mobile development, clean architecture, and building better user experiences",
                style: AppFontStyle.poppinsBodyLarge.copyWith(
                  color: AppColor.grey2,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height * 0.04),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: mq.MediaQueryValues(context).width * 0.05,
                  mainAxisSpacing: mq.MediaQueryValues(context).height * 0.05,
                  childAspectRatio: 1.15,
                ),
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return blogCard(
                    context,
                    blog,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}