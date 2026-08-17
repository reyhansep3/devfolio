import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
 
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
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Reyhan Septri Asta",
                        style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white)
                      ),
                  
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Crafting intuitive mobile experiences through clean architecture and thoughtful design",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
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
                ),
                
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "General",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.white)
                      ),
                  
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Home",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Service",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Project",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Testimony",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Blog",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                    ],
                  ),
                ),
                      
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Resources",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.white)
                      ),
                  
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Resources 1",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      SizedBox(height: context.height*0.02),
                      Text(
                        "Resources 2",
                        style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.grey1)
                      ),
                      
                    ],
                  ),
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
