import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectItemHover extends StatefulWidget {
  final bool isImageLeft;
  final Widget image;
  final String title;
  final String desc;
  final List tools;
  final BuildContext context;

  const ProjectItemHover({
    super.key,
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
    Widget textSection = Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: const Color(0xffC3E5FF),
            ),
          ),

          SizedBox(height: context.height * 0.01),

          Text(
            widget.desc,
            textAlign: TextAlign.justify,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),

          SizedBox(height: context.height * 0.015),

          Text(
            "Tools I use",
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
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
                    width: context.width * 0.06,
                    height: context.height * 0.05,
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.circular(12),
                    //   color: Colors.white,
                    // ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isHovering ? 0.3 : 0.1),
                          blurRadius: isHovering ? 30 : 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.tools[index],
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,

        transform: Matrix4.translationValues(
          0,
          isHovering ? -20 : 0, // naik
          0,
        ),

        child: Padding(
          padding: EdgeInsets.only(bottom: context.height * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.isImageLeft
                ? [
                    widget.image,
                    SizedBox(width: context.width * 0.02),
                    textSection,
                  ]
                : [
                    textSection,
                    SizedBox(width: context.width * 0.02),
                    widget.image,
                  ],
          ),
        ),
      ),
    );
  }
}