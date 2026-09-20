import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/home/sections/blog/widgets/glass_card.dart';
import 'package:go_router/go_router.dart';

Widget mobileBody({
  required double widthBody,
  required double heightBody,
  required BuildContext context
}) {
  return Container(
    width: mq.MediaQueryValues(context).width,
    decoration: const BoxDecoration(
      color: AppColor.primary,
    ),
    child: Padding(
      padding: EdgeInsets.only(
          left: mq.MediaQueryValues(context).width*0.15,
          right: mq.MediaQueryValues(context).width*0.15,
          bottom: mq.MediaQueryValues(context).height*0.04
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: Text(
                    "Keep learning...",
                    style: AppFontStyle.poppinsHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.darkUI),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Keep",
                          style: AppFontStyle.poppins.copyWith(
                            fontSize: 40,
                            color: AppColor.darkUI, 
                            fontWeight: FontWeight.bold,
                            letterSpacing: -2,
                            height: 0.92,
                          ),
                        ),
                        TextSpan(
                          text: " Building",
                          style: AppFontStyle.poppins.copyWith(
                            fontSize: 40,
                            color: AppColor.darkUI, 
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
              SizedBox(height: mq.MediaQueryValues(context).height*0.01,),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: Text(
                    "Principles I rely on to turn complex problems into simple, scalable\nsolutions.",
                    style: AppFontStyle.poppins.copyWith(
                      fontWeight: FontWeight.w500, 
                      color: AppColor.darkUI
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
              Container(
                height: 4,
                width: mq.MediaQueryValues(context).width * 0.4,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              SizedBox(
                height: mq.MediaQueryValues(context).height * 0.02,
              ),

              // Line 2
              Container(
                margin: EdgeInsets.only(
                  right: mq.MediaQueryValues(context).width * 0.02,
                ),
                height: 4,
                width: mq.MediaQueryValues(context).width * 0.2,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              SizedBox(
                height: mq.MediaQueryValues(context).height * 0.04,
              ),
              FadeInUp(
              config: BaseAnimationConfig(
                delay: 1000.ms,
                  child: GlassCard(
                    width: mq.MediaQueryValues(context).width,
                    category: "FLUTTER",
                    title: "Flexbox",
                    description:
                        "Breaking layout behavior into a model that feels predictable.",
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.03),
              FadeInUp(
              config: BaseAnimationConfig(
                delay: 1000.ms,
                  child: GlassCard(
                    width: mq.MediaQueryValues(context).width,
                    category: "ENGINEERING",
                    title: "Fetching",
                    description:
                        "A simpler way to think about data flow and rendering tradeoffs.",
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.03),
              FadeInUp(
                config: BaseAnimationConfig(
                  delay: 1000.ms,
                  child: GlassCard(
                    width: mq.MediaQueryValues(context).width,
                    category: "PERFORMANCE",
                    title: "Building Smaller App",
                    description:
                        "Techniques i use to reduce app size without sacrificing functionality.",
                  ),
                ),
              ),

              SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
              Container(
                height: 4,
                width: mq.MediaQueryValues(context).width*0.07,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.01,),
              Container(
                margin: EdgeInsets.only(left: mq.MediaQueryValues(context).width*0.02),
                height: 4,
                width: mq.MediaQueryValues(context).width*0.15,
                decoration: BoxDecoration(
                  color: AppColor.grey1,
                  borderRadius: BorderRadius.circular(100)
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
              GestureDetector(
                onTap: (){
                  GoRouter.of(context).go('/formalities');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.darkUI,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      "Learn More",
                      style: AppFontStyle.poppins.copyWith(
                        color: AppColor.pureWhite
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
    
        ],
      )
    ),
  );
}