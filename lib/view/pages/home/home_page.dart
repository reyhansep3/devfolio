import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/layouts/desktop/desktop_page.dart';
import 'package:flutter_portofolio/view/layouts/mobile/mobile_page.dart';
import 'package:flutter_portofolio/view/layouts/tablet/tablet_page.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsivelayout(
        desktop: (context) => const DesktopPage(),
        mobile: (context) => const MobilePage(),
        tablet: (context) => const TabletPage(),
      ),
    );
  }
}
