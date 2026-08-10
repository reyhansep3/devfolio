import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';

Widget skillsMobileBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;
  final bodyHeight = screenHeight - navbarHeight;

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 60 * scale;

  return Container(
    color: Colors.black,
    height: bodyHeight,
    child: Stack(
      children: [
        backgroundImage(),

        // Ganti SingleChildScrollView + Row → SizedBox + Row
        SizedBox(
          height: bodyHeight,
          width: context.width,
          child: SizedBox(
            width: width * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.yellowgreen),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: AppColor.yellowgreen,
                                borderRadius: BorderRadius.circular(100)
                              ),
                            ),
                            SizedBox(width: context.width*0.01,),
                            Text("Currently Working at CKL CARGO",
                              style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                                color: AppColor.white, 
                                fontSize: 20 * scale,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height*0.01,),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "REY",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        fontSize: titleFontSize,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        height: 0.92,
                      ),
                    ),
                    TextSpan(
                      text: "HAN",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        fontSize: titleFontSize,
                        color: AppColor.yellowgreen,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        height: 0.92,
                      ),
                    ),
                    TextSpan(
                      text: " SEPTRI",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        fontSize: titleFontSize,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        height: 0.92,
                      ),
                    ),
                    TextSpan(
                      text: " AS",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        fontSize: titleFontSize,
                        color: AppColor.yellowgreen,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        height: 0.92,
                      ),
                    ),
                    TextSpan(
                      text: "TA",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                        fontSize: titleFontSize,
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -2,
                        height: 0.92,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: bodyHeight * 0.01),
                Text(
                  "// CLEAN CODE. SCALABLE SOLUTIONS.",
                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                    color: AppColor.white,
                    fontSize: 20 * scale,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: bodyHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("03",
                            style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                              color: AppColor.yellowgreen,
                              fontSize: 28,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Years exp.",
                            style: AppFontStyle.poppinsBodyMedium.copyWith(
                              color: AppColor.white,
                              fontSize: 25 * scale,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("06",
                            style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                              color: AppColor.yellowgreen,
                              fontSize: 28,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Projects.",
                            style: AppFontStyle.poppinsBodyMedium.copyWith(
                              color: AppColor.white,
                              fontSize: 25 * scale,
                              letterSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: bodyHeight * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Find Me On", style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontSize: 25 * scale)),
                    SizedBox(width: width * 0.02),
                    icon("assets/icons/facebook.svg", context, scale),
                    SizedBox(width: width * 0.02),
                    icon("assets/icons/instagram.svg", context, scale),
                    SizedBox(width: width * 0.02),
                    icon("assets/icons/linkedin.svg", context, scale),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}