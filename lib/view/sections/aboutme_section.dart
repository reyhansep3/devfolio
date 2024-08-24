import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: _mobileBody(widthBody: width, heightBody: height),
      desktop: _desktopBody(widthBody: width, heightBody: height * 0.2),
      tablet: _tabletBody(widthBody: width, heightBody: height * 0.2),
    );
  }
}

_desktopBody({
  required double widthBody,
  required double heightBody,
}) {
  return Container(
    decoration: const BoxDecoration(
      color: Color(0xffC3E5FF),
    ),
    child: Padding(
      padding: EdgeInsets.only(
          left: widthBody * 0.09,
          right: widthBody * 0.09,
          bottom: heightBody,
          top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 400.0,
            width: 400.0,
            child: Image.asset(
              'assets/image/dumdum.png',
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Who am i?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xff00285d)),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "Hello, My name is Reyhan Septri Asta, a Junior Flutter Developer",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: Colors.black),
                ),
                const SizedBox(height: 14),
                Text(
                  "A Fresh graduate major in S1 Informatics Department at Telkom University. I'm pssionate in developing mobile application using Flutter and Dart as programming language. i have been developing mobile apps using flutter framework for over 1 year now, and im eager to learn more about this framework so i can master it. I have worked in team along side with UI/UX Designer, Backend, Quality Ensurance, and FrontEnd Website in launching a prototype mobile application and website and got valuable experience. I am self motivated to improve and exploring mor about this framework, and also developing personal skills.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "i seek challenging opportunities where i can fully  use my skills for success.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color(0xff00285d)),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 300,
                  runSpacing: 12,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Languages : Dart, PHP, Html, Python, C++.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Framework : Flutter, Laravel, Bootstrap",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Design : Figma, Canva",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Soft Skill : Teamwork , Time Management, Critikal Thinking, Creative, Discipline",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

_tabletBody({
  required double widthBody,
  required double heightBody,
}) {
  return Container(
    decoration: const BoxDecoration(
      color: Color(0xffC3E5FF),
    ),
    width: widthBody,
    child: Padding(
      padding: EdgeInsets.only(
          left: widthBody * 0.04,
          right: widthBody * 0.04,
          bottom: heightBody,
          top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 350.0,
            width: 350.0,
            child: Image.asset(
              'assets/image/dumdum.png',
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "About Me",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Who am i?",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color(0xff00285d)),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "Hello, My name is Reyhan Septri Asta, a Junior Flutter Developer",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 19,
                      color: Colors.black),
                ),
                const SizedBox(height: 14),
                Text(
                  "A Student major in S1 Informatics Department at Telkom University. I'm pssionate in developing mobile application using Flutter and Dart as programming language. i have been developing mobile apps using flutter framework for over 10 month now, and im eager to learn more about this framework so i can master it. I have worked in team along side with UI/UX Designer, Backend, Quality Ensurance, and FrontEnd Website in launching a prototype mobile application and website and got valuable experience. I am self motivated to improve and exploring mor about this framework, and also developing personal skills.",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 17,
                ),
                Text(
                  "i seek challenging opportunities where i can fully  use my skills for success.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: const Color(0xff00285d)),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 15,
                ),
                Wrap(
                  spacing: 300,
                  runSpacing: 12,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Languages : Dart, PHP, Html, Python, C++.",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Framework : Flutter, Laravel, Bootstrap",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Design : Figma, Canva",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Soft Skill : Teamwork , Time Management, Critikal Thinking, Creative, Discipline",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.notoSans(
                              fontWeight: FontWeight.w300,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

_mobileBody({
  required double widthBody,
  required double heightBody,
}) {
  return SizedBox(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: widthBody,
            decoration: const BoxDecoration(
              color: Color(0xffC3E5FF),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(right: 20, left: 20, top: heightBody * 0.1),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(500),
                          child: Image.asset(
                            'assets/image/dumdum.png',
                            height: 350,
                            width: 350,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 500,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "About Me",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 35,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Who am i?",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: const Color(0xff00285d)),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Text(
                              "Hello, My name is Reyhan Septri Asta, a Junior Flutter Developer",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              "A Student major in S1 Informatics Department at Telkom University. I'm pssionate in developing mobile application using Flutter and Dart as programming language. i have been developing mobile apps using flutter framework for over 10 month now, and im eager to learn more about this framework so i can master it. I have worked in team along side with UI/UX Designer, Backend, Quality Ensurance, and FrontEnd Website in launching a prototype mobile application and website and got valuable experience. I am self motivated to improve and exploring mor about this framework, and also developing personal skills.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 17,
                            ),
                            Text(
                              "i seek challenging opportunities where i can fully  use my skills for success.",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: const Color(0xff00285d)),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Wrap(
                              spacing: 300,
                              runSpacing: 12,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Languages : Dart, PHP, Html, Python, C++.",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Framework : Flutter, Laravel, Bootstrap",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Design : Figma, Canva",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Soft Skill : Teamwork , Time Management, Critikal Thinking, Creative, Discipline",
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.notoSans(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
