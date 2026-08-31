import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;

Widget tabletBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;
  final bodyHeight = screenHeight - navbarHeight;

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 70 * scale;

  return Container(
    color: Colors.black,
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
                        RepaintBoundary(
                          child: FadeInUp(
                            config: BaseAnimationConfig(
                              delay: 300.ms,
                              child: Container(
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
                                    SizedBox(width: mq.MediaQueryValues(context).width*0.01,),
                                    Text("CURRENTLY WORKING AT CKL CARGO",
                                      style: AppFontStyle.poppinsBodyLarge.copyWith(
                                        color: AppColor.white, 
                                        fontSize: 10 * scale,
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.bold)
                                      ),
                                  ],
                                ),
                              ),
                                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                    RepaintBoundary(
                      child: FadeInUp(
                          config: BaseAnimationConfig(
                          delay: 500.ms,
                          child: RichText(
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
                        ),
                      ),
                    ),
                    SizedBox(height: bodyHeight * 0.03),
                    RepaintBoundary(
                      child: FadeInUp(
                        config: BaseAnimationConfig(
                          delay: 500.ms,
                          child: Text(
                            "// CLEAN CODE. SCALABLE SOLUTIONS.",
                            style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                              color: AppColor.white,
                              letterSpacing: 0.5,
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: bodyHeight * 0.04),
                    RepaintBoundary(
                      child: FadeInUp(
                      config: BaseAnimationConfig(
                        delay: 500.ms,
                          child: Row(
                            children: [
                              Text("Find Me On", style: AppFontStyle.poppinsBodySmall.copyWith(
                                color: AppColor.yellowgreen, 
                                fontSize: 18 * scale,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold
                              )),
                              SizedBox(width: width * 0.02),
                              icon("assets/icons/facebook.svg", context, scale),
                              SizedBox(width: width * 0.02),
                              icon("assets/icons/instagram.svg", context, scale),
                              SizedBox(width: width * 0.02),
                              icon("assets/icons/linkedin.svg", context, scale),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: width * 0.04),
              RepaintBoundary(
                child: FadeInUp(
                config: BaseAnimationConfig(
                  delay: 700.ms,
                    child: const PhoneWidget(
                      height: 470,
                      width: 240,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 40,
          bottom: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "SCROLL",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                    letterSpacing: 2,
                  ),
                ),
              ),
          
              const SizedBox(height: 18),
          
              Container(
                width: 2,
                height: 120,
                color: AppColor.white,
              ),
            ],
          ),
        )
      ],
    ),
  );
}