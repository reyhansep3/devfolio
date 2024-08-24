import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/sections/contact_section.dart';
import 'package:flutter_portofolio/view/sections/project_list.dart';
import 'package:flutter_portofolio/view/sections/service_provide.dart';
import 'package:flutter_portofolio/view/sections/top_section.dart';
import 'package:flutter_portofolio/view/widgets/navigation_bar.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey gkey = GlobalKey();
    return Column(
      children: [
        const Navbar(),
        TopSection(
          key: gkey,
        ),
        const AboutMe(),
        ToolsSection(),
        ProjectSection(),
        const ContactSection()
      ],
    );
  }
}
