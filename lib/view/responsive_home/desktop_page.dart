import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/sections/contact_section.dart';
import 'package:flutter_portofolio/view/sections/project_list.dart';
import 'package:flutter_portofolio/view/sections/top_section.dart';
import 'package:flutter_portofolio/view/widgets/navigation_bar.dart';
import 'package:flutter_portofolio/view/sections/service_provide.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            elevation: 0,
            toolbarHeight: 80,
            flexibleSpace: Navbar(),
          ),

          const SliverToBoxAdapter(child: TopSection()),
          const SliverToBoxAdapter(child: AboutMe()),
          // const SliverToBoxAdapter(child: ToolsSection()),
          SliverToBoxAdapter(child: ProjectSection()),
          const SliverToBoxAdapter(child: ContactSection()),
        ],
      ),
    );
  }
}