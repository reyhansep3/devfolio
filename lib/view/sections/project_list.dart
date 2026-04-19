import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart' as context;
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/widgets/project_item.dart';
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
    'Firebase',
  ];

  final List<String> dido = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
  ];

  final List<String> delta = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
    'Firebase',
    'Xendit',
    'Jira',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Responsivelayout(
      mobile: _mobileBody(
          cklink: cklink,
          delta: delta,
          history: history,
          forumd: forumd,
          banku: banku,
          dido : dido,
          widthBody: width,
          heightBody: height),
      tablet: _desktopBody(
        context: context,
        cklink: cklink,
          forumd: forumd,
          delta : delta,
          banku: banku,
          dido : dido,
          history: history,
          widthBody: width,
          heightBody: height * 0.27,
          imageHeight: 200,
          imageWidth: 200),
      desktop: _desktopBody(
          cklink: cklink,
          delta: delta,
          context: context,
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
  required List delta,
  required double widthBody,
  required double heightBody,
  required double imageHeight,
  required double imageWidth,
  required BuildContext context
}) {
  return Container(
    decoration: const BoxDecoration(color: Colors.black),
    child: Padding(
      padding: EdgeInsets.only(
        left: context.width*0.15,
        right: context.width*0.15,
        bottom: context.width*0.05,
        top: context.height*0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withValues(alpha:0.05),
                          Colors.white.withValues(alpha:0.02),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha:0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha:0.2),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back_ios_rounded, color: Colors.green,),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.green),
                        
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width : context.width*0.005),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Featured",
                          style: AppFontStyle.largeText.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                        ),
                        TextSpan(
                          text: " Projects",
                          style: AppFontStyle.largeText.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey1),
                        )
                      ]
                    )
                  ),
                ],
              ),
              
              Text(
                "Projects that keep my passion for technology alive.",
                style: AppFontStyle.mediumText.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height*0.05,),
              ProjectItemHover(
                isImageLeft: true,
                image: const DidoPreview(),
                title: "DIDO",
                desc: "Drive In Drop Off: Exclusive Cargo Delivery Companion by PT CKL Indonesia Raya",
                tools: dido,
                context: context,
              ),
              
              ProjectItemHover(
                isImageLeft: false,
                image: const CKlinkPreview(),
                title: "CKlink",
                desc: "CKLink is an internal management tool handling attendance, employee data, and more.",
                tools: cklink,
                context: context,
              ),
              
              ProjectItemHover(
                isImageLeft: true,
                image: const DeltaSpaPreview(),
                title: "Delta Spa",
                desc: "Premium men's wellness app for booking and services.",
                tools: delta,
                context: context,
              )
         
          
          
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
    required List delta,
    required List forumd,
    required List history}) {
  return Container(
    decoration: const BoxDecoration(color: Colors.black),
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
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DeltaSpaPreview(),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Delta Spa",
                        style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffC3E5FF))),
                    Text(
                        "Delta Spa, your go-to app for premium men’s wellness. This application makes it easy to book treatments, explore spa services, and enjoy exclusive member perks — all designed to deliver a luxurious and relaxing experience tailored for men.",
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
                          itemCount: delta.length,
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
                                  child: Center(child: Text(delta[index]))),
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
