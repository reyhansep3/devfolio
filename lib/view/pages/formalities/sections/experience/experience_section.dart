import 'package:flutter/material.dart';
import 'package:flutter_portofolio/data/datasource/experience_local_datasource.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/dimension/experience_desktop.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/dimension/experience_mobile.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/dimension/experience_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

// import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  ExperienceSection({super.key});
  
  final datasource = ExperienceLocalDatasource();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: (context) => experienceMobileBody(context, width, height, datasource),
      tablet: (context) => experienceTabletBody(context, width, height, datasource),
      desktop: (context) => experienceDesktopBody(context, width, height, datasource),
    );
  }
}