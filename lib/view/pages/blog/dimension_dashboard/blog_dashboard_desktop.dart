import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
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


      if (decoded is Map<String, dynamic>) {
        final data = decoded['blog'];

        if (data is! List) {
          throw Exception(
            'Property "blog" bukan List',
          );
        }
        blogList = data;
      }
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
  if (isLoading) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      width: mq.MediaQueryValues(context).width,
      height: 500,
    );
  }

  if (blogs.isEmpty) {
    return const Center(
      child: Text(
        'No blog available',
      ),
    );
  }

  return Container(
   
    decoration: const BoxDecoration(
      color: Colors.black,
    ),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: mq.MediaQueryValues(context).height * 0.4,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    "assets/image/blog_background.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha: 0.05),
                                Colors.white.withValues(alpha: 0.02),
                              ],
                            ),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.green,
                                  size: mq.MediaQueryValues(context)
                                          .height *
                                      0.02,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.green,
                                  size: mq.MediaQueryValues(context)
                                          .height *
                                      0.02,
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          width: mq.MediaQueryValues(context).width * 0.005,
                        ),

                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "DEV",
                                style: AppFontStyle
                                    .vcrMonoHeadingSmall
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.white,
                                ),
                              ),
                              TextSpan(
                                text: " NOTES",
                                style: AppFontStyle
                                    .vcrMonoHeadingSmall
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.yellowgreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height:
                          mq.MediaQueryValues(context).height * 0.02,
                    ),

                    Text(
                      "Thoughts, tutorials, and things I’ve learned",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),

                    Text(
                      "Sharing my journey in mobile development, clean architecture, and building better user experiences",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: mq.MediaQueryValues(context).height * 0.04,
        ),
        Padding(
           padding: EdgeInsets.symmetric(horizontal: mq.MediaQueryValues(context).width * 0.15),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing:
                  mq.MediaQueryValues(context).width * 0.05,
              mainAxisSpacing:
                  mq.MediaQueryValues(context).height * 0.05,
          
              // Sesuaikan dengan ukuran card
              childAspectRatio: 1.15,
            ),
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              if(index % 2 ==0){
                return RepaintBoundary(
                child: FadeInLeft(
                  config: BaseAnimationConfig(
                    delay: 300.ms,
                    child: blogCard(
                      context,
                      blog,
                    ),
                  ),
                ),
              );
              }else{
                return RepaintBoundary(
                child: FadeInRight(
                  config: BaseAnimationConfig(
                    delay: 300.ms,
                    child: blogCard(
                      context,
                      blog,
                    ),
                  ),
                ),
              );
              }
              
            },
          ),
        ),

        SizedBox(
          height: mq.MediaQueryValues(context).height * 0.08,
        ),
      ],
    ),
  );
}
}