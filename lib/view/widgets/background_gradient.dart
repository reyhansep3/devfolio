import 'package:flutter/material.dart';

Widget backgroundImage() {
  return Positioned.fill(
    child: Stack(
      children: [

        /// BACKGROUND IMAGE
        Positioned.fill(
          child: Image.asset(
            "assets/image/background.png",
            fit: BoxFit.cover,
          ),
        ),

        /// RADIAL FADE OVERLAY
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  Colors.black,
                  Colors.black.withValues(alpha: 0.6),
                  Colors.transparent,
                ],
                stops: const [
                  0.4,
                  0.75,
                  1.4,
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}