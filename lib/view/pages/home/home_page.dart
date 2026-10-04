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
    final background = section == 'project'
        ? const Color(0xFFF0F0EB)
        : const Color(0xFF151715);
    return SelectionArea(
      child: Scaffold(
        backgroundColor: background,
        body: Responsivelayout(
          desktop: (context) => DesktopPage(section: section),
          mobile: (context) => MobilePage(section: section),
          tablet: (context) => TabletPage(section: section),
        ),
      ),
    );
  }
}
