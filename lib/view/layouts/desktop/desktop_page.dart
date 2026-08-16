import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/blog/detail_blog.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';

class DesktopPage extends StatelessWidget {
  final String section;
  const DesktopPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: Column(
        children: [
          Container(
            height: 80,
            color: Colors.black,
            child: Navbar(selectedSection: section),
          ),
          Expanded(
            child: _buildPage(context),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    if (section == 'home') {
      return CustomScrollView(
        key: const ValueKey('home'),
        slivers: [
          const SliverToBoxAdapter(child: TopSection()),
          const SliverToBoxAdapter(child: AboutMe()),
          SliverToBoxAdapter(
            child: ProjectSection(
              onViewAll: () => GoRouter.of(context).go('/project'),
            ),
          ),
          const SliverToBoxAdapter(child: ContactSection()),
        ],
      );
    }

    if (section == 'formalities') {
      return CustomScrollView(
        key: const ValueKey('formalities'),
        slivers: [
          const SliverToBoxAdapter(child: FormalitiesSection()),
          SliverToBoxAdapter(child: ExperienceSection()),
          const SliverToBoxAdapter(child: ContactSection()),
        ],
      );
    }

    if (section == 'project') {
      return CustomScrollView(
        key: const ValueKey('project'),
        slivers: [
          SliverToBoxAdapter(child: ProjectList()),
          const SliverToBoxAdapter(child: ContactSection()),
        ],
      );
    }

    if (section == 'blog') {
      return const CustomScrollView(
        key: ValueKey('blog'),
        slivers: [
          SliverToBoxAdapter(child: DetailBlog()),
        ],
      );
    }

    return const SizedBox();
  }
}
