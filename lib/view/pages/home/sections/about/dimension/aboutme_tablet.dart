import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/glass_card.dart';

Widget tabletBody({
  required double widthBody,
  required double heightBody,
  required BuildContext context
}) {
  return Container(
    width: context.width,
    decoration: const BoxDecoration(
      color: Colors.black,
    ),
    child: Padding(
      padding: EdgeInsets.only(
          left: context.width*0.15,
          right: context.width*0.15,
          bottom: heightBody,
          top: context.height*0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Keep learning...",
            style: AppFontStyle.poppinsHeadingMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: context.height*0.03,),
          RichText(
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
          // Text(
          //   "KEEP BUILDING",
          //   style: AppFontStyle.largeTextMono.copyWith(fontWeight: FontWeight.bold, color: AppColor.white, fontSize: 50),
          //   textAlign: TextAlign.start,
          // ),
          SizedBox(height: context.height*0.01,),
          Text(
            "Principles I rely on to turn complex problems into simple, scalable\nsolutions.",
            style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.height*0.07,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: GlassCard(
                    height: context.height*0.4,
                    width: context.width,
                    title: "Flexbox",
                    description:
                        "Breaking layout behavior into a model that feels predictable.",
                  ),
                ),
                SizedBox(width: context.width*0.02),
                Flexible(
                  child: GlassCard(
                    height: context.height*0.4,
                    width: context.width,
                    title: "Fetching",
                    description:
                        "A simpler way to think about data flow and rendering tradeoffs.",
                  ),
                ),
                SizedBox(width: context.width*0.02),
                Flexible(
                  child: GlassCard(
                    height: context.height*0.4,
                    width: context.width,
                    title: "And More!",
                    description:
                        "Other write-ups on front-end thinking, systems, and developer taste.",
                  ),
                ),
              ],
            ),
          ),

        ],
      )
    ),
  );
}