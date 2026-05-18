import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/formalities/widgets/animation_flying.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/widget_animation.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
import 'package:svg_flutter/svg.dart';
// import 'package:url_launcher/url_launcher.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isHovered = false;
    return Responsivelayout(
      mobile: _mobileBody(width, height),
      tablet: _tabletBody(width, height),
      desktop: _desktopBody(
        context, width, height, isHovered,(val) => setState(() => isHovered = val), ),
    );
  }
}

// void launchURL(String url) async {
//   if (await canLaunch(url)) {
//     await launch(url);
//   }
// }

/// ================= DESKTOP =================
Widget _desktopBody(
  BuildContext context, double width, double height,
  bool isHovered,void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix
  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Stack(
      children: [
        backgroundImage(),
        Padding(
          padding:  EdgeInsets.all(context.height*0.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("// Flutter Mobile Developer",
                        style: AppFontStyle.largeText.copyWith(
                          color: AppColor.grey1, 
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold)
                        ),
                      
                      SizedBox(height: context.height*0.03,),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Rey",
                              style: AppFontStyle.largeTextPSP2.copyWith(
                                fontSize: 70,
                                color: AppColor.white, 
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                height: 0.92,
                              ),
                            ),
                            TextSpan(
                              text: "han",
                              style: AppFontStyle.largeTextPSP2.copyWith(
                                fontSize: 70,
                                color: AppColor.yellowgreen, 
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                height: 0.92,
                              ),
                            ),
                            TextSpan(
                              text: "\nSeptri\nAsta",
                              style: AppFontStyle.largeTextPSP2.copyWith(
                                fontSize: 70,
                                color: AppColor.white, 
                                fontWeight: FontWeight.bold,
                                letterSpacing: -2,
                                height: 0.92,
                              ),
                            ),
                          ]
                        )
                      ),
                      SizedBox(height: context.height*0.03,),
                      Text("Clean code. Scalable solutions.",
                      style: AppFontStyle.largeText.copyWith(
                        color: AppColor.grey1, 
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)
                      ),
                      
                      
                    ],
                  ),
                  SizedBox(height: context.height*0.02,),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("03",
                            style: AppFontStyle.largeTextPSP.copyWith(
                              color: AppColor.yellowgreen, 
                              fontSize: 28, 
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold)
                          ),
                          Text("Years exp.",
                            style: AppFontStyle.mediumText.copyWith(
                              color: AppColor.grey1, 
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      SizedBox(width: context.width*0.02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("06",
                            style: AppFontStyle.largeTextPSP.copyWith(
                              color: AppColor.yellowgreen,
                              fontSize: 28, 
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold)
                          ),
                          Text("Projects.",
                            style: AppFontStyle.mediumText.copyWith(
                              color: AppColor.grey1, 
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  // Text("Reyhan\nSeptri\nAsta",
                    // style: AppFontStyle.mediumText.copyWith(
                    //   fontSize: 120,
                    //   color: AppColor.white, 
                    //   fontWeight: FontWeight.bold,
                    //   letterSpacing: -2,
                    //   height: 0.92,
                    // ),
                  // ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      FlyingWidget(
                        amplitude: 10,
                        widget: Container(
                          margin: EdgeInsets.only(right: context.width*0.02),
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.02),
                            child: Center(
                              child: Text(
                                "Flutter",
                                style: AppFontStyle.mediumText2.copyWith(color: AppColor.yellowgreen),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height*0.1,),
                      FlyingWidget(
                        amplitude: 10,
                        math: 3,
                        widget: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.01),
                            child: Center(
                              child: SvgPicture.asset("assets/icons/apple.svg",height: context.height*0.05,)
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: context.height*0.1,),
                      // const LogoWidgetAnimation(),
                      SizedBox(height: context.height*0.2,),
                      FlyingWidget(
                        amplitude: 10,
                        math: 2,
                        widget: Container(
                          margin: EdgeInsets.only(right: context.width*0.03),
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.01),
                            child: Center(
                              child: SvgPicture.asset("assets/icons/playstore.svg",height: context.height*0.05,)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const PhoneWidget(),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      FlyingWidget(
                        amplitude: 10,
                        math: 2,
                        widget: Container(
                          margin: EdgeInsets.only(left: context.width*0.03),
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.01),
                            child: Center(
                              child: SvgPicture.asset("assets/icons/android.svg",height: context.height*0.05,)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height*0.2,),
                      FlyingWidget(
                        amplitude: 8,
                        widget: Container(
                          margin: EdgeInsets.only(left: context.width*0.02),
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.015),
                            child: Center(
                              child: Text(
                                "Dart",
                                  style: AppFontStyle.mediumText.copyWith(color: AppColor.grey2),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: context.height*0.25,),
                      FlyingWidget(
                        amplitude: 10,
                        math: 2,
                        widget: Container(
                          margin: EdgeInsets.only(left: context.width*0.03),
                          decoration: BoxDecoration(
                            color: const Color(0xff1a1a1a),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.grey1)
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: context.height*0.01, horizontal: context.width*0.01),
                            child: Center(
                              child: SvgPicture.asset("assets/icons/appstore.svg",height: context.height*0.05,)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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