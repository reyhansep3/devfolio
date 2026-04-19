import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/formalities/widgets/animation_flying.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
// import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: _mobileBody(width, height),
      tablet: _tabletBody(width, height),
      desktop: _desktopBody(context, width, height),
    );
  }
}

// void launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// }

/// ================= DESKTOP =================
Widget _desktopBody(BuildContext context, double width, double height) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix
  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.15,
      vertical: context.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Work Experience?",
              style: AppFontStyle.veryLargeText),
          
          
                        
          // SizedBox(height: context.height*0.02),   
          // FlyingWidget(
          //   amplitude: 5,
          //   widget: Center(
          //     child: Image.asset(
          //       "assets/image/profile.png",
          //       width: context.width*0.4,
          //       height: context.height*0.4,
          //     ),
          //   ),
          // ),
                 
          
        ],
      ),
    ),
  );
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