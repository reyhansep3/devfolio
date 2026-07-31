import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/dimension/about_me_desktop.dart';
import 'package:flutter_portofolio/view/pages/formalities/widgets/animation_flying.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
// import 'package:url_launcher/url_launcher.dart';

class FormalitiesSection extends StatelessWidget {
  const FormalitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: _mobileBody(width, height),
      tablet: _tabletBody(width, height),
      desktop: desktopBody(context, width, height),
    );
  }
}




/// ================= MOBILE =================
Widget _mobileBody(double width, double height) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(20),
    color: Colors.black,
    child: const Column(
      children: [
        Text("Mobile View", style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}

/// ================= TABLET =================
Widget _tabletBody(double width, double height) {
  return Container(
    width: width,
    height: height,
    color: Colors.black,
    child: const Center(
      child: Text("Tablet View", style: TextStyle(color: Colors.white)),
    ),
  );
}