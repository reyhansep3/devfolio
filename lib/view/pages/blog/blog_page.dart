import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/blog/dimension_dashboard/blog_dashboard_desktop.dart';
import 'package:flutter_portofolio/view/pages/blog/dimension_dashboard/blog_dashboard_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
      desktop: (context) => const BlogDashboardDesktop(),
      mobile: (context) => const BlogDashboardTablet(),
      tablet: (context) => const BlogDashboardTablet(),
    );
  }
}