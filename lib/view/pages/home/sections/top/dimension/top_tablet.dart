import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';

Widget tabletBody(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ── Kolom teks ──
              SizedBox(
                width: width * 0.38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "// FLUTTER MOBILE DEVELOPER",
                      style: AppFontStyle.mediumTextMono.copyWith(
                        color: AppColor.grey1,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: bodyHeight * 0.01),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "REY",
                          style: AppFontStyle.largeTextMono.copyWith(
                            fontSize: titleFontSize,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: "HAN",
                          style: AppFontStyle.largeTextMono.copyWith(
                            fontSize: titleFontSize,
                            color: AppColor.yellowgreen,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: "\nSEPTRI",
                          style: AppFontStyle.largeTextMono.copyWith(
                            fontSize: titleFontSize,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: "\nAS",
                          style: AppFontStyle.largeTextMono.copyWith(
                            fontSize: titleFontSize,
                            color: AppColor.yellowgreen,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: "TA",
                          style: AppFontStyle.largeTextMono.copyWith(
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
                      style: AppFontStyle.mediumTextMono.copyWith(
                        color: AppColor.grey1,
                        letterSpacing: 0.5,
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
                                style: AppFontStyle.largeTextMono.copyWith(
                                  color: AppColor.yellowgreen,
                                  fontSize: 28,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Years exp.",
                                style: AppFontStyle.mediumText.copyWith(
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
                                style: AppFontStyle.largeTextMono.copyWith(
                                  color: AppColor.yellowgreen,
                                  fontSize: 28,
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Projects.",
                                style: AppFontStyle.mediumText.copyWith(
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
                        Text("Find Me On", style: AppFontStyle.smallText),
                        SizedBox(width: width * 0.02),
                        icon("assets/icons/facebook.svg", context),
                        SizedBox(width: width * 0.02),
                        icon("assets/icons/instagram.svg", context),
                        SizedBox(width: width * 0.02),
                        icon("assets/icons/linkedin.svg", context),
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