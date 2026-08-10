import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DidoPreview extends StatelessWidget {
  const DidoPreview({super.key});

  final String urlDIDO =
      "https://play.google.com/store/apps/details?id=com.cklcargo.driveindriveoff&hl=en";

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(urlDIDO),
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
          child: Image.asset(
            "assets/image/dido.png",
            width: 400,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}