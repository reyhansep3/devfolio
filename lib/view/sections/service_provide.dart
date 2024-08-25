import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_portofolio/view/widgets/skills_section.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portofolio/item/card_item.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xff00285d)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, bottom: 50, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Service i can do",
                style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
              ),
            ),
            Center(
              child: Text(
                "Service i can do that may be a help",
                style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: CardItem()), 
            SizedBox(
              height: MediaQuery.sizeOf(context).height*0.05,
            ),
            Center(
              child: Text(
                "What's my skills?",
                style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 30.0,
                          height: 1.3,
                        ),
              ),
            ),
            const SkillSection()
           
          ],
        ),
      ),
    );
  }
}
