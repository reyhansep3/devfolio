import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mobileBody(
  BuildContext context,
  double width,
  double height,
  bool isHovered,
  void Function(bool) onHoverChanged,
) {
  final heroHeight = height - kNavbarHeight;

  final scale = (width / 390).clamp(0.8, 1.0);

  final nameFontSize = 20 * scale;
  final titleFontSize = 56 * scale;
  final descriptionFontSize = 14 * scale;
  final taglineFontSize = 10 * scale;

  return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: heroHeight,
    ),
    child: Container(
      width: double.infinity,
      color: AppColor.primary,
      child: Stack(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.07,
              vertical: 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 500.ms,
                      child: Text(
                        'Reyhan Septri Asta',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: nameFontSize,
                          fontWeight: FontWeight.w600,
                          color: AppColor.darkGray,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 550.ms,
                      child: Text(
                        'Mobile Software\nEngineer',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.w900,
                          height: 0.92,
                          letterSpacing: -2,
                          color: AppColor.pureBlack,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 600.ms,
                      child: Text(
                        "Hi! I'm Reyhan, a Flutter-focused Software Engineer "
                        "passionate about building scalable and intuitive "
                        "digital experiences. I specialize in developing "
                        "production-ready mobile applications with clean "
                        "architecture, smooth UX, and maintainable code.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: descriptionFontSize,
                          fontWeight: FontWeight.w400,
                          height: 1.6,
                          color: AppColor.darkGray,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                RepaintBoundary(
                  child: FadeInUp(
                    config: BaseAnimationConfig(
                      delay: 650.ms,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            '// I DO CODE, CLEAN CODE.',
                            style: GoogleFonts.poppins(
                              fontSize: taglineFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                              color: AppColor.pureBlack,
                            ),
                          ),
                          Text(
                            ' SCALABLE SOLUTIONS CODE.',
                            style: GoogleFonts.poppins(
                              fontSize: taglineFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                              color: AppColor.darkUI,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                RepaintBoundary(
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

                const SizedBox(height: 100),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'SCROLL',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGray,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 2,
                  height: 45,
                  color: AppColor.darkGray,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}