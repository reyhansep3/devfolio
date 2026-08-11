import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/sections/contact_section.dart';
import 'package:flutter_portofolio/view/sections/project_list.dart';
import 'package:flutter_portofolio/view/sections/service_provide.dart';
import 'package:flutter_portofolio/view/sections/top_section.dart';
import 'package:flutter_portofolio/view/widgets/navigation_bar.dart';
import 'package:flutter_portofolio/view/utils.dart';

class TabletPage extends StatefulWidget {
  final String initialSection;
  const TabletPage({Key? key, this.initialSection = 'home'}) : super(key: key);

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  final topKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialSection == 'about') {
        scrollTo(aboutKey);
      } else if (widget.initialSection == 'project') {
        scrollTo(projectKey);
      } else if (widget.initialSection == 'contact') {
        scrollTo(contactKey);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff00285d),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Navbar(
              onNavTap: (section) {
                Navigator.pushReplacementNamed(context, sectionToRoute(section));
              },
            ),
            Container(key: topKey, child: const TopSection()),
            Container(key: aboutKey, child: const AboutMe()),
            const ToolsSection(),
            Container(key: projectKey, child: ProjectSection()),
            Container(key: contactKey, child: const ContactSection()),
          ],
        ),
      ),
    );
  }
}
