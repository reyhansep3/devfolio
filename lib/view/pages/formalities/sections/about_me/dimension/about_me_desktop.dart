import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';

Widget aboutMeDesktopBody(BuildContext context, double width, double height) {
  // final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
  // const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 90 * scale;
  return Container(
    color: Colors.black,
    width: mq.MediaQueryValues(context).width,
    // height: screenHeight - navbarHeight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: mq.MediaQueryValues(context).height * 0.4,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    "assets/image/blog_background.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha:0.05),
                                Colors.white.withValues(alpha:0.02),
                              ],
                            ),
                            border: Border.all(
                              color: Colors.white.withValues(alpha:0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha:0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
                                Icon(Icons.arrow_forward_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
                              
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width : mq.MediaQueryValues(context).width*0.005),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "ABOUT",
                                style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                              ),
                              TextSpan(
                                text: " ME",
                                style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                              )
                            ]
                          )
                        ),
                      ],
                    ),
                    SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                    Text(
                      "Mobile Developer with 3 years of experience developing scalable, high-performance applications,\ncollaborating with teams, and creating seamless user experiences.",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                      textAlign: TextAlign.center,
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: mq.MediaQueryValues(context).height*0.04,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.MediaQueryValues(context).width * 0.15),
          child: Row(
            children: [
              RepaintBoundary(
                child: FadeInLeft(
                  config: BaseAnimationConfig(
                    delay: 500.ms,
                    child: Image.asset("assets/image/profile2.png", height: mq.MediaQueryValues(context).height*0.6,),
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
                                  text: "HEY, I'M",
                                  style: AppFontStyle.vtBodyLarge.copyWith(
                                    fontSize: titleFontSize/2,
                                    color: Colors.white, 
                                    fontWeight: FontWeight.bold,
                                    height: 0.92,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nREYHAN",
                                  style: AppFontStyle.vtBodyLarge.copyWith(
                                    fontSize: titleFontSize,
                                    color: AppColor.yellowgreen, 
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
  );
}

// Widget aboutMeDesktopBody(BuildContext context, double width, double height) {
//   final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
//   const navbarHeight = 80.0; // masih belum fix

//   final scale = (width / 1024).clamp(0.5, 1.3);
//   final titleFontSize = 90 * scale;
//   return SingleChildScrollView(
//     child: Container(
//       color: Colors.black,
//       width: mq.MediaQueryValues(context).width,
//       height: screenHeight - navbarHeight,
//       child: Stack(
//         children: [
//           Positioned.fill(
//             child: Image.asset(
//               "assets/image/bg_project.png",
//               opacity: const AlwaysStoppedAnimation(0.5 ),
//               fit: BoxFit.fill,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: mq.MediaQueryValues(context).width * 0.1,
//             vertical: mq.MediaQueryValues(context).height * 0.05),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 RepaintBoundary(
//                   child: FadeInUp(
//                     config: BaseAnimationConfig(
//                       delay: 500.ms,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               gradient: LinearGradient(
//                                 colors: [
//                                   Colors.white.withValues(alpha:0.05),
//                                   Colors.white.withValues(alpha:0.02),
//                                 ],
//                               ),
//                               border: Border.all(
//                                 color: Colors.white.withValues(alpha:0.1),
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withValues(alpha:0.2),
//                                   blurRadius: 15,
//                                   offset: const Offset(0, 10),
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Row(
//                                 children: [
//                                   Icon(Icons.arrow_back_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
//                                   Icon(Icons.arrow_forward_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
                                
//                                 ],
//                               ),
//                             ),
//                           ),
//                           SizedBox(width : mq.MediaQueryValues(context).width*0.005),
//                           RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: "ABOUT",
//                                   style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
//                                 ),
//                                 TextSpan(
//                                   text: " ME",
//                                   style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
//                                 )
//                               ]
//                             )
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
//                 RepaintBoundary(
//                   child: FadeInUp(
//                     config: BaseAnimationConfig(
//                       delay: 500.ms,
//                       child: Center(
//                         child: Text(
//                           "Mobile Developer with 3 years of experience developing scalable, high-performance applications,\ncollaborating with teams, and creating seamless user experiences.",
//                           style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
//                 Row(
//                   children: [
//                     RepaintBoundary(
//                       child: FadeInLeft(
//                         config: BaseAnimationConfig(
//                           delay: 500.ms,
//                           child: Image.asset("assets/image/photo.png", height: mq.MediaQueryValues(context).height*0.6,),
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: mq.MediaQueryValues(context).width*0.03,),
//                     Expanded(
//                       child: RepaintBoundary(
//                       child: FadeInRight(
//                         config: BaseAnimationConfig(
//                           delay: 500.ms,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [ 
//                                 RichText(
//                                   text: TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: "HEY, I'M",
//                                         style: AppFontStyle.vtBodyLarge.copyWith(
//                                           fontSize: titleFontSize/2,
//                                           color: Colors.white, 
//                                           fontWeight: FontWeight.bold,
//                                           height: 0.92,
//                                         ),
//                                       ),
//                                       TextSpan(
//                                         text: "\nREYHAN",
//                                         style: AppFontStyle.vtBodyLarge.copyWith(
//                                           fontSize: titleFontSize,
//                                           color: AppColor.yellowgreen, 
//                                           fontWeight: FontWeight.bold,
//                                           height: 0.92,
//                                         ),
//                                       ),
                                      
//                                     ]
//                                   )
//                                 ),
//                                 SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Expanded(
//                                       flex: 5,
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             "I’m Reyhan Septri Asta, a mobile developer and product enthusiast who enjoys turning ideas into seamless digital experiences. I focus on building products that are not only functional, but intuitive, scalable, and enjoyable to use.",
//                                             style: AppFontStyle.poppinsBodyMedium
//                                                 .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
//                                           ),
//                                           SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
//                                           Text(
//                                             "With a background in mobile development, I work across the product lifecycle—from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bridging the gap between design and engineering to create products that feel simple on the surface and thoughtful underneath.",
//                                             style: AppFontStyle.poppinsBodyMedium
//                                                 .copyWith(fontWeight: FontWeight.w300, color: const Color(0xFFDEDEDE)),
//                                           ),
                                          
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }