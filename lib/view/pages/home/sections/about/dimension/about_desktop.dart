import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

Widget skillsDesktopBody(
  BuildContext context,
  double width,
  double height,
  bool isHovered,
  void Function(bool) onHoverChanged,
) {
  final screenHeight = MediaQuery.of(context).size.height;

  final scale = (width / 1024).clamp(0.5, 1.3);

  return Container(
    width: double.infinity,
    // This section uses Expanded internally, so it needs a bounded height.
    // Keep that bound local to the section instead of faking the app viewport.
    height: screenHeight < 650 ? 650 : screenHeight,
    color: AppColor.primary,
    child: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: GoogleFonts.poppins(
                              fontSize: 65 * scale,
                              fontWeight: FontWeight.w800,
                              height: 0.95,
                              letterSpacing: -2,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(
                            height: context.height * 0.02,
                          ),

                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: context.width * 0.35,
                            ),
                            child: Text(
                              "I'm Reyhan a Mobile Developer in Jakarta who loves turning ideas into a products people love and helping business grow",
                              style: GoogleFonts.poppins(
                                fontSize: 13 * scale,
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                                color: AppColor.darkUI,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: context.height * 0.02,
                          ),

                          // Line 1
                          Container(
                            height: 4,
                            width: context.width * 0.07,
                            decoration: BoxDecoration(
                              color: AppColor.grey1,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),

                          SizedBox(
                            height: context.height * 0.02,
                          ),

                          // Line 2
                          Container(
                            margin: EdgeInsets.only(
                              left: context.width * 0.02,
                            ),
                            height: 4,
                            width: context.width * 0.1,
                            decoration: BoxDecoration(
                              color: AppColor.grey1,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),

                          SizedBox(
                            height: context.height * 0.04,
                          ),

                          // Learn More Button
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).go('/formalities');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColor.darkUI,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 14,
                              ),
                              child: Text(
                                "Learn More",
                                style: AppFontStyle.poppins.copyWith(
                                  color: AppColor.pureWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Center(
                        child: MouseRegion(
                          onEnter: (_) => onHoverChanged(true),
                          onExit: (_) => onHoverChanged(false),
                          child: isHovered
                              ? Image.asset(
                                  "assets/image/about_picture.jpeg",
                                  width: 400 * scale,
                                  fit: BoxFit.contain,
                                )
                              : ColorFiltered(
                                  colorFilter: const ColorFilter.mode(
                                    Colors.grey,
                                    BlendMode.saturation,
                                  ),
                                  child: Image.asset(
                                    "assets/image/about_picture.jpeg",
                                    width: 400 * scale,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 40,
          bottom: 40,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RotatedBox(
                quarterTurns: 1,
                child: Text(
                  "SKILLS",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkUI,
                    letterSpacing: 2,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Container(
                width: 2,
                height: 120,
                color: AppColor.darkUI,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
