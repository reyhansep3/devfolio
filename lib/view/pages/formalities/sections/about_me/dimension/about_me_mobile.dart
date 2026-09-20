import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
 import 'package:flutter_portofolio/item/media_query.dart' as mq;
import 'package:google_fonts/google_fonts.dart';

Widget aboutMeMobileBody(BuildContext context, double width, double height) {
  // final screenHeight = MediaQuery.of(context).size.height; // di tahan dlu
  // const navbarHeight = 80.0; // masih belum fix

  final scale = (width / 1024).clamp(0.5, 1.3);
  // final titleFontSize = 60 * scale;
  return Container(
    width: double.infinity,
    color: AppColor.primary,
    child: Column(
      // left: context.width * 0.12,
      children: [
        SizedBox(
          width: double.infinity,
          height: mq.MediaQueryValues(context).height,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Image.asset(
                  "assets/image/about_picture.jpeg",
                  width:  mq.MediaQueryValues(context).width,
                  height: mq.MediaQueryValues(context).height,
                ),
              ),
              Positioned(
                left: mq.MediaQueryValues(context).width * 0.12,
                right: mq.MediaQueryValues(context).width * 0.5,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColor.pureBlack,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'About Me',
                            style: GoogleFonts.poppins(
                              fontSize: 65 * scale,
                              fontWeight: FontWeight.w800,
                              height: 0.95,
                              letterSpacing: -2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: mq.MediaQueryValues(context).height * 0.02,
                      ),

                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: mq.MediaQueryValues(context).width * 0.4,
                        ),
                        child: Container(
                        color: AppColor.pureBlack,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "I'm Reyhan a Mobile Developer in Jakarta who loves turning ideas into a products people love and helping business grow",
                              style: GoogleFonts.poppins(
                                fontSize: 20 * scale,
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: mq.MediaQueryValues(context).height * 0.02,
                      ),

                      Container(
                        height: 4,
                        width: mq.MediaQueryValues(context).width * 0.07,
                        decoration: BoxDecoration(
                          color: AppColor.grey1,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),

                      SizedBox(
                        height: mq.MediaQueryValues(context).height * 0.02,
                      ),

                      Container(
                        margin: EdgeInsets.only(
                          left: mq.MediaQueryValues(context).width * 0.02,
                        ),
                        height: 4,
                        width: mq.MediaQueryValues(context).width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColor.grey1,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
            ],
          ),
        )
      ],
    ),
  );
}