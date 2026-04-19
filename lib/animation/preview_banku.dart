import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class BankuPreview extends StatelessWidget {
  const BankuPreview({super.key});

  final String urlBanku = "https://github.com/ReyST81/Banku-NovelApp";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(urlBanku),
      borderRadius: BorderRadius.circular(12),

      child: Ink(
        width: 400,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              // Image
              Image.asset(
                "assets/image/banku.png",
                width: 400,
                height: 250,
                fit: BoxFit.cover,
              ),

              // Overlay (biar text kebaca)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                ),
              ),

              // Text
              Center(
                child: Text(
                  "Check out source code",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
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