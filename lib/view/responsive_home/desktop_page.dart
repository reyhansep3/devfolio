import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/sections/aboutme_section.dart';
import 'package:flutter_portofolio/view/sections/contact_section.dart';
import 'package:flutter_portofolio/view/sections/project_list.dart';
import 'package:flutter_portofolio/view/sections/top_section.dart';
import 'package:flutter_portofolio/view/widgets/navigation_bar.dart';
import 'package:flutter_portofolio/view/sections/service_provide.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey gkey = GlobalKey();
    return Column(
      mainAxisSize: MainAxisSize.min,
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
