import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatefulWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

List<String> mobile = [
  '- Rest API',
  '- Firebase',
  '- User Interface',
  '- Provider/Bloc',
];
List<String> design = [
  '- Figma',
  '- Design mobile and web',
  '- Responsive',
  '- Photoshop',
];
List<String> prototype = [
  '- Working MVP',
  '- Using MVVM Architecture',
];

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 40,
      runSpacing: 40,
      children: [
        FlipCard(
          front: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/mobiledev.png",
                  height: 160,
                  width: 160,
                ),
                const SizedBox(height: 10),
                Text(
                  "Mobile Development",
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Rest API",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Firebase",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- SharedPrefferenced/SQLite",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Provider/Bloc",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
        FlipCard(
          front: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/designing.png",
                  height: 160,
                  width: 160,
                ),
                const SizedBox(height: 10),
                Text(
                  "Designing",
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Figma",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Design mobile and website",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Responsive",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Photoshop",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
        FlipCard(
          front: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/prototyping.png",
                  height: 160,
                  width: 160,
                ),
                const SizedBox(height: 10),
                Text(
                  "Prototyping",
                  style: GoogleFonts.poppins(
                      fontSize: 15, fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          back: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Working MVP",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "- Using MVVM Architecture",
                    style: GoogleFonts.poppins(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
