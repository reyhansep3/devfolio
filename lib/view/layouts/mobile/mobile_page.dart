import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/service_provide.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({Key? key}) : super(key: key);

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey gkey = GlobalKey();
    return Container(
      color: const Color(0xff00285d),
      child: Column(
        children: [
          const Navbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopSection(
                    key: gkey,
                  ),
                  const AboutMe(),
                  ProjectSection(),
                  const ContactSection()
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
