import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/sections/blog/dimension/home_blog_desktop.dart';
import 'package:flutter_portofolio/view/pages/home/sections/blog/dimension/home_blog_mobile.dart';
import 'package:flutter_portofolio/view/pages/home/sections/blog/dimension/home_blog_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class AboutMe extends StatefulWidget {
  final VoidCallback? onViewAllArticles;
  const AboutMe({Key? key, this.onViewAllArticles}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
     bool isHovered = false;
    return Responsivelayout(
      mobile: (context) => mobileBody(widthBody: width, heightBody: height * 0.2, context: context),
      desktop: (context) => homeBlogDesktop(context,
        context.width,
        context.height,
        isHovered,
        (val) => setState(() => isHovered = val)),
      tablet: (context) => tabletBody(widthBody: width, heightBody: height * 0.2, context: context),
    );
  }
}
