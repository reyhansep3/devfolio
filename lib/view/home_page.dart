import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/responsive_home/desktop_page.dart';
import 'package:flutter_portofolio/view/responsive_home/mobile_page.dart';
import 'package:flutter_portofolio/view/responsive_home/tablet_page.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class Homepage extends StatelessWidget {
  final String initialSection;
  const Homepage({super.key, this.initialSection = 'home'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivelayout(
        desktop: DesktopPage(initialSection: initialSection),
        mobile: MobilePage(initialSection: initialSection),
        tablet: TabletPage(initialSection: initialSection),
      ),
    );
  }
}
