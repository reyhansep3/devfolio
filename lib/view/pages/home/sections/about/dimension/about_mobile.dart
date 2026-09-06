import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Widget skillsMobileBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
) {
    final screenHeight = MediaQuery.of(context).size.height;

  final scale = (width / 1024).clamp(0.5, 1.3);

  return Container(
    color: AppColor.primary,
    height: screenHeight,
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal : context.width*0.1),
                  child: MouseRegion(
                    onEnter: (_) => onHoverChanged(true),
                    onExit: (_) => onHoverChanged(false),
                    child: isHovered
                        ? Image.asset(
                            "assets/image/about_picture.jpeg",
                          )
                        : ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.grey,
                              BlendMode.saturation,
                            ),
                            child: Image.asset(
                              "assets/image/about_picture.jpeg",
                            ),
                          ),
                  ),
                ),
                Positioned(
                  bottom: context.height*0.02,
                  left: context.width*0.05,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.white
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'About Me',
                        style: GoogleFonts.poppins(
                          fontSize: 65 * scale,
                          fontWeight: FontWeight.w800,
                          height: 0.95,
                          letterSpacing: -2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.height*0.02,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A brief introduction my journey as a software engineer.',
                  style: GoogleFonts.poppins(
                    fontSize: 25 * scale,
                    fontWeight: FontWeight.w600,
                    height: 1.6,
                    color: AppColor.darkUI,
                  ),
                ),
                SizedBox(height: context.height*0.02,),
                Container(
                  height: 4,
                  width: context.width*0.07,
                  decoration: BoxDecoration(
                    color: AppColor.grey1,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                SizedBox(height: context.height*0.01,),
                Container(
                  margin: EdgeInsets.only(left: context.width*0.02),
                  height: 4,
                  width: context.width*0.15,
                  decoration: BoxDecoration(
                    color: AppColor.grey1,
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
                SizedBox(height: context.height*0.02,),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).go('/formalities');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.darkUI,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Learn More",
                        style: AppFontStyle.poppins.copyWith(
                          color: AppColor.pureWhite
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        // Positioned(
        //   left: 40,
        //   bottom: 40,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       const RotatedBox(
        //         quarterTurns: 1,
        //         child: Text(
        //           "SKILLS",
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w600,
        //             color: AppColor.darkUI,
        //             letterSpacing: 2,
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 18),
        //       Container(
        //         width: 2,
        //         height: 120,
        //         color: AppColor.darkUI,
        //       ),
        //     ],
        //   ),
        // )
      ],
    ),
  );
}