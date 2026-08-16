import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class BlogDetailPage extends StatefulWidget {
  final String id;
  const BlogDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  Map<String, dynamic>? blog;
  final Map<String, GlobalKey> headingKeys = {};

  @override
  void initState() {
    super.initState();
    _loadBlog();
  }

  Future<void> _loadBlog() async {
    final raw = await rootBundle.loadString('assets/blog.json');
    final decoded = json.decode(raw) as List<dynamic>;
    final found = decoded.cast<Map<String, dynamic>>().firstWhere(
          (b) => b['id'] == widget.id,
          orElse: () => {},
        );
    if (found.isNotEmpty) {
      setState(() {
        blog = found;
      });
    }
  }

  List<String> _extractHeadings(String content) {
    final lines = content.split('\n');
    final headings = <String>[];
    for (var line in lines) {
      line = line.trim();
      if (line.startsWith('## ')) {
        headings.add(line.replaceFirst('## ', '').trim());
      } else if (line.startsWith('# ')) {
        headings.add(line.replaceFirst('# ', '').trim());
      }
    }
    return headings;
  }

  void _scrollToHeading(String heading) {
    final key = headingKeys[heading];
    if (key == null) return;
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (blog == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final content = blog!['content'] as String; // markdown-like plain text
    final parts = content.split('\n\n');
    final headings = _extractHeadings(content);
    for (var h in headings) {
      headingKeys.putIfAbsent(h, () => GlobalKey());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(blog!['title'] ?? ''),
        backgroundColor: Colors.black,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final isWide = constraints.maxWidth > 800;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: parts.map<Widget>((p) {
                      final trimmed = p.trim();
                      if (trimmed.startsWith('# ')) {
                        final text = trimmed.replaceFirst('# ', '').trim();
                        return Padding(
                          key: headingKeys[text],
                          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        );
                      } else if (trimmed.startsWith('## ')) {
                        final text = trimmed.replaceFirst('## ', '').trim();
                        return Padding(
                          key: headingKeys[text],
                          padding: const EdgeInsets.only(top: 12.0, bottom: 6.0),
                          child: Text(
                            text,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Text(
                            trimmed,
                            style: const TextStyle(fontSize: 16, height: 1.4),
                          ),
                        );
                      }
                    }).toList(),
                  ),
                ),
              ),
              if (isWide)
                const SizedBox(width: 24)
              else
                const SizedBox.shrink(),
              if (isWide)
                Expanded(
                  flex: 1,
                  child: Card(
                    elevation: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Table of Contents',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const Divider(),
                          Expanded(
                            child: ListView.builder(
                              itemCount: headings.length,
                              itemBuilder: (context, index) {
                                final h = headings[index];
                                return ListTile(
                                  dense: true,
                                  title: Text(h, style: const TextStyle(fontSize: 14)),
                                  onTap: () => _scrollToHeading(h),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        );
      }),
    );
  }
}
