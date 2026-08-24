import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/skill_tree.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/trophy_part.dart';

Widget skillsMobileBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 70.0;
  // final bodyHeight = screenHeight - navbarHeight;

  // final scale = (width / 1024).clamp(0.5, 1.3);
  // final titleFontSize = 60 * scale;

  return Container(
    color: Colors.black,
    height: screenHeight - navbarHeight,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        skillsMainTree(context),
        SizedBox(width: context.width*0.02,),
        trophyWidget(context)
      ],
    ),
  );
}