import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
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

List<String> cklCargoExperience = [
  "Developed and integrated an Human Resource Information System. leading to a substantial reduction of paperwork in the HR department.",
  "Developed and integrated a Driver Management System. leading to a substantial reduction of paperwork in the  Logistic department.",
  "Involved in Mobile Development in a project collaboration alongside UI/UX, Backend , and Quality Assurance on making Application.",
  "Successfully deploy a number of application to both PlayStore and AppStore",
  "Consume Rest API using Https and Dio",
  "Employ Provider State Management using MVVM Architecture for scalable codebases",
  "Troubleshoot and resolve technical challenges and ensure the stability and reliability of the Flutter Application",
  "Implemented various features and improvement on Android and IOS App using Flutter"

];
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
              style: AppFontStyle.poppinsHeadingLarge),
          SizedBox(height: context.height*0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Mobile Developer - Flutter",
                  style: AppFontStyle.poppinsHeadingLarge),
              Text("Aug 2023 - Present",
                  style: AppFontStyle.poppinsHeadingLarge.copyWith(color: AppColor.grey1)),
            ],
          ),
          SizedBox(height: context.height*0.02,),
          Row(
            children: [
              Text("PT. CKL Cargo",
                style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
              ),
              SizedBox(width: context.width*0.01,),
              Text("Contract",
                style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.white)
              ),
            ],
          ),
          SizedBox(height: context.height*0.02,),
          ListView.builder(
            itemCount: cklCargoExperience.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: context.height * 0.01,
                ),
                child: Text(
                  "•⁠ ${cklCargoExperience[index]}",
                  style: AppFontStyle.poppinsBodySmall,
                ),
              );
            },
          ),
          Text("Tools i use :",
              style: AppFontStyle.poppinsBodySmall),
          SizedBox(
            height: context.height * 0.06,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, item) {
                return Container(
                  // decoration: BoxDecoration(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withValues(alpha:0.05),
                        Colors.white.withValues(alpha:0.02),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.white.withValues(alpha:0.1),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha:0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                      child: Center(
                      child: Text(
                        "abc",
                        style: AppFontStyle.poppinsBodySmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                      ),
                    ),
                  )
                );
              }
            ),
          )
          
          
          
                        
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