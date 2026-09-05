import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget tabletBody(
  BuildContext context, double width, double height,
  bool isHovered, void Function(bool) onHoverChanged,
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
                  // LEFT CONTENT
                  Flexible(
                    flex: 6,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reyhan Septri Asta',
                          style: GoogleFonts.poppins(
                            fontSize: 26 * scale,
                            fontWeight: FontWeight.w600,
                            color: AppColor.darkGray,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'Mobile Software\nEngineer',
                          style: GoogleFonts.poppins(
                            fontSize: 72 * scale,
                            fontWeight: FontWeight.w900,
                            height: 0.95,
                            letterSpacing: -2,
                            color: Colors.black,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Text(
                            "Hi! I'm Reyhan, a Flutter-focused Software Engineer "
                            "passionate about building scalable and intuitive "
                            "digital experiences. I specialize in developing "
                            "production-ready mobile applications with clean "
                            "architecture, smooth UX, and maintainable code. ",
                            style: GoogleFonts.poppins(
                              fontSize: 16 * scale,
                              fontWeight: FontWeight.w400,
                              height: 1.6,
                              color: AppColor.darkGray,
                            ),
                          ),

                        const SizedBox(height: 24),

                        Row(
                          children: [
                            Text(
                              '// I DO CODE, CLEAN CODE.',
                              style: GoogleFonts.poppins(
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: AppColor.pureBlack,
                              ),
                            ),
                            Text(
                              ' SCALABLE SOLUTIONS CODE.',
                              style: GoogleFonts.poppins(
                                fontSize: 18 * scale,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                                color: AppColor.darkUI,
                              ),
                            ),
                          ],
                        ),
                      ],
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
          Positioned(
            bottom: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "SCROLL",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGray,
                      letterSpacing: 2,
                    ),
                  ),

                const SizedBox(height: 10),
                Container(
                  width: 2,
                  height: 60,
                  color: AppColor.darkGray,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}