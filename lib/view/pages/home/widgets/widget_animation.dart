import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:flutter_portofolio/view/pages/formalities/widgets/animation_flying.dart';
import 'package:svg_flutter/svg.dart';

class LogoWidgetAnimation extends StatefulWidget {
  const LogoWidgetAnimation({super.key});

  @override
  State<LogoWidgetAnimation> createState() => _LogoWidgetAnimationState();
}

class _LogoWidgetAnimationState extends State<LogoWidgetAnimation> {
  bool isHovered = false;

  double offsetX = 0;
  double offsetY = 0;

  void onHoverChanged(bool hover) {
    setState(() {
      isHovered = hover;

      if (hover) {
        // ✅ geser sedikit menjauh
        offsetX = 12;
        offsetY = -6;
      } else {
        // ✅ balik ke posisi awal
        offsetX = 0;
        offsetY = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHoverChanged(true),
      onExit: (_) => onHoverChanged(false),
      child: FlyingWidget(
          amplitude: 8,
        widget: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          transform: Matrix4.translationValues(offsetX, offsetY, 0),
          margin: EdgeInsets.only(right: context.width * 0.01),
          decoration: BoxDecoration(
            color: isHovered
                ? AppColor.grey2.withValues(alpha: 0.1)
                : const Color(0xff1a1a1a),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isHovered
                  ? AppColor.grey1
                  : AppColor.grey1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: isHovered
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: context.width * 0.005,
                        ),
                        child: Text(
                          'Hello!',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: context.height * 0.018,
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Image.asset(
                "assets/image/profile.png",
                height: context.height * 0.08,
                // colorFilter: isHovered
                //     ? const ColorFilter.mode(
                //         AppColor.yellowgreen,
                //         BlendMode.srcIn,
                //       )
                //     : null,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}