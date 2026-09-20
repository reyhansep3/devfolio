import 'package:flutter/material.dart';
import 'package:flutter_portofolio/data/datasource/experience_local_datasource.dart';

import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/dimension/skills_experties_desktop.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/dimension/skills_experties_mobile.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/dimension/skills_experties_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

// import 'package:url_launcher/url_launcher.dart';

class SkillsExpertiesSection extends StatefulWidget {
  const SkillsExpertiesSection({super.key});

  @override
  State<SkillsExpertiesSection> createState() => _SkillsExpertiesSectionState();
}

class _SkillsExpertiesSectionState extends State<SkillsExpertiesSection> {
  final datasource = ExperienceLocalDatasource();
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: (context) => skillExpertiesMobileBody(
        context, 
        width, 
        height,
        selectedCategory,
        (index){
          setState(() {
            selectedCategory = index;
          });
        }
      ),
      tablet: (context) => skillExpertiesTabletBody(
        context, 
        width, 
        height,
        selectedCategory,
        (index){
          setState(() {
            selectedCategory = index;
          });
        }
      ),
      desktop: (context) => skillExpertiesDesktopBody(
        context, 
        width, 
        height,
        selectedCategory,
        (index){
          setState(() {
            selectedCategory = index;
          });
        }),
    );
  }
}