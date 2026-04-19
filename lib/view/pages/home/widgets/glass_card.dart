// import 'dart:ui';

// import 'package:flutter/material.dart';

// class GlassCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final double height;
//   final double width;


//   const GlassCard({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.height,
//     required this.width,

//   });

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(24),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//         child: Container(
//           width: width,
//           height: height,
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(24),
//             gradient: LinearGradient(
//               colors: [
//                 Colors.white.withValues(alpha: 0.05),
//                 Colors.white.withValues(alpha: 0.02),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//             border: Border.all(
//               color: Colors.white.withValues(alpha: 0.1),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.white.withValues(alpha: 0.05),
//                 blurRadius: 20,
//                 spreadRadius: 1,
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Fake icon placeholders (like your image)
//               Row(
//                 children: List.generate(
//                   4,
//                   (index) => Container(
//                     margin: const EdgeInsets.only(right: 8),
//                     width: 20,
//                     height: 20,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         color: Colors.white.withValues(alpha: 0.2),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               const Spacer(),

//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: TextStyle(
//                   color: Colors.white.withValues(alpha: 0.7),
//                   fontSize: 13,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatefulWidget {
  final String title;
  final String description;
  final double height;
  final double width;

  const GlassCard({
    super.key,
    required this.title,
    required this.description,
    required this.height,
    required this.width
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,

        transform: Matrix4.translationValues(
          0,
          isHovering ? -20 : 0, // naik 20px
          0,
        ),

        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.05),
                Colors.white.withOpacity(0.02),
              ],
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovering ? 0.4 : 0.2),
                blurRadius: isHovering ? 30 : 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}