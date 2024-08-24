import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "</S3P>",
                style: GoogleFonts.hurricane(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: <Widget>[
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const TopSection()),
              //         );
              //       },
              //       style: const ButtonStyle(),
              //       child: Text(
              //         "Home",
              //         style: GoogleFonts.poppins(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black),
              //       ),
              //     ),
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const AboutMe()),
              //         );
              //       },
              //       child: Text(
              //         "About",
              //         style: GoogleFonts.poppins(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black),
              //       ),
              //     ),
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => ProjectSection()),
              //         );
              //       },
              //       child: Text(
              //         "Project",
              //         style: GoogleFonts.poppins(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black),
              //       ),
              //     ),
              //     SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const ContactSection()),
              //         );
              //       },
              //       child: Text(
              //         "Contact",
              //         style: GoogleFonts.poppins(
              //             fontSize: 15,
              //             fontWeight: FontWeight.w400,
              //             color: Colors.black),
              //       ),
              //     )
              //   ],
              // ),
            ],
          )),
    );
  }
}
