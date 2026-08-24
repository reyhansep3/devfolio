import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/blog/dimension_dashboard/blog_dashboard_desktop.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/widgets/glass_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget desktopBody({
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
            bottom: mq.MediaQueryValues(context).height*0.1,
            top: mq.MediaQueryValues(context).height*0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Text(
                      "Keep learning...",
                      style: AppFontStyle.poppinsHeadingMedium.copyWith(
                        fontWeight: FontWeight.bold, 
                        color: AppColor.white,
                        height: 0.01,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.03,),
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: mq.MediaQueryValues(context).width*0.07,
                          height: mq.MediaQueryValues(context).height*0.005,
                          decoration: const BoxDecoration(
                            color: AppColor.yellowgreen
                          ),
                        ),
                        SizedBox(width: mq.MediaQueryValues(context).width*0.03,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Keep",
                                style: AppFontStyle.vtBodyLarge.copyWith(
                                  fontSize: 70,
                                  color: AppColor.white, 
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -2,
                                  height: 0.92,
                                ),
                              ),
                              TextSpan(
                                text: " Building!",
                                style: AppFontStyle.vtBodyLarge.copyWith(
                                  fontSize: 70,
                                  color: AppColor.yellowgreen, 
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -2,
                                  height: 0.92,
                                ),
                              ),
                            ]
                          )
                        ),
                        SizedBox(width: mq.MediaQueryValues(context).width*0.03,),
                    
                        Container(
                          width: mq.MediaQueryValues(context).width*0.07,
                          height: mq.MediaQueryValues(context).height*0.005,
                          decoration: const BoxDecoration(
                            color: AppColor.yellowgreen
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Text(
                      "Principles I rely on to turn complex problems\ninto simple, scalablesolutions.",
                      style: AppFontStyle.poppinsBodyLarge.copyWith(color: AppColor.grey2),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.07,),
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Center(
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (BuildContext context){
                                    return const BlogDashboardDesktop();
                                  }));
                                },
                                child: GlassCard(
                                  width: mq.MediaQueryValues(context).width,
                                  category: "FLUTTER",
                                  title: "Responsive",
                                  description:
                                      "Breaking layout behavior into a model that feels predictable.",
                                ),
                              ),
                            ),
                            SizedBox(width: mq.MediaQueryValues(context).width*0.02),
                            Expanded(
                              child: GlassCard(
                                width: mq.MediaQueryValues(context).width,
                                category: "ENGINEERING",
                                title: "Fetching",
                                description:
                                    "A simpler way to think about data flow and rendering tradeoffs.",
                              ),
                            ),
                            SizedBox(width: mq.MediaQueryValues(context).width*0.02),
                            Expanded(
                              child: GlassCard(
                                category: "PERFORMANCE",
                                width: mq.MediaQueryValues(context).width,
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
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.04,),
              SvgPicture.asset(
                "assets/icons/book.svg",
                width: MediaQuery.of(context).size.width*0.015,
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.01),
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Text("CURIOUS ABOUT HOW I THINK AND BUILD?",
                    style: AppFontStyle.poppinsBodySmall.copyWith(
                      color: AppColor.white, 
                      fontSize: 14 ,
                      letterSpacing: 0.5)
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height*0.02),
              IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.yellowgreen),
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColor.yellowgreen,
                              borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                          Text("VIEW ALL ARTICLES",
                          style: AppFontStyle.poppinsBodySmall.copyWith(
                            color: AppColor.white, 
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold)
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                          const Icon(
                            Icons.arrow_forward_outlined,
                            color: AppColor.yellowgreen,
                          )
                        ],
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