import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/skill_tree.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/trophy_part.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';

Widget skillsDesktopBody(
  BuildContext context, double width, double height,
  bool isHovered,void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  // final titleFontSize = 80 * scale;

  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Stack(
      children: [
        backgroundImage(),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                skillsMainTree(context),
                SizedBox(width: context.width*0.02,),
                trophyWidget(context)
              ],
            ),
            SizedBox(height: context.height*0.01,),
            Text("// CLEAN CODE. SCALABLE SOLUTIONS.",
            style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
              color: AppColor.white, 
              fontSize: 14 * scale,
              letterSpacing: 0.5,
              fontWeight: FontWeight.bold)
            ),
            SizedBox(height: context.height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("03",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        color: AppColor.yellowgreen, 
                        fontSize: 28, 
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)
                    ),
                    Text("Years exp.",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(
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
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        color: AppColor.yellowgreen,
                        fontSize: 28, 
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)
                    ),
                    Text("Projects.",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(
                        color: AppColor.grey1, 
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold)
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: context.height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Find Me On",
                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                  color: AppColor.white, 
                  fontSize: 12 * scale,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold)
                ),
                      
                SizedBox(width: context.width*0.02),
                      
                icon("assets/icons/facebook.svg", context, scale),
                SizedBox(width: context.width*0.03),
                icon("assets/icons/instagram.svg", context, scale),
                SizedBox(width: context.width*0.03),
                icon("assets/icons/linkedin.svg", context, scale),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}