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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffC3E5FF)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              //upper clippath with less height
              clipper: WaveClipperOne(flip: true, reverse: false),
              child: Container(
                padding: const EdgeInsets.only(bottom: 50),
                color: const Color(0xff00285d),
                height: 300,
                alignment: Alignment.center,
              ),
            ),
          ),
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
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Container(
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
                              const FaIcon(
                                FontAwesomeIcons.phone,
                                color: Colors.black,
                                size: 50,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "WhatsApp or Phone Number",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w400),
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
                      GestureDetector(
                        onTap: () {
                          _launchEmail();
                        },
                        child: Container(
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
                                "assets/image/gmail.png",
                              ),
                              const SizedBox(height: 30),
                              Text(
                                "Reyhanseptri@gmail.com",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.w400),
                              )
                            ],
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
