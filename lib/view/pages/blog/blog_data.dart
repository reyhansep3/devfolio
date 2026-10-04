import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

Future<List<Map<String, dynamic>>> loadBlogs() async {
  final raw = await rootBundle.loadString('assets/json/blog.json');
  final decoded = jsonDecode(raw);
  final items = decoded is Map<String, dynamic> ? decoded['blog'] : decoded;
  if (items is! List) throw const FormatException('Invalid blog data');

  final seen = <String>{};
  return items
      .whereType<Map>()
      .map((item) => Map<String, dynamic>.from(item))
      .where((blog) {
        final identity = jsonEncode([
          blog['title'],
          blog['subtitle'],
          blog['sections'],
        ]);
        return seen.add(identity);
      })
      .toList();
}
