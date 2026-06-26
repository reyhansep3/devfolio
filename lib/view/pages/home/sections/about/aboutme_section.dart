import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/aboutme_desktop.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/aboutme_mobile.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/aboutme_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: mobileBody(widthBody: width, heightBody: height * 0.2, context: context),
      desktop: desktopBody(widthBody: width, heightBody: height * 0.2, context: context),
      tablet: tabletBody(widthBody: width, heightBody: height * 0.2, context: context),
    );
  }
}
