import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/dimension/about_me_desktop.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/dimension/about_me_mobile.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/dimension/about_me_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
// import 'package:url_launcher/url_launcher.dart';

class FormalitiesSection extends StatelessWidget {
  const FormalitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: (context) => aboutMeMobileBody(context, width, height),
      tablet: (context) => aboutMeTabletBody(context, width, height),
      desktop: (context) => aboutMeDesktopBody(context, width, height),
    );
  }
}