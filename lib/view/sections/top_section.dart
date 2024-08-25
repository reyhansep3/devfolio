import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portofolio/animation/entrance_fader.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

///add blob widget

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Responsivelayout(
      mobile: _mobileBody(widthBody: width, heightBody: height),
      tablet: _tabletBody(
          widthBody: width,
          heightBody: height,
          imageHeight: 200,
          imageWidth: 200),
      desktop: _desktopBody(
          widthBody: width,
          heightBody: height,
          imageHeight: 200,
          imageWidth: 200),
    );
  }
}

// String urlLinkedin = "http://www.linkedin.com/in/reyhan-septri-asta";
// String urlGithub = "https://github.com/ReyST81";
// String urlInstagram = "https://www.instagram.com/reyhansep3asta/";

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
  
Container _desktopBody({
  required double widthBody,
  required double heightBody,
  required double imageHeight,
  required double imageWidth,
  // required Uri launchLinkedin,
  // required Uri launchInsta,
  // required Uri launchGit
}) {
  return Container(
      constraints: const BoxConstraints(maxHeight: 500, minHeight: 400),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperOne(flip: true, reverse: true),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      color: const Color(0xff00285d),
                      height: 300,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          EntranceFader(
            offset: const Offset(0, 0),
            delay: const Duration(seconds: 1),
            duration: const Duration(milliseconds: 800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 639, maxHeight: 860),
                  child: Image.asset("assets/image/profile_image.png"),
                ),
                // Expanded(
                //   child: AspectRatio(
                //     aspectRatio: 100 / 98,
                //     child: Image.asset("assets/image/profile_image.png"),
                //   ),
                // ),
                const SizedBox(
                  width: 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.black)
                      ),
                      padding: const EdgeInsets.all(10),
                      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello Friends! Welcome to my portofolio",
                            style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w300,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Reyhan Septri Asta",
                            style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w500,
                                fontSize: 35,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "I'm a Mobile Developer ",
                            style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Lets Get To Know Me On",
                            style: GoogleFonts.comfortaa(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                                size: 35,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.instagram.com/reyhansep3asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Instagram",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.linkedin.com/in/reyhan-septri-asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Linkedin",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://github.com/reyhansep3");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "github",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
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
        ],
      ));
}

Container _tabletBody({
  required double widthBody,
  required double heightBody,
  required double imageHeight,
  required double imageWidth,
}) {
  return Container(
      constraints: const BoxConstraints(maxHeight: 639, minHeight: 400),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  ClipPath(
                    //upper clippath with less height
                    clipper: WaveClipperOne(flip: true, reverse: true),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      color: const Color(0xff00285d),
                      height: 300,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints:
                    const BoxConstraints(maxWidth: 639, maxHeight: 860),
                child: Image.asset("assets/image/profile_image.png"),
              ),
              const SizedBox(
                width: 60,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)
                            ),
                            padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hello Friends! Welcome to my portofolio",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Reyhan Septri Asta",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 35,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "I'm a Mobile Developer ",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              "Lets Get To Know Me On",
                              style: GoogleFonts.comfortaa(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                                size: 35,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.instagram.com/reyhansep3asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Instagram",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.linkedin.com/in/reyhan-septri-asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Linkedin",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://github.com/reyhansep3");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "github",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ));
}

SingleChildScrollView _mobileBody({
  required double widthBody,
  required double heightBody,
}) {
  return SingleChildScrollView(
    child: Container(
      width: widthBody,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: heightBody * 0.1),
        child: Stack(
          children: [
            Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClipperOne(flip: true, reverse: true),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 50),
                      color: const Color(0xff00285d),
                      height: 300,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
            Container(
              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)
                            ),
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello Friends! Welcome to my portofolio",
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Reyhan Septri Asta",
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "I'm a Mobile Developer ",
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Lets Get To Know Me On",
                    style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                                size: 35,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.instagram.com/reyhansep3asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Instagram",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://www.linkedin.com/in/reyhan-septri-asta/");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Linkedin",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  launchURL("https://github.com/reyhansep3");
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "github",
                                    style: GoogleFonts.comfortaa(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                  // Container(
                  //   constraints:
                  //       const BoxConstraints(maxWidth: 300, maxHeight: 430),
                  //   child: Center(
                  //     child: Align(
                  //       alignment: Alignment.bottomCenter,
                  //       child: Image.asset("assets/image/profile_image.png"),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
