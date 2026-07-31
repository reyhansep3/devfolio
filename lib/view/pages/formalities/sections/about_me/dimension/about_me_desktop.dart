import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

Widget desktopBody(BuildContext context, double width, double height) {
  // final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
  // const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  final titleFontSize = 60 * scale;
  return SingleChildScrollView(
    child: Container(
      color: Colors.black,
      width: context.width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.15,
        vertical: context.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "AB",
                    style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                      fontSize: titleFontSize,
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      height: 0.92,
                    ),
                  ),
                  TextSpan(
                    text: "OUT",
                    style: AppFontStyle.vcrMonoBodyLarge.copyWith(
                      fontSize: titleFontSize,
                      color: AppColor.yellowgreen, 
                      fontWeight: FontWeight.bold,
                      height: 0.92,
                    ),
                  ),
                ]
              )
            ),
            SizedBox(height: context.height*0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I’m Reyhan Septri Asta, a mobile developer and product enthusiast who enjoys turning ideas into seamless digital experiences. I focus on building products that are not only functional, but intuitive, scalable, and enjoyable to use.",
                        style: AppFontStyle.poppinsBodyMedium
                            .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                      
                      SizedBox(height: context.height*0.04,),
                      Text(
                        "My journey started with a curiosity for how great products are built—from design decisions to technical execution. Over time, that curiosity evolved into hands-on experience creating mobile applications and digital solutions that solve real user problems.",
                        style: AppFontStyle.poppinsBodySmall
                            .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                            textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: context.height*0.04,),
                      Text(
                        "With a background in mobile development, I work across the product lifecycle—from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bridging the gap between design and engineering to create products that feel simple on the surface and thoughtful underneath.",
                        style: AppFontStyle.poppinsBodySmall
                            .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                            textAlign: TextAlign.justify,
                      ),
                      
                      SizedBox(height: context.height*0.04,),
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColor.yellowgreen,
                        ),
                        width: context.width*0.18,
                        child: Padding(
                          padding: EdgeInsets.all(context.width*0.02),
                          child: Center(
                            child: Text(
                              "  of work, I recharge through gaming, reading, and exploring new places. I find that stepping outside my routine fuels my curiosity and gives me fresh perspectives often inspiring ideas that transform everyday problems into meaningful products.",
                              style: AppFontStyle.poppinsBodySmall
                                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Align(
                      alignment: Alignment.centerRight,
                        child: Container(
                        decoration: const BoxDecoration(
                          color: AppColor.yellowgreen,
                        ),
                        width: context.width*0.18,
                        child: Padding(
                          padding: EdgeInsets.all(context.width*0.02),
                          child: Center(
                            child: Text(
                              "I find that stepping outside my routine fuels my curiosity and gives me fresh perspectives often inspiring ideas that transform everyday problems into meaningful products.",
                              style: AppFontStyle.poppinsBodySmall
                                .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    ),
  );
}