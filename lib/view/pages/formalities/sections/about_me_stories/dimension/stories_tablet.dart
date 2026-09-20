import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/formalities/widgets/image_position.dart';
import 'package:google_fonts/google_fonts.dart';

Widget storiesTabletBody(
  BuildContext context,
  double width, double height
){
  final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
  // const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 90 * scale;
  return Container(
    color: AppColor.primary,
    width: mq.MediaQueryValues(context).width,
    height: screenHeight,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: mq.MediaQueryValues(context).width * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'WHO AM I',
            style: GoogleFonts.poppins(
              fontSize: 20 * scale,
              fontWeight: FontWeight.w800,
              height: 0.95,
              letterSpacing: 5,
              color: AppColor.darkUI,
            ),
          ),
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.02,
          ),
      
          Container(
            height: 4,
            width: mq.MediaQueryValues(context).width * 0.07,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
      
          SizedBox(
            height: mq.MediaQueryValues(context).height * 0.02,
          ),
      
          Container(
            margin: EdgeInsets.only(
              left: mq.MediaQueryValues(context).width * 0.02,
            ),
            height: 4,
            width: mq.MediaQueryValues(context).width * 0.1,
            decoration: BoxDecoration(
              color: AppColor.grey1,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        
          Row(
            children: [
              Center(
                child: RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 700.ms,
                      child: const ThreeImages(
                        image1: 'assets/image/image_1.jpeg',
                        image2: 'assets/image/image_2.jpeg',
                        image3: 'assets/image/image_3.jpeg',
                      ),
                    ),
                  ),
                ),
              ),
              // RepaintBoundary(
              //   child: FadeInLeft(
              //     config: BaseAnimationConfig(
              //       delay: 500.ms,
              //       child: Image.asset("assets/image/profile2.png", height: mq.MediaQueryValues(context).height*0.6,),
              //     ),
              //   ),
              // ),
              SizedBox(width: mq.MediaQueryValues(context).width*0.03,),
              Expanded(
                child: RepaintBoundary(
                child: FadeInRight(
                  config: BaseAnimationConfig(
                    delay: 500.ms,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "HEY, I'M",
                                  style: AppFontStyle.vtBodyLarge.copyWith(
                                    fontSize: titleFontSize/2,
                                    color: AppColor.darkUI, 
                                    fontWeight: FontWeight.bold,
                                    height: 0.92,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nREYHAN",
                                  style: AppFontStyle.vtBodyLarge.copyWith(
                                    fontSize: titleFontSize,
                                    color: AppColor.darkUI, 
                                    fontWeight: FontWeight.bold,
                                    height: 0.92,
                                  ),
                                ),
                                
                              ]
                            )
                          ),
                          SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "I’m Reyhan Septri Asta, a mobile developer and product enthusiast who enjoys turning ideas into seamless digital experiences. I focus on building products that are not only functional, but intuitive, scalable, and enjoyable to use.",
                                      style: AppFontStyle.poppinsBodyMedium
                                          .copyWith(fontWeight: FontWeight.w300, color: AppColor.darkUI),
                                    ),
                                    SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                                    Text(
                                      "With a background in mobile development, I work across the product lifecycle—from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bridging the gap between design and engineering to create products that feel simple on the surface and thoughtful underneath.",
                                      style: AppFontStyle.poppinsBodyMedium
                                          .copyWith(fontWeight: FontWeight.w300, color: AppColor.darkUI),
                                    ),
                                    
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}