import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
    final String email = "reyhanseptri@gmail.com";

  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Contacting You&body=Hello, I would like to discuss...', // Optional parameters
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle the error if the email app can't be opened
      throw 'Could not launch $url';
    }
  }

  void _launchWhatsapp() async {
   const url = "https://wa.me/6281378850755";
   if (await canLaunch(url)) {
     await launch(url);
   } else {
   throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Contact Info",
                    style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Center(
                  child: Text(
                    "Lets get in touch and lets work together",
                    style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 40,
                    runSpacing: 40,
                    children: [
                      
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            _launchWhatsapp();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                                size: 50,
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height*0.02
                              ),
                              Text(
                                "WhatsApp or Phone Number",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height*0.02
                              ),
                              Text(
                                "081378850755",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            _launchEmail();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/image/gmail.png",
                                  ),
                                  SizedBox(
                                height: MediaQuery.sizeOf(context).height*0.02
                              ),
                                  Text(
                                    "Reyhanseptri@gmail.com",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
