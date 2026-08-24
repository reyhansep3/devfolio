import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;

Widget skillsMainTree(BuildContext context) {
  return SizedBox(
    width: context.width * .5,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
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
                      text: "EXPERIENCE",
                      style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                    ),
                    TextSpan(
                      text: " & SKILLS",
                      style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                    )
                  ]
                )
              ),
            ],
          ),
          Text(
            "DEVELOPER LV. 03",
            style: AppFontStyle.vtBodyLarge.copyWith(fontSize: 25),
          ),
          
          SizedBox(height: context.height * 0.02),
          skillsSubTree(
            context,
            "Fundamentals",
            "Mid Level",
            4,
          ), // flutter, React, Laravel, Golang
          SizedBox(height: context.height * 0.015),
          skillsSubTree(
            context,
            "Firebase",
            "Advanced",
            4,
          ),
          SizedBox(height: context.height * 0.015),
          skillsSubTree(
            context,
            "Clean Architecture",
            "Advanced",
            4,
          ),
          SizedBox(height: context.height * 0.015),
          skillsSubTree(
            context,
            "CI/CD",
            "Advanced",
            4,
          ),
          SizedBox(height: context.height * 0.015),
          skillsSubTree(
            context,
            "Backend",
            "Beginner",
            4,
          ),
          SizedBox(height: context.height * 0.015),
          skillsSubTree(
            context,
            "AI Integration",
            "Beginner",
            4,
          ),
        ],
      ),
    ),
  );
}

Widget skillsSubTree(
  BuildContext context,
  String skillName,
  String skillLevel,
  int skillCount,
) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.yellowgreen),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              skillName,
              style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.yellowgreen),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Row(
              children: List.generate(
                10,
                (i) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 18,
                    color: i < skillCount
                        ? AppColor.yellowgreen
                        : Colors.grey.shade700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              skillLevel,
              style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.yellowgreen),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      )
    ),
  );
}

Widget skillsDesc(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColor.yellowgreen),
      borderRadius: BorderRadius.circular(20),
    ),
    child: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("Sadasdas"),
        ],
      ),
    ),
  );
}