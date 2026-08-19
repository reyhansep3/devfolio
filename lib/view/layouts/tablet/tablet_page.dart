import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/blog/blog_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';

class TabletPage extends StatelessWidget {
  final String section;
  const TabletPage({Key? key, required this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Navbar(selectedSection: section),
          ),
          if (section == 'formalities') ...[
            const SliverToBoxAdapter(child: FormalitiesSection()),
            SliverToBoxAdapter(child: ExperienceSection()),
          ] else if (section == 'project') ...[
            SliverToBoxAdapter(child: ProjectList()),
          ] else if (section == 'blog') ...[
            const SliverToBoxAdapter(child: BlogPage()),
            const SliverToBoxAdapter(child: ContactSection())
          ] else ...[
            const SliverToBoxAdapter(child: TopSection()),
            const SliverToBoxAdapter(child: AboutMe()),
            SliverToBoxAdapter(
              child: ProjectSection(
                onViewAll: () => GoRouter.of(context).go('/project'),
              ),
            ),
            const SliverToBoxAdapter(child: ContactSection()),
          ],
        ],
      ),
    );
  }
}
