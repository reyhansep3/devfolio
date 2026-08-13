import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/layouts/mobile/mobile_page.dart';
import 'package:flutter_portofolio/view/layouts/tablet/tablet_page.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
class Formalitiespage extends StatelessWidget {
  const Formalitiespage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivelayout(
        desktop: (context) => const FormalitiesSection(),
        mobile: (context) => MobilePage(section: 'formalities'),
        tablet: (context) => TabletPage(section: 'formalities'),
      ),
    );
  }
}
