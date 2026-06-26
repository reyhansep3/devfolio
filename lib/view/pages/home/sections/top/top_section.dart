import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/dimension/top_mobile.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/dimension/top_desktop.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/dimension/top_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
// import 'package:url_launcher/url_launcher.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isHovered = false;
    return Responsivelayout(
      mobile: mobileBody(
        context, width, height, isHovered,(val) => setState(() => isHovered = val), 
      ),
      tablet: tabletBody(
        context, width, height, isHovered,(val) => setState(() => isHovered = val), ),
      desktop: desktopBody(
        context, width, height, isHovered,(val) => setState(() => isHovered = val), ),
    );
  }
}
