import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/project_item.dart';

Widget desktopBody({
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
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_rounded, color: Colors.green,),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.green),
                        
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
                          style: AppFontStyle.largeText.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                        ),
                        TextSpan(
                          text: " Projects",
                          style: AppFontStyle.largeText.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
                        )
                      ]
                    )
                  ),
                ],
              ),
              
              Text(
                "Projects that keep my passion for technology alive.",
                style: AppFontStyle.mediumText.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height*0.05,),
              ProjectItemHover(
                isMobile: false,
                isImageLeft: true,
                image: const DidoPreview(),
                title: "DIDO",
                desc: "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                tools: dido,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: false,
                isImageLeft: false,
                image: const CKlinkPreview(),
                title: "CKlink",
                desc: "CKLink is an internal management tool handling attendance, employee data, and more.",
                tools: cklink,
                context: context,
              ),
              
              ProjectItemHover(
                isMobile: false,
                isImageLeft: true,
                image: const DeltaSpaPreview(),
                title: "Delta Spa",
                desc: "Premium men's wellness app for booking and services.",
                tools: delta,
                context: context,
              )
         
          
          
        ],
      ),
    ),
  );
}
