import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;

Widget skillsMainTree(BuildContext context, {double? treeWidth}) {
  final double treeW = treeWidth ?? context.width * .4;
  return SizedBox(
    width: treeW,
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
          SizedBox(height: context.height * 0.01),
          Text(
            "The experience and skills behind the products I build",
            style: AppFontStyle.poppinsBodyLarge.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: context.height * 0.02),
          const SkillSubTreeCard(
            skillName: "Fundamentals",
            skillLevel: "Mid Level",
            skillCount: 4,
            skillDesc: "I understand the core fundamentals of how software products are built.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "Firebase",
            skillLevel: "Advanced",
            skillCount: 4,
            skillDesc: "I understand how Firebase works and how to use it to build and scale apps.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "Clean Architecture",
            skillLevel: "Advanced",
            skillCount: 4,
            skillDesc: "I understand clean architecture and how to keep app code maintainable.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "CI/CD",
            skillLevel: "Advanced",
            skillCount: 4,
            skillDesc: "I understand how CI/CD pipelines work and can set them up for a project.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "Backend",
            skillLevel: "Beginner",
            skillCount: 4,
            skillDesc: "I have a basic understanding of how backend systems work.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "Android",
            skillLevel: "Advanced",
            skillCount: 4,
            skillDesc: "I understand how Android applications work.",
          ),
          SizedBox(height: context.height * 0.015),
          const SkillSubTreeCard(
            skillName: "IOS",
            skillLevel: "Advanced",
            skillCount: 4,
            skillDesc: "I understand how iOS applications work.",
          ),
        ],
      ),
    ),
  );
}

class SkillSubTreeCard extends StatefulWidget {
  final String skillName;
  final String skillLevel;
  final int skillCount;
  final String skillDesc;

  const SkillSubTreeCard({
    super.key,
    required this.skillName,
    required this.skillLevel,
    required this.skillCount,
    required this.skillDesc,
  });

  @override
  State<SkillSubTreeCard> createState() => _SkillSubTreeCardState();
}

class _SkillSubTreeCardState extends State<SkillSubTreeCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          border: Border.all(
            color: isHovering
                ? AppColor.yellowgreen
                : AppColor.yellowgreen.withValues(alpha: 0.6),
          ),
          borderRadius: BorderRadius.circular(10),
          color: isHovering
              ? AppColor.yellowgreen.withValues(alpha: 0.08)
              : Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(100)
                          ),
                        ),
                        SizedBox(width: mq.MediaQueryValues(context).width*0.005,),
                        Text(
                          widget.skillName,
                          style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.yellowgreen),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                               color: i < widget.skillCount
                                ? AppColor.yellowgreen
                                : Colors.grey.shade700,
                            ),
                            height: 18,
                          
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.skillLevel,
                      style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.yellowgreen),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: isHovering
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          widget.skillDesc,
                          style: AppFontStyle.poppinsBodySmall.copyWith(
                            color: AppColor.white,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
