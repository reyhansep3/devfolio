import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/project_item.dart';

Widget mobilebBody({
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
  return Container(
    decoration: const BoxDecoration(color: Colors.black),
    child: Padding(
      padding: EdgeInsets.only(
        left: context.width*0.15,
        right: context.width*0.15,
        bottom: context.width*0.05,
        top: context.height*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
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
                          Icon(Icons.arrow_back_ios_rounded, color: Colors.green, size: context.height*0.02,),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.green, size: context.height*0.02,),
                        
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width : context.width*0.005),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Featured",
                          style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                        ),
                        TextSpan(
                          text: " Projects",
                          style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                        )
                      ]
                    )
                  ),
                ],
              ),
              
              Text(
                "Projects that keep my passion for technology alive.",
                style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height*0.05,),
              ProjectItemHover(
                isMobile: true,
                isImageLeft: true,
                image: const DidoPreview(),
                title: "DIDO",
                desc: "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                tools: dido,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: true,
                isImageLeft: false,
                image: const CKlinkPreview(),
                title: "CKlink",
                desc: "CKLink is an internal management tool handling attendance, employee data, and more.",
                tools: cklink,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: true,
                isImageLeft: true,
                image: const DeltaSpaPreview(),
                title: "Delta Spa",
                desc: "Premium men's wellness app for booking and services.",
                tools: delta,
                context: context,
              ),
              SizedBox(height: context.height*0.05,),

              Row(
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
                          Icon(Icons.arrow_back_ios_rounded, color: Colors.green, size: context.height*0.02,),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.green, size: context.height*0.02,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width : context.width*0.005),
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

              Text(
                "Projects that keep my passion for technology alive.",
                style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height*0.05,),
              ProjectItemHover(
                isMobile: true,
                isImageLeft: false,
                image: const CardPreview(),
                title: "Forum Discussion",
                desc: "Forum Group Discussion is a mobile application that enables users to create and join communities to discuss their hobbies and interests with others online.",
                tools: dido,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: true,
                isImageLeft: true,
                image: const HistoryPreview(),
                title: "Hi!Story",
                desc: "Hi!Story is a mobile application that allows users to discover and review museums based on their interests and experiences.",
                tools: cklink,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: true,
                isImageLeft: false,
                image: const BankuPreview(),
                title: "BanKu",
                desc: "BanKu is a mobile application designed to provide users with access to a wide collection of novels that can be read online for free.",
                tools: delta,
                context: context,
              ),
         
          
          
        ],
      ),
    ),
  );
}
