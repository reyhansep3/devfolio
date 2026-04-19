import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/sections/contact_section.dart';
import 'package:flutter_portofolio/view/sections/project_list.dart';
import 'package:flutter_portofolio/view/sections/top_section.dart';
import 'package:flutter_portofolio/view/utils.dart';
import 'package:flutter_portofolio/view/widgets/navigation_bar.dart';
import 'package:flutter_portofolio/view/sections/service_provide.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  final topKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: CustomScrollView(
        slivers: [
          // const SliverAppBar(
          //   pinned: true,
          //   backgroundColor: Colors.black,
          //   elevation: 0,
          //   toolbarHeight: 80,
          //   flexibleSpace: Navbar(),
          // ),
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.black,
            elevation: 0,
            toolbarHeight: 80,
            flexibleSpace: Navbar(
              onNavTap: (section) {
                if (section == "home") scrollTo(topKey);
                if (section == "about") scrollTo(aboutKey);
                if (section == "project") scrollTo(projectKey);
                if (section == "contact") scrollTo(contactKey);
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              key: topKey,
              child: const TopSection(),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              key: aboutKey,
              child: const AboutMe(),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              key: projectKey,
              child: ProjectSection(),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              key: contactKey,
              child: const ContactSection(),
            ),
          ),
          // const SliverToBoxAdapter(child: TopSection()),
          // const SliverToBoxAdapter(child: AboutMe()),
          // // const SliverToBoxAdapter(child: ToolsSection()),
          // SliverToBoxAdapter(child: ProjectSection()),
          // const SliverToBoxAdapter(child: ContactSection()),
        ],
      ),
    );
  }
}