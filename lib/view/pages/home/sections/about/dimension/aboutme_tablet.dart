import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/home/sections/about/widgets/glass_card.dart';

Widget tabletBody({
  required double widthBody,
  required double heightBody,
  required BuildContext context
}) {
  return Container(
    width: mq.MediaQueryValues(context).width,
    decoration: const BoxDecoration(
      color: Colors.black,
    ),
    child: Stack(
      children: [
        Positioned(
          left: 40,
          top: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "BLOG",
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
        ),
        Padding(
          padding: EdgeInsets.only(
              left: mq.MediaQueryValues(context).width*0.15,
              right: mq.MediaQueryValues(context).width*0.15,
              bottom: heightBody,
              top: mq.MediaQueryValues(context).height*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: Text(
                    "Keep learning...",
                    style: AppFontStyle.poppinsHeadingMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.03,),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Keep",
                          style: AppFontStyle.borelBodyLarge.copyWith(
                            fontSize: 60,
                            color: AppColor.white, 
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: " Building",
                          style: AppFontStyle.borelBodyLarge.copyWith(
                            fontSize: 60,
                            color: AppColor.yellowgreen, 
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                      ]
                    )
                  ),
                ),
              ),
              // Text(
              //   "KEEP BUILDING",
              //   style: AppFontStyle.largeTextMono.copyWith(fontWeight: FontWeight.bold, color: AppColor.white, fontSize: 50),
              //   textAlign: TextAlign.start,
              // ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.01,),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: Text(
                    "Principles I rely on to turn complex problems into simple, scalable\nsolutions.",
                    style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.07,),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: Center(
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GlassCard(
                              width: mq.MediaQueryValues(context).width,
                              category: "FLUTTER",
                              title: "Flexbox",
                              description:
                                  "Breaking layout behavior into a model that feels predictable.",
                            ),
                          ),
                          SizedBox(height: mq.MediaQueryValues(context).height*0.03),
                          Expanded(
                            child: GlassCard(
                              width: mq.MediaQueryValues(context).width,
                              category: "ENGINEERING",
                              title: "Fetching",
                              description:
                                  "A simpler way to think about data flow and rendering tradeoffs.",
                            ),
                          ),
                          SizedBox(height: mq.MediaQueryValues(context).height*0.03),
                          Expanded(
                            child: GlassCard(
                              width: mq.MediaQueryValues(context).width,
                              category: "PERFORMANCE",
                              title: "Building Smaller App",
                              description:
                                  "Techniques i use to reduce app size without sacrificing functionality.",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
        
            ],
          )
        ),
      ],
    ),
  );
}