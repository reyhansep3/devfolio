import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/about_desktop.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/about_mobile.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/dimension/about_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class SkillSection extends StatefulWidget {
  const SkillSection({super.key});

  @override
  State<SkillSection> createState() => _SkillSectionState();
}

class _SkillSectionState extends State<SkillSection> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
      desktop: (context) => skillsDesktopBody(
        context,
        context.width,
        context.height,
        isHovered,
        (val) => setState(() => isHovered = val),
      ),
      mobile: (context) => skillsMobileBody(
        context,
        context.width,
        context.height,
        isHovered,
        (val) => setState(() => isHovered = val),
      ),
      tablet: (context) => skillsTabletBody(
        context,
        context.width,
        context.height,
        isHovered,
        (val) => setState(() => isHovered = val),
      ),
    );
  }
}