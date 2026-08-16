import 'package:flutter/material.dart';
import 'package:flutter_portofolio/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class BankuPreview extends StatelessWidget {
  const BankuPreview({super.key});

  

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
              "assets/image/banku.png",
              width: 400,
              height: 250,
              fit: BoxFit.cover,
            ),
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