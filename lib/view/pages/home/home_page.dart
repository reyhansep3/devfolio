import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/layouts/desktop/desktop_page.dart';
import 'package:flutter_portofolio/view/layouts/mobile/mobile_page.dart';
import 'package:flutter_portofolio/view/layouts/tablet/tablet_page.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class Homepage extends StatelessWidget {
  final String section;
  const Homepage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivelayout(
        desktop: (context) => DesktopPage(section: section),
        mobile: (context) => MobilePage(section: section),
        tablet: (context) => TabletPage(section: section),
      ),
    );
  }
}
