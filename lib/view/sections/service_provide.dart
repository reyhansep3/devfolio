import 'package:flutter/material.dart';
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
                style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Center(
              child: Text(
                "Service i can do that may be a help",
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w200),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: CardItem())
          ],
        ),
      ),
    );
  }
}
