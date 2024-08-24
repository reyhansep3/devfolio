import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CardPreview extends StatefulWidget {
  const CardPreview({Key? key}) : super(key: key);

  @override
  State<CardPreview> createState() => _CardPreviewState();
}

double? width;
double? height;
bool? animate;
bool? cardText;

String urlForum = "https://github.com/Capstone-15-Alta/Flutter-mobile";

class _CardPreviewState extends State<CardPreview> {
  @override
  void initState() {
    animate = false;
    cardText = false;
    super.initState();
  }

  void showPreview(bool animate) {
    setState(() {
      if (animate) {
        width = 400;
        height = 250;
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            cardText = true;
          });
        });
      } else {
        width = 400;
        height = 250;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (a) {
        setState(() {
          animate = true;
          showPreview(animate!);
        });
      },
      onExit: (a) {
        animate = false;
        showPreview(animate!);
        cardText = false;
      },
      child: SizedBox(
        width: 400,
        height: 250,
        child: Stack(
          children: [
            Align(
              child: Container(
                  width: 500,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xff26B893),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Center(
                      child: Text(
                    "Check out source code",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
            ),
            Align(
              child: GestureDetector(
                onTap: () {
                  _launchURL(urlForum);
                },
                child: SizedBox(
                  width: 400,
                  height: 250,
                  child: AnimatedOpacity(
                    opacity: cardText! ? 0 : 1,
                    duration: Duration(milliseconds: cardText! ? 200 : 200),
                    child: Container(
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
                      child: Image.asset(
                        "assets/image/forum_diskusi.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String urlForum) async {
  if (!await launchUrl(Uri.parse(urlForum))) {
    throw 'Could not launch $urlForum';
  }
}
