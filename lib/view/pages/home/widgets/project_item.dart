import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectItemHover extends StatefulWidget {
  final bool isMobile;
  final bool isImageLeft;
  final Widget image;
  final String title;
  final String desc;
  final List tools;
  final BuildContext context;

  const ProjectItemHover({
    super.key,
    required this.isMobile,
    required this.isImageLeft,
    required this.image,
    required this.title,
    required this.desc,
    required this.tools,
    required this.context,
  });

  @override
  State<ProjectItemHover> createState() => _ProjectItemHoverState();
}

class _ProjectItemHoverState extends State<ProjectItemHover> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> textChildren = [
      Text(
        widget.title,
        style: AppFontStyle.poppinsHeadingLarge.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
      ),
      SizedBox(height: context.height * 0.01),
      Text(
        widget.desc,
        textAlign: TextAlign.justify,
        style: AppFontStyle.poppinsBodySmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
      ),
      SizedBox(height: context.height * 0.015),
      Text(
        "Tools I use :",
        style: AppFontStyle.poppinsBodySmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
      ),
      SizedBox(height: context.height * 0.01),
      SizedBox(
        height: context.height * 0.06,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.tools.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: context.width * 0.01),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.05),
                      Colors.white.withValues(alpha: 0.02),
                    ],
                  ),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      widget.tools[index],
                      style: AppFontStyle.poppinsBodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColor.grey2,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ];

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, isHovering ? -20 : 0, 0),
        child: Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.04),
          child: !widget.isMobile
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.isImageLeft
                      ? [
                          widget.image,
                          SizedBox(width: context.width * 0.02),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: textChildren,
                          )),
                        ]
                      : [
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: textChildren,
                          )),
                          SizedBox(width: context.width * 0.02),
                          widget.image,
                        ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.image,
                    SizedBox(height: context.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: textChildren,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}