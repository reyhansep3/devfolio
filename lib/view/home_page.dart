import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/responsive_home/desktop_page.dart';
import 'package:flutter_portofolio/view/responsive_home/mobile_page.dart';
import 'package:flutter_portofolio/view/responsive_home/tablet_page.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsivelayout(
        desktop: DesktopPage(),
        mobile: MobilePage(),
        tablet: TabletPage(),
      ),
    );
  }
}
