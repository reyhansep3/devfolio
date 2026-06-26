import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/service_provide.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/navigation_bar.dart';

class TabletPage extends StatefulWidget {
  const TabletPage({Key? key}) : super(key: key);

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  final GlobalKey gkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopSection(key: gkey),
                  const AboutMe(),
                  ProjectSection(),
                  const ContactSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}