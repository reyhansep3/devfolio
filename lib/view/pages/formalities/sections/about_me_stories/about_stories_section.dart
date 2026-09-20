import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me_stories/dimension/stories_desktop.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me_stories/dimension/stories_mobile.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me_stories/dimension/stories_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
// import 'package:url_launcher/url_launcher.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: (context) => storiesMobileBody(context, width, height),
      tablet: (context) => storiesTabletBody(context, width, height),
      desktop: (context) => storiesDesktopBody(context, width, height),
    );
  }
}