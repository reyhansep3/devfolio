import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  //   final String email = "reyhanseptri@gmail.com";

  // void _launchEmail() async {
  //   final Uri params = Uri(
  //     scheme: 'mailto',
  //     path: email,
  //     query: 'subject=Contacting You&body=Hello, I would like to discuss...', // Optional parameters
  //   );

  //   var url = params.toString();
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     // Handle the error if the email app can't be opened
  //     throw 'Could not launch $url';
  //   }
  // }

  // void _launchWhatsapp() async {
  //  const url = "https://wa.me/6281378850755";
  //  if (await canLaunch(url)) {
  //    await launch(url);
  //  } else {
  //  throw 'Could not launch $url';
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        border: Border(top: BorderSide(color: AppColor.white, width: 0.3))
      ),
      padding: EdgeInsets.only(bottom: context.height*0.03),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              left: context.width*0.15,
              right: context.width*0.15,
              top: context.height*0.03),
            decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(top: BorderSide(color: AppColor.white, width: 0.3))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reyhan Septri Asta",
                      style: AppFontStyle.mediumText.copyWith(color: AppColor.white)
                    ),
                
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Crafting intuitive mobile experiences through clean architecture and thoughtful design",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Flutter Developer • Mobile Enthusiast",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "General",
                      style: AppFontStyle.smallText.copyWith(color: AppColor.white)
                    ),
                
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Home",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Service",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Project",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Testimony",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Blog",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                  ],
                ),
          
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Resources",
                      style: AppFontStyle.smallText.copyWith(color: AppColor.white)
                    ),
                
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Resources 1",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    SizedBox(height: context.height*0.02),
                    Text(
                      "Resources 2",
                      style: AppFontStyle.verySmallText.copyWith(color: AppColor.grey1)
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
            
            // Divider
            Container(
              height: 1,
              color: Colors.white24,
            ),
        
            const SizedBox(height: 15),
        
            Text(
              "© 2026 Reyhan. All rights reserved.",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white54,
              ),
            ),
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.only(
          //     left: context.width*0.15,
          //     right: context.width*0.15,
          //     bottom: context.width*0.05,
          //     top: context.height*0.03),
          //   decoration: const BoxDecoration(
          //     color: Colors.black,
          //     border: Border(top: BorderSide(color: AppColor.white, width: 0.3))
          //   ),
          //   child: Column(
          //     children: [ const SizedBox(height: 20),
            
          //       // Divider
          //       Container(
          //         height: 1,
          //         color: Colors.white24,
          //       ),
            
          //       const SizedBox(height: 15),
            
          //       Text(
          //         "© 2026 Rey Han. All rights reserved.",
          //         style: GoogleFonts.poppins(
          //           fontSize: 12,
          //           color: Colors.white54,
          //         ),
          //       ),],
          //   ),
          // )
        ],
      ),
    );
  }
}
