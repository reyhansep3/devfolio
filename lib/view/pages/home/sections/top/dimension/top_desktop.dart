import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

Widget desktopBody(
  BuildContext context,
  double width,
  double height,
  bool isHovered,
  void Function(bool) onHoverChanged,
) {
  final heroHeight = height - kNavbarHeight;

  final scale = (width / 1024).clamp(0.5, 1.3);

  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: heroHeight),
    child: Container(
      width: double.infinity,
      color: AppColor.primary,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reyhan Septri Asta - Mobile Developer',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 16 * scale,
                              color: AppColor.darkGray,
                            ),
                          ),

                          const SizedBox(height: 16),

                          Text(
                            'I  CODE  TO  BUILD  A  FAST,  SCALABLE,  AND  BEAUTIFUL  DIGITAL  PRODUCTS.', //'I LIKE TO BUILD A FUNCTIONAL AND BEAUTIFUL DIGITAL EXPERIENCE',
                            style: GoogleFonts.poppins(
                              fontSize: 42 * scale,
                              fontWeight: FontWeight.w700,
                              height: 1.1,
                              letterSpacing: -2,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 24),

                          Text(
                            "Between writing lines of code and coffee breaks, I am someonw who is "
                            "passionate about building a functuonal and beautiful"
                            "digital experiences. Who specialize in Mobile Development",
                            style: GoogleFonts.poppins(
                              fontSize: 14 * scale,
                              fontWeight: FontWeight.w400,
                              height: 1.6,
                              color: AppColor.darkGray,
                            ),
                          ),

                          // const SizedBox(height: 24),

                          // Wrap(
                          //   children: [
                          //     Text(
                          //       '// I DO CODE, CLEAN CODE.',
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w700,
                          //         letterSpacing: 0.5,
                          //         color: AppColor.pureBlack,
                          //       ),
                          //     ),
                          //     Text(
                          //       ' SCALABLE SOLUTIONS CODE.',
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 18,
                          //         fontWeight: FontWeight.w700,
                          //         letterSpacing: 0.5,
                          //         color: AppColor.darkUI,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Center(
                      child: RepaintBoundary(
                        child: FadeInUp(
                          config: BaseAnimationConfig(
                            delay: 700.ms,
                            child: const PhoneWidget(
                              height: 550,
                              width: 280,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 40,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       const Text(
          //           "SCROLL",
          //           style: TextStyle(
          //             fontSize: 12,
          //             fontWeight: FontWeight.w600,
          //             color: AppColor.darkGray,
          //             letterSpacing: 2,
          //           ),
          //         ),

          //       const SizedBox(height: 10),
          //       Container(
          //         width: 2,
          //         height: 60,
          //         color: AppColor.darkGray,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    ),
  );
}
