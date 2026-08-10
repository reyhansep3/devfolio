import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

Widget aboutMeMobileBody(BuildContext context, double width, double height) {
  final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
  const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 60 * scale;
  return SingleChildScrollView(
    child: Container(
      color: Colors.black,
      width: mq.MediaQueryValues(context).width,
      height: screenHeight - navbarHeight,
      child: Stack(
        children: [
          Image.asset(
            "assets/image/bg_project.png",
            opacity: const AlwaysStoppedAnimation(0.7), 
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.MediaQueryValues(context).width * 0.1,
            vertical: mq.MediaQueryValues(context).height * 0.05),
            child: Row(
              children: [
                RepaintBoundary(
                  child: FadeInLeft(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Image.asset("assets/image/photo.png", height: mq.MediaQueryValues(context).height*0.6,),
                    ),
                  ),
                ),
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
                                    text: "AB",
                                    style: AppFontStyle.vtBodyLarge.copyWith(
                                      fontSize: titleFontSize,
                                      color: Colors.white, 
                                      fontWeight: FontWeight.bold,
                                      height: 0.92,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "OUT",
                                    style: AppFontStyle.vtBodyLarge.copyWith(
                                      fontSize: titleFontSize,
                                      color: AppColor.yellowgreen, 
                                      fontWeight: FontWeight.bold,
                                      height: 0.92,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " ME",
                                    style: AppFontStyle.vtBodyLarge.copyWith(
                                      fontSize: titleFontSize,
                                      color: Colors.white, 
                                      fontWeight: FontWeight.bold,
                                      height: 0.92,
                                      wordSpacing: -6,
                                    ),
                                  ),
                                ]
                              )
                            ),
                            SizedBox(height: mq.MediaQueryValues(context).height*0.03,),
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
                                            .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
                                      ),
                                      SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                                      Text(
                                        "With a background in mobile development, I work across the product lifecycle—from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bridging the gap between design and engineering to create products that feel simple on the surface and thoughtful underneath.",
                                        style: AppFontStyle.poppinsBodyMedium
                                            .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Expanded(
                            //       flex: 5,
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             "I’m Reyhan Septri Asta, a mobile developer and product enthusiast who enjoys turning ideas into seamless digital experiences. I focus on building products that are not only functional, but intuitive, scalable, and enjoyable to use.",
                            //             style: AppFontStyle.poppinsBodyMedium
                            //                 .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
                            //           ),
                            //           SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                            //           Text(
                            //             "With a background in mobile development, I work across the product lifecycle—from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bridging the gap between design and engineering to create products that feel simple on the surface and thoughtful underneath.",
                            //             style: AppFontStyle.poppinsBodyMedium
                            //                 .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
                            //           ),
                            //           SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
                            //           Row(
                            //             crossAxisAlignment: CrossAxisAlignment.start,
                            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               Container(
                            //                 decoration: const BoxDecoration(
                            //                   color: AppColor.yellowgreen,
                            //                 ),
                            //                 width: mq.MediaQueryValues(context).width*0.18,
                            //                 child: Column(
                            //                   children: [
                            //                     SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
                            //                     Container(
                            //                       height: 0.5,
                            //                       decoration: const BoxDecoration(
                            //                         color: AppColor.grey1
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.all(mq.MediaQueryValues(context).width*0.01),
                            //                       child: Center(
                            //                         child: Text(
                            //                           "outside of work, I recharge through gaming, reading, and exploring new places. I find that stepping outside my routine fuels my curiosity and gives me fresh perspectives often inspiring ideas that transform everyday problems into meaningful products.",
                            //                           style: AppFontStyle.poppinsBodySmall
                            //                             .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //               Container(
                            //                 decoration: const BoxDecoration(
                            //                   color: AppColor.yellowgreen,
                            //                 ),
                            //                 width: mq.MediaQueryValues(context).width*0.18,
                            //                 child: Column(
                            //                   children: [
                            //                     SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
                            //                     Container(
                            //                       height: 0.5,
                            //                       decoration: const BoxDecoration(
                            //                         color: AppColor.grey1
                            //                       ),
                            //                     ),
                            //                     Padding(
                            //                       padding: EdgeInsets.all(mq.MediaQueryValues(context).width*0.01),
                            //                       child: Center(
                            //                         child: Text(
                            //                           "I find that stepping outside my routine fuels my curiosity and gives me fresh perspectives often inspiring ideas that transform everyday problems into meaningful products.",
                            //                           style: AppFontStyle.poppinsBodySmall
                            //                             .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                            //                         ),
                            //                       ),
                            //                     ),
                            //                   ],
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}