import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/utils/skill_category.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillCategoryCard extends StatelessWidget {
  const SkillCategoryCard({super.key, 
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final SkillCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: selected
                ? const Color(0xffeeeeee)
                : const Color(0xffe9e9e9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: selected
                  ? Colors.black
                  : Colors.transparent,
              width: 1,
            ),
            boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.10),
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.55),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  category.icon,
                  size: 21,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 9),

              Text(
                category.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                category.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  height: 1.35,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff4d4d4d),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}