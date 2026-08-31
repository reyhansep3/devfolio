import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/skill_tree.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/trophy_part.dart';

Widget skillsTabletBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;

  // Lebar konten dibatasi agar di tablet (800–1023px) tidak melebar anjlr
  // tapi juga tidak numpuk. skillsMainTree diberi lebar ~52%, trophy ~38%.
  final double contentWidth = width.clamp(800.0, 1023.0);
  final double skillsWidth = contentWidth * 0.52;
  final double trophyWidth = contentWidth * 0.38;

  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Stack(
      children: [
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Skills tree ──
              SizedBox(
                width: skillsWidth,
                child: skillsMainTree(context, treeWidth: skillsWidth),
              ),
              SizedBox(width: contentWidth * 0.04),
              // ── Trophy / specialize card ──
              SizedBox(
                width: trophyWidth,
                child: trophyWidget(context, cardWidth: trophyWidth),
              ),
            ],
          ),
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
                  "SKILLS",
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
