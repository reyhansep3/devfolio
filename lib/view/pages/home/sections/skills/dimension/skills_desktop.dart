import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/skill_tree.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/widgets/trophy_part.dart';

Widget skillsDesktopBody(
  BuildContext context, double width, double height,
  bool isHovered,void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix

  // final scale = (width / 1024).clamp(0.5, 1.3);

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