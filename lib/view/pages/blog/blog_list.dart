import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_portofolio/view/pages/blog/detail_blog.dart';

class BlogListPage extends StatefulWidget {
  const BlogListPage({super.key});

  @override
  State<BlogListPage> createState() => _BlogListPageState();
}

class _BlogListPageState extends State<BlogListPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (blogs.isEmpty) {
      return const Center(
        child: Text(
          'No blog available',
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: blogs.length,
        itemBuilder: (context, index) {
          final blog = blogs[index];

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              debugPrint(
                'CLICK BLOG: ${blog['title']}',
              );

              debugPrint(
                'CLICK SECTIONS: '
                '${blog['sections']?.runtimeType}',
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlogDetailPage(
                    blog: blog,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog['title']
                              ?.toString() ??
                          '',
                      maxLines: 2,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      blog['subtitle']
                              ?.toString() ??
                          '',
                      maxLines: 3,
                      overflow:
                          TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}