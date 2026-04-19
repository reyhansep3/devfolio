import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// class Navbar extends StatelessWidget {
//   const Navbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: Colors.black,
//       ),
//       child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "</S3P>",
//                 style: GoogleFonts.hurricane(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const TopSection()),
//                       // );
//                     },
//                     style: const ButtonStyle(),
//                     child: Text(
//                       "Home",
//                       style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                   TextButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const AboutMe()),
//                       // );
//                     },
//                     child: Text(
//                       "About",
//                       style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                   TextButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => ProjectSection()),
//                       // );
//                     },
//                     child: Text(
//                       "Project",
//                       style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   ),
//                   SizedBox(width: MediaQuery.of(context).size.width * 0.03),
//                   TextButton(
//                     onPressed: () {
//                       // Navigator.push(
//                       //   context,
//                       //   MaterialPageRoute(
//                       //       builder: (context) => const ContactSection()),
//                       // );
//                     },
//                     child: Text(
//                       "Contact",
//                       style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.black),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           )),
//     );
//   }
// }

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Dev/",
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "S3p.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Menu tengah
          Row(
            children: [
              _navItem("Home", isActive: true),
              const SizedBox(width: 30),
              _navItem("Services"),
              const SizedBox(width: 30),
              _navItem("Projects"),
              const SizedBox(width: 30),
              _navItem("Contact"),
              const SizedBox(width: 30),
              _navItem("Blog"),
            ],
          ),

          // 🔹 Button kanan
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _navItem(String title, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: isActive
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white),
            )
          : null,
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? Colors.tealAccent : Colors.white70,
        ),
      ),
    );
  }
}