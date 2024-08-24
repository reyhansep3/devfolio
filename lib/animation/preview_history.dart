import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryPreview extends StatefulWidget {
  const HistoryPreview({Key? key}) : super(key: key);

  @override
  State<HistoryPreview> createState() => _HistoryPreviewState();
}

String urlBanku = "https://github.com/ReyST81/Hi-Story_mobile";

double? width;
double? height;
bool? animate;
bool? cardText;

class _HistoryPreviewState extends State<HistoryPreview> {
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
                  width: 400,
                  height: 250,
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
                      child: Text(
                    "Check out source code",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ))),
            ),
            Align(
              child: GestureDetector(
                onTap: () {
                  _launchURL(urlBanku);
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
                        "assets/image/history.png",
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

Future<void> _launchURL(String urlBanku) async {
  if (!await launchUrl(Uri.parse(urlBanku))) {
    throw 'Could not launch $urlBanku';
  }
}
