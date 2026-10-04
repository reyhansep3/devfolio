import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
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
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
      mobile: (context) => mobileBody(
        context,
        context.width,
        context.height,
        _isHovered,
        _setHover,
      ),
      tablet: (context) => tabletBody(
        context,
        context.width,
        context.height,
        _isHovered,
        _setHover,
      ),
      desktop: (context) => desktopBody(
        context,
        context.width,
        context.height,
        _isHovered,
        _setHover,
      ),
    );
  }

  void _setHover(bool value) {
    if (_isHovered != value) setState(() => _isHovered = value);
  }
}
