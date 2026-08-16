import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

// ignore: must_be_immutable
class ProjectItemHover extends StatefulWidget {
  final bool isMobile;
  final bool isImageLeft;
  final Widget image;
  final String title;
  final String desc;
  final List tools;
  final BuildContext context;
  void Function()? playstore;
  void Function()? appstore;
  void Function()? project;
  final bool isPersonalProject;

  ProjectItemHover({
    super.key,
    required this.isMobile,
    required this.isImageLeft,
    required this.image,
    required this.title,
    required this.desc,
    required this.tools,
    required this.context,
    this.playstore,
    this.appstore,
    this.project,
    required this.isPersonalProject
  });

  @override
  State<ProjectItemHover> createState() => _ProjectItemHoverState();
}

class _ProjectItemHoverState extends State<ProjectItemHover> {
  bool isHovering = false;
  bool playstoreHovering = false;
  bool appstoreHovering = false;
  bool projectHovering = false;
  

  @override
  Widget build(BuildContext context) {
    List<Widget> textChildren = [
      Text(
        widget.title,
        style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
      ),
      SizedBox(height: context.height * 0.01),
      Text(
        widget.desc,
        textAlign: TextAlign.justify,
        style: AppFontStyle.poppinsBodySmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
      ),
      SizedBox(height: context.height * 0.015),
      Text(
        "Tools I use :",
        style: AppFontStyle.poppinsBodySmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
      ),
      SizedBox(height: context.height * 0.01),
      SizedBox(
        height: context.height * 0.06,
        child: widget.isMobile
            ? Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widget.tools.map<Widget>((tool) {
                      return Padding(
                        padding: EdgeInsets.only(right: context.width * 0.01),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
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
                                tool,
                                style: AppFontStyle.poppinsBodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.grey2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.tools.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: context.width * 0.01),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
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
      SizedBox(height: context.height * 0.03),
      if(!widget.isPersonalProject)
      Row(
        mainAxisAlignment: widget.isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.appstore,
            child: MouseRegion(
              onEnter: (_) => setState(() => appstoreHovering = true),
              onExit: (_) => setState(() => appstoreHovering = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(0, appstoreHovering ? -10 : 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: appstoreHovering ? AppColor.yellowgreen : AppColor.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "PlayStore",
                            style: AppFontStyle.poppinsBodySmall.copyWith(
                              color: appstoreHovering ? AppColor.yellowgreen : AppColor.white,
                            ),
                          ),
                          SizedBox(width: context.width*0.005,),
                          Icon(
                            Icons.arrow_outward_rounded, 
                            color: appstoreHovering ? AppColor.yellowgreen: AppColor.white,
                          )
                        ],
                      ),
                    ),
                ),
              ),
            ),
          ),
          SizedBox(width: context.width * 0.02),
          GestureDetector(
            onTap: widget.playstore,
            child: MouseRegion(
              onEnter: (_) => setState(() => playstoreHovering = true),
              onExit: (_) => setState(() => playstoreHovering = false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                transform: Matrix4.translationValues(0, playstoreHovering ? -10 : 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: playstoreHovering ? AppColor.yellowgreen : AppColor.white),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "AppStore",
                            style: AppFontStyle.poppinsBodySmall.copyWith(
                              color: playstoreHovering ? AppColor.yellowgreen : AppColor.white,
                            ),
                          ),
                          SizedBox(width: context.width*0.005,),
                          Icon(
                            Icons.arrow_outward_rounded, 
                            color: playstoreHovering ? AppColor.yellowgreen: AppColor.white,
                          )
                        ],
                      ),
                    ),
                ),
              ),
            ),
          ),
        ],
      ),
      if(widget.isPersonalProject)
      GestureDetector(
        onTap: widget.project,
        child: MouseRegion(
          onEnter: (_) => setState(() => projectHovering = true),
          onExit: (_) => setState(() => projectHovering = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(0, projectHovering ? -10 : 0, 0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: projectHovering ? AppColor.yellowgreen : AppColor.white),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "View Project",
                        style: AppFontStyle.poppinsBodySmall.copyWith(
                          color: projectHovering ? AppColor.yellowgreen : AppColor.white,
                        ),
                      ),
                      SizedBox(width: context.width*0.005,),
                      Icon(
                        Icons.arrow_outward_rounded, 
                        color: projectHovering ? AppColor.yellowgreen: AppColor.white,
                      )
                    ],
                  ),
                ),
            ),
          ),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.image,
                    SizedBox(height: context.height * 0.02),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: textChildren,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}