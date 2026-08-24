import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';

Widget mobileBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;
  final bodyHeight = screenHeight - navbarHeight;

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 80 * scale;

  return Container(
    color: Colors.black,
    height: bodyHeight,
    child: Stack(
      children: [
        backgroundImage(),
        SizedBox(
          height: bodyHeight,
          width: mq.MediaQueryValues(context).width,
          child: SizedBox(
            width: width * 0.38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      fontSize: 20 * scale,
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
                SizedBox(height: mq.MediaQueryValues(context).height*0.01,),
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
                    ),
                  ),
                ),
                SizedBox(height: bodyHeight * 0.01),
                RepaintBoundary(
                  child: FadeInUp(
                      config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Text(
                        "// CLEAN CODE. SCALABLE SOLUTIONS.",
                        style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                          color: AppColor.white,
                          fontSize: 25 * scale,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: bodyHeight * 0.02),
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Text("Find Me On", style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontSize: 23 * scale, color: AppColor.yellowgreen)))),
                ),
                SizedBox(height: bodyHeight * 0.04),
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          icon("assets/icons/facebook.svg", context, scale),
                          SizedBox(width: width * 0.05),
                          icon("assets/icons/instagram.svg", context, scale),
                          SizedBox(width: width * 0.05),
                          icon("assets/icons/linkedin.svg", context, scale),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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