import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:flutter_portofolio/view/pages/home/widgets/project_item.dart';

Widget projectDesktopBody({
  required List banku,
  required List forumd,
  required List dido,
  required List cklink,
  required List history,
  required List delta,
  required double widthBody,
  required double heightBody,
  required double imageHeight,
  required double imageWidth,
  required BuildContext context
}) {
  return SingleChildScrollView(
    child: Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: EdgeInsets.only(
          left: mq.MediaQueryValues(context).width*0.15,
          right: mq.MediaQueryValues(context).width*0.15,
          bottom: mq.MediaQueryValues(context).width*0.05,
          top: mq.MediaQueryValues(context).height*0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Row(
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
                                  text: "PROJECT",
                                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                                ),
                                TextSpan(
                                  text: " SHOWCASE",
                                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                                )
                              ]
                            )
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
                      delay: 500.ms,
                      child: Center(
                        child: Text(
                          "A selection of projects showcasing my journey in mobile and web development, solving real-world problems through thoughtful design and clean code",
                          style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: false,
                        isMobile: false,
                        isImageLeft: true,
                        image: const DidoPreview(),
                        title: "DIDO",
                        desc: "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: dido,
                        context: context,
                      ),
                    ),
                  ),
                ),
                
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: false,
                        isMobile: false,
                        isImageLeft: false,
                        image: const CKlinkPreview(),
                        title: "CKlink",
                        desc: "CKLink is an internal management tool handling attendance, employee data, and more.",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: cklink,
                        context: context,
                      ),
                    ),
                  ),
                ),
                
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: false,
                        isMobile: false,
                        isImageLeft: true,
                        image: const DeltaSpaPreview(),
                        title: "Delta Spa",
                        desc: "Premium men's wellness app for booking and services.",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: delta,
                        context: context,
                      ),
                    ),
                  ),
                ),
    
                SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
    
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                  text: "Personal",
                                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                                ),
                                TextSpan(
                                  text: " Projects",
                                  style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                                )
                              ]
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Text(
                        "Projects that keep my passion for technology alive.",
                        style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mq.MediaQueryValues(context).height*0.05,),
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: true,
                        isMobile: false,
                        isImageLeft: false,
                        image: const CardPreview(),
                        title: "Forum Discussion",
                        desc: "Forum Group Discussion is a mobile application that enables users to create and join communities to discuss their hobbies and interests with others online.",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: dido,
                        context: context,
                      ),
                    ),
                  ),
                ),
                
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: true,
                        isMobile: false,
                        isImageLeft: true,
                        image: const HistoryPreview(),
                        title: "Hi!Story",
                        desc: "Hi!Story is a mobile application that allows users to discover and review museums based on their interests and experiences.",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: cklink,
                        context: context,
                      ),
                    ),
                  ),
                ),
                
                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: ProjectItemHover(
                        isPersonalProject: true,
                        isMobile: false,
                        isImageLeft: false,
                        image: const BankuPreview(),
                        title: "BanKu",
                        desc: "BanKu is a mobile application designed to provide users with access to a wide collection of novels that can be read online for free.",
                        playstore: (){
                      
                        },
                        appstore: (){
                          
                        },
                        tools: delta,
                        context: context,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    ),
  );
}
