// import 'package:flutter/material.dart';
// import 'package:flutter_portofolio/item/app_colors.dart';
// import 'package:flutter_portofolio/item/app_fonts.dart';
// import 'package:flutter_portofolio/item/media_query.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';

// Widget desktopBody(
//   BuildContext context, double width, double height,
//   bool isHovered,void Function(bool) onHoverChanged,
// ) {
//   final screenHeight = MediaQuery.of(context).size.height;
//   const navbarHeight = 80.0; // masih belum fix

//   final scale = (width / 1024).clamp(0.5, 1.3);
//   // final titleFontSize = 10 * scale;

//   return Container(
//     color: AppColor.primaryColor,
//     height: screenHeight - navbarHeight,
//     child: Stack(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
                // Text("Hello! I'm",
                //   style: AppFontStyle.borelDisplay.copyWith(
                //     color: Colors.black, 
                //     fontSize: 20 * scale,
                //     letterSpacing: 0.5,
                //     height: 1.0,
                //     fontWeight: FontWeight.bold)
                //   ),
//                 Text("REYHAN",
//                   style: AppFontStyle.interBodyMedium.copyWith(
//                     color: Colors.black, 
//                     fontSize: 70 * scale,
//                     height: 1.0,
//                     fontWeight: FontWeight.bold,
//                   )
//                 ),
//                 Text("SEPTRI ASTA",
//                   style: AppFontStyle.interBodyMedium.copyWith(
//                     color: Colors.black, 
//                     fontSize: 70 * scale,
//                     height: 1.0,
//                     fontWeight: FontWeight.bold
//                   )
//                 ),
//                 SizedBox(height: context.height*0.03,),
//                 Text("// CLEAN CODE. SCALABLE SOLUTIONS.", //AVAILABLE FOR FULLTIME, PART-TIME, & FREELANCE
//                 style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
//                   color: Colors.black, 
//                   fontSize: 14 * scale,
//                   letterSpacing: 0.5,
//                   fontWeight: FontWeight.bold)
//                 ),
//                 SizedBox(height: context.height*0.03,),
//                 Text("Flutter developer who loves building\nintuitive mobile experience with clean\ncode and thoughtful design.",
//                   style: AppFontStyle.interBodyMedium.copyWith(
//                     color: Colors.black, 
//                     fontSize: 13 * scale,
//                     fontWeight: FontWeight.bold
//                   )
//                 ),
//                 SizedBox(height: context.height*0.02,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Find Me On",
//                       style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
//                       color: Colors.black, 
//                       fontSize: 12 * scale,
//                       letterSpacing: 0.5,
//                       fontWeight: FontWeight.bold)
//                     ),
                          
//                     SizedBox(width: context.width*0.02),
                          
//                     icon("assets/icons/facebook.svg", context, scale,),
//                     SizedBox(width: context.width*0.02),
//                     icon("assets/icons/instagram.svg", context, scale),
//                     SizedBox(width: context.width*0.02),
//                     icon("assets/icons/linkedin.svg", context, scale),
//                   ],
//                 ),
//               ],
//             ),
//             Image.asset("assets/image/photo.png")
//             // SizedBox(width: context.width*0.1,),
//             // const PhoneWidget(),
            
//           ],
//         ),
        // Positioned(
        //   right: 40,
        //   bottom: 40,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       const RotatedBox(
        //         quarterTurns: 1,
        //         child: Text(
        //           "SCROLL",
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w600,
        //             letterSpacing: 2,
        //           ),
        //         ),
        //       ),
          
        //       const SizedBox(height: 18),
          
        //       Container(
        //         width: 2,
        //         height: 120,
        //         color: Colors.black54,
        //       ),
        //     ],
        //   ),
        // )
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;

Widget desktopBody(
  BuildContext context, double width, double height,
  bool isHovered,void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 80 * scale;

  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Stack(
      children: [
        backgroundImage(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RepaintBoundary(
                      child: FadeInDown(
                        config: BaseAnimationConfig(
                          delay: 500.ms,
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
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(100)
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                  Text("CURRENTLY WORKING AT CKL CARGO",
                                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                                    color: AppColor.white, 
                                    fontSize: 8 * scale,
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
                    SizedBox(height: mq.MediaQueryValues(context).height*0.01,),
                    RepaintBoundary(
                      child: FadeInUp(
                        config: BaseAnimationConfig(
                          delay: 500.ms,
                          child: RichText(
                            text: TextSpan(
                              children: [
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
                              ]
                            )
                          ),
                        )
                      ),
                    ),
                    SizedBox(height: mq.MediaQueryValues(context).height*0.02,),
                    RepaintBoundary(
                      child: FadeInUp(
                        config: BaseAnimationConfig(
                          delay: 500.ms,
                          child: Row(
                            children: [
                              Text("// CLEAN CODE.",
                              style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                                color: AppColor.white, 
                                fontSize: 14 * scale,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)
                              ),
                              Text(" SCALABLE SOLUTIONS.",
                              style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                                color: AppColor.yellowgreen, 
                                fontSize: 14 * scale,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.bold)
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mq.MediaQueryValues(context).height*0.04,),
                RepaintBoundary(
                  child: FadeInUp(
                      config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Row(
                        children: [
                          Text("Find Me On",
                            style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
                            color: AppColor.yellowgreen, 
                            fontSize: 15 * scale,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.bold)
                          ),
                          SizedBox(width: mq.MediaQueryValues(context).width*0.02),
                                
                          icon("assets/icons/facebook.svg", context, scale),
                          SizedBox(width: mq.MediaQueryValues(context).width*0.03),
                          icon("assets/icons/instagram.svg", context, scale),
                          SizedBox(width: mq.MediaQueryValues(context).width*0.03),
                          icon("assets/icons/linkedin.svg", context, scale),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: mq.MediaQueryValues(context).width*0.08,),
            RepaintBoundary(
              child: FadeInUp(
                config: BaseAnimationConfig(
                delay: 700.ms,
                child: const PhoneWidget()
              )),
            ),
          ],
        ),
        Positioned(
          right: 40,
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

// import 'package:flutter/material.dart';
// import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
// import 'package:flutter_portofolio/item/app_colors.dart';
// import 'package:flutter_portofolio/item/app_fonts.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/background_gradient.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/icon_widget.dart';
// import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
// import 'package:flutter_portofolio/item/media_query.dart' as mq;

// Widget desktopBody(
//   BuildContext context, double width, double height,
//   bool isHovered, void Function(bool) onHoverChanged,
// ) {
//   final screenHeight = MediaQuery.of(context).size.height;
//   const navbarHeight = 80.0;
//   final screenWidth = MediaQuery.of(context).size.width;

//   final scale = (width / 1024).clamp(0.5, 1.3);

//   final horizontalPadding = (screenWidth * 0.12).clamp(20.0, 200.0);

//   return Container(
//     color: Colors.white,
//     width: double.infinity,
//     height: screenHeight - navbarHeight,
//     child: Stack(
//       children: [
//         backgroundImage(),
//         Positioned(
//           right: 40,
//           bottom: 40,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const RotatedBox(
//                 quarterTurns: 1,
//                 child: Text(
//                   "SCROLL",
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: AppColor.white,
//                     letterSpacing: 2,
//                   ),
//                 ),
//               ),
          
//               const SizedBox(height: 18),
          
//               Container(
//                 width: 2,
//                 height: 120,
//                 color: AppColor.white,
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
//           child: LayoutBuilder(
//             builder: (context, constraints) {
//               final availableWidth = constraints.maxWidth;
//               final photoWidth = availableWidth * 0.35; 

//               return Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: SizedBox(
//                       width: (availableWidth - photoWidth) / 2 + photoWidth * 0.25,
//                       child: FittedBox(
//                         fit: BoxFit.scaleDown,
//                         alignment: Alignment.centerRight,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
                            // RepaintBoundary(
                            //   child: FadeInDown(
                            //     config: BaseAnimationConfig(
                            //       delay: 500.ms,
                            //       child: Container(
                            //       decoration: BoxDecoration(
                            //         border: Border.all(color: AppColor.yellowgreen),
                            //         borderRadius: BorderRadius.circular(100)
                            //       ),
                            //       child: Padding(
                            //         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                            //           child: Row(
                            //             children: [
                            //               Container(
                            //                 padding: const EdgeInsets.all(5),
                            //                 decoration: BoxDecoration(
                            //                   color: AppColor.white,
                            //                   borderRadius: BorderRadius.circular(100)
                            //                 ),
                            //               ),
                            //               SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                            //               Text("CURRENTLY WORKING AT CKL CARGO",
                            //               style: AppFontStyle.poppinsBodyLarge.copyWith(
                            //                 color: AppColor.white, 
                            //                 fontSize: 10 * scale,
                            //                 letterSpacing: 0.5,
                            //                 fontWeight: FontWeight.bold)
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
//                             SizedBox(height: height*0.02,),
//                             RepaintBoundary(
//                               child: FadeInLeft(
//                                 config: BaseAnimationConfig(
//                                   delay: 500.ms,
//                                   child: Text(
//                                     "MOBILE",
//                                     style: AppFontStyle.antonMedium.copyWith(
//                                       fontSize: 150,
//                                       color: AppColor.yellowgreen,
//                                       height: 1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: height*0.02,),
//                             RepaintBoundary(
//                               child: FadeInRight(
//                                 config: BaseAnimationConfig(
//                                   delay: 500.ms,
//                                   child: SizedBox(
//                                     width: width*0.16,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Container(
//                                           width: 4,
//                                           height: height*0.08,
//                                           color: AppColor.yellowgreen,
//                                         ),
//                                         SizedBox(width: width*0.01,),
//                                         Expanded(
//                                           child: Text(
//                                             "I build cross-platform mobile appliaction with Flutter. Focused on Clean Archtecture, smooth UX, and scalable solution",
//                                             style: AppFontStyle.poppinsBodyMedium.copyWith(
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       "assets/image/photo.png",
//                       width: photoWidth * 2,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: SizedBox(
//                       width: (availableWidth - photoWidth) / 2 + photoWidth * 0.15,
//                       child: FittedBox(
//                         fit: BoxFit.scaleDown,
//                         alignment: Alignment.centerLeft,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             RepaintBoundary(
//                               child: FadeInRight(
//                                 config: BaseAnimationConfig(
//                                   delay: 500.ms,
//                                   child: Text(
//                                     "WEB",
//                                     style: AppFontStyle.antonMedium.copyWith(
//                                       fontSize: 150,
//                                       color: AppColor.yellowgreen,
//                                       height: 1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             RepaintBoundary(
//                               child: FadeInRight(
//                                 config: BaseAnimationConfig(
//                                   delay: 600.ms,
//                                   child: Text(
//                                     "DEVELOPER",
//                                     style: AppFontStyle.antonMedium.copyWith(
//                                       fontSize: 120,
//                                       height: 1,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: height*0.03,),
//                             RepaintBoundary(
//                               child: FadeInUp(
//                                 config: BaseAnimationConfig(
//                                   delay: 500.ms,
//                                   child: Row(
//                                     children: [
//                                       SizedBox(
//                                         width: width*0.05,
//                                       ),
//                                       Container(
//                                         padding: const EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                           color: AppColor.white,
//                                           borderRadius: BorderRadius.circular(100)
//                                         ),
//                                       ),
//                                       SizedBox(width: MediaQuery.of(context).size.width*0.005,),
//                                       Text(
//                                         "AVAILABLE FOR NEW OPPORTUNITIES",
//                                         style: AppFontStyle.poppinsBodyMedium.copyWith(
//                                           height: 1,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),

//                   Positioned(
//                     top: 30,
//                     child: RepaintBoundary(
//                       child: FadeInUp(
//                         config: BaseAnimationConfig(
//                           delay: 500.ms,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
                              
//                               Text(
//                                 "REYHAN SEPTRI ASTA",
//                                 style: AppFontStyle.antonMedium.copyWith(
//                                   color: AppColor.yellowgreen,
//                                   letterSpacing: 0.5,
//                                   fontSize: 40,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 30,
//                     child: RepaintBoundary(
//                       child: FadeInUp(
//                         config: BaseAnimationConfig(
//                           delay: 500.ms,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               icon("assets/icons/facebook.svg", context, scale),
//                               SizedBox(width: width * 0.05),
//                               icon("assets/icons/instagram.svg", context, scale),
//                               SizedBox(width: width * 0.05),
//                               icon("assets/icons/linkedin.svg", context, scale),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
// }