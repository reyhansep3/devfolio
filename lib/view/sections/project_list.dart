import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class ProjectSection extends StatelessWidget {
  ProjectSection({Key? key}) : super(key: key);
  final List<String> forumd = <String>[
    'Flutter',
    'Dart',
    'Golang',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> banku = <String>[
    'Flutter',
    'Dart',
    'Firebase',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> history = <String>[
    'Flutter',
    'Dart',
    'PhpMyAdmin',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> cklink = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
  ];

  final List<String> dido = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Responsivelayout(
      mobile: _mobileBody(
                cklink: cklink,

          history: history,
          forumd: forumd,
          banku: banku,
          dido : dido,
          widthBody: width,
          heightBody: height),
      tablet: _desktopBody(
        cklink: cklink,
          forumd: forumd,
          banku: banku,
          dido : dido,
          history: history,
          widthBody: width,
          heightBody: height * 0.27,
          imageHeight: 200,
          imageWidth: 200),
      desktop: _desktopBody(
                cklink: cklink,

          forumd: forumd,
          banku: banku,
          dido : dido,
          history: history,
          widthBody: width,
          heightBody: height * 0.27,
          imageHeight: 200,
          imageWidth: 200),
    );
  }
}

Container _desktopBody({
  required List banku,
  required List forumd,
  required List dido,
  required List cklink,
  required List history,
  required double widthBody,
  required double heightBody,
  required double imageHeight,
  required double imageWidth,
}) {
  return Container(
    decoration: const BoxDecoration(color: Color(0xff00285d)),
    child: Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50, left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "All Of My Project",
              style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
            ),
          ),
          // Center(
          //   child: Text(
          //     "I may not be an expert but i surely be of use",
          //     style: GoogleFonts.oswald(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 20.0,
          //                 height: 1.3,
          //               ),
          //   ),
          // ),
           const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Project's from previous work",
              style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DidoPreview(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DIDO",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dido.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Wrap(
                                spacing: 40,
                                runSpacing: 40,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child:
                                          Center(child: Text(dido[index]))),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CKlinkPreview(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CKlink",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "CKLink, an essential tool for CKL Management. This application not only tracks attendance but also excels in managing employee information, organizational structure, leave reporting, and permissions.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dido.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Wrap(
                                spacing: 40,
                                runSpacing: 40,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child:
                                          Center(child: Text(cklink[index]))),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Project's from previous studies",
              style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CardPreview(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Forum Group Disusion",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Forum Group Disusion is a Mobile Application for user to form a group to discus their hoby or interest with other people online",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Wrap(
                                spacing: 40,
                                runSpacing: 40,
                                children: [
                                  Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child:
                                          Center(child: Text(forumd[index]))),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BankuPreview(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Banku (BAcaaNKU)",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Banku is a Mobile Application for user to read any novel online for free, as long as the novel is within this application",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child: Center(child: Text(banku[index]))),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HistoryPreview(),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi!Story",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Hi!Story is a Mobile Application for user to find and also review a musieum they like, as long as the museum is within this application",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                children: [
                                  Container(
                                      width: 100,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      child:
                                          Center(child: Text(history[index]))),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
         
          
          
        ],
      ),
    ),
  );
}

Container _mobileBody(
    {required double widthBody,
    required double heightBody,
    required List banku,
    required List dido,
    required List cklink,
    required List forumd,
    required List history}) {
  return Container(
    decoration: const BoxDecoration(color: Color(0xff00285d)),
    child: Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "All Of My Project",
              style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
            ),
          ),
          // Center(
          //   child: Text(
          //     "I may not be an expert but i surely be of use",
          //     style: GoogleFonts.oswald(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 20.0,
          //                 height: 1.3,
          //               ),
          //   ),
          // ),
           const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              "Project's from previous work",
              style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DidoPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("DIDO",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dido.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text(dido[index]))),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CKlinkPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("CKlink",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "CKLink, an essential tool for CKL Management. This application not only tracks attendance but also excels in managing employee information, organizational structure, leave reporting, and permissions.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: cklink.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text(cklink[index]))),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CardPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Forum Group Disusion",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Forum Group Disusion is a Mobile Application for user to form a group to discus their hoby or interest with other people online",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text(forumd[index]))),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const BankuPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Banku (BAcaaNKU)",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Banku is a Mobile Application for user to read any novel online for free, as long as the novel is within this application",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text(banku[index]))),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HistoryPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Hi!Story",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Hi!Story is a Mobile Application for user to find and also review a musieum they like, as long as the museum is within this application",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    const SizedBox(height: 20),
                    Text("Tools i use",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white)),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: forumd.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                  ),
                                  child: Center(child: Text(history[index]))),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
