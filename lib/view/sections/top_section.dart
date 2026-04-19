import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/widgets/wiggly_arrow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
import 'package:svg_flutter/svg.dart';
// import 'package:url_launcher/url_launcher.dart';

class TopSection extends StatelessWidget {
  const TopSection({super.key});

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
  return SizedBox(
    height: screenHeight - navbarHeight,
    child: Stack(
      children: [
        backgroundImage(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hy! I Am",
                          style: AppFontStyle.borelVeryLargeText),
                      Text(
                        "Reyhan Septri Asta.",
                        style: AppFontStyle.veryLargeText
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                      
                    ],
                  ),
                            
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Clean code.",
                        style: AppFontStyle.largeText
                      ),
                      Text(
                        "Scalable\nsolutions.",
                        textAlign: TextAlign.right,
                        style: AppFontStyle.largeText
                      ),
                    ],
                  ),
                ],
              ),
                            
              SizedBox(height: context.height*0.02),   
              /// IMAGE
              Stack(
                children: [
                  Positioned(
                    left: context.width*0.1,
                    child: WiggleArrow(
                      amplitude: 5,
                      assetPath: "assets/image/Vector.svg",
                      width: context.width*0.15,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/image/profile.png",
                      width: context.width*0.4,
                      height: context.height*0.4,
                    ),
                  ),
                ],
              ),
                            
              SizedBox(height: context.height*0.02),
                            
              /// EXPERIENCE
              Row(
                children: [
                  Text("03", style: AppFontStyle.veryLargeText),
                  const SizedBox(width: 10),
                  Text("YEARS\nEXPERIENCE",
                      style: AppFontStyle.smallText),
                ],
              ),
                            
              SizedBox(height: context.height*0.02),
                            
              /// SOCIAL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Find Me On",
                          style: AppFontStyle.smallText),
                            
                      SizedBox(width: context.width*0.03),
                            
                      _icon("assets/icons/facebook.svg", context),
                      SizedBox(width: context.width*0.03),
                      _icon("assets/icons/instagram.svg", context),
                      SizedBox(width: context.width*0.03),
                      _icon("assets/icons/linkedin.svg", context),
                    ],
                  ),
                            
                  Text("Flutter Mobile Developer",
                          style: AppFontStyle.smallText),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

/// ICON FIX (biar ga error infinity)
Widget _icon(String path, BuildContext context) {
  return SizedBox(
    width: context.width*0.01,
    child: InkWell(
      onTap: () {},
      child: SvgPicture.asset(path, fit: BoxFit.contain),
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