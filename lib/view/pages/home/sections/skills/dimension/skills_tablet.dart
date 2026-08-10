import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';

Widget skillsTabletBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;
  final bodyHeight = screenHeight - navbarHeight;

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 70 * scale;

  return Container(
    color: Colors.white,
    height: bodyHeight,
    child: Stack(
      children: [
        backgroundImage(),

        SizedBox(
          height: bodyHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch, 
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
                                  fontSize: 12 * scale,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold)
                                ),
                            ],
                          ),
                        ),
                                        ),
                      ],
                    ),
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
                          text: "\nSEPTRI",
                          style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                            fontSize: titleFontSize,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: "\nAS",
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
                        letterSpacing: 0.5,
                        fontSize: 15 * scale,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: bodyHeight * 0.03),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  color: AppColor.grey1,
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
                                  color: AppColor.grey1,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: bodyHeight * 0.02),
                    Row(
                      children: [
                        Text("Find Me On", style: AppFontStyle.poppinsBodySmall),
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

              SizedBox(width: width * 0.04),
              const PhoneWidget(),
            ],
          ),
        ),
      ],
    ),
  );
}