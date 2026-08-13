import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/media_query.dart';

class GlassCard extends StatefulWidget {
  final String title;
  final String description;
  // final double height;
  final double width;

  const GlassCard({
    super.key,
    required this.title,
    required this.description,
    // required this.height,
    required this.width,
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
          // height: widget.height,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white.withValues(alpha: 0.05),
                Colors.white.withValues(alpha: 0.02),
              ],
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha : isHovering ? 0.1 : 0.0),
                blurRadius: isHovering ? 30 : 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title == "Responsive" ? responsiveCard() : 
              widget.title == "Fetching" ? fetchingCard() : moreCard(),
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
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget responsiveCard(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: context.width*0.1,
          height: context.height*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: !isHovering ? Colors.white.withValues(alpha: 0.2) : AppColor.yellowgreen.withValues(alpha: 0.2),
            ),
          ),
        ),
        SizedBox(height: context.height*0.02,),
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: context.width*0.15,
          height: context.height*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
        ),
        SizedBox(height: context.height*0.02,),
        Container(
          margin: const EdgeInsets.only(right: 8),
          width: context.width*0.05,
          height: context.height*0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.2),
            ),
          ),
        ),
      ],
    );
  }

Widget fetchingCard(){
  return Column(
    children: [
      SizedBox(height: context.height*0.02,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(3 * 2 - 1, (index) {
          final isCircle = index.isEven;
          if (isCircle) {
            return Container(
              width: context.height*0.06,
              height: context.height*0.06,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2),),
              ),
            );
          }
          return Expanded(
            child: Container(
              height: 2,
              color: Colors.white.withValues(alpha: 0.2),
            ),
          );
        }),
      ),
      SizedBox(height: context.height*0.04,),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(2 * 2 - 1, (index) {
          final isCircle = index.isEven;
          if (isCircle) {
            return Container(
              width: context.height*0.04,
              height: context.height*0.04,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.2),),
              ),
            );
          }
          return Expanded(
            child: Container(
              height: 2,
              color: Colors.white.withValues(alpha: 0.2),
            ),
          );
        }),
      ),
    ],
  );
}

  Widget moreCard(){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: context.width*0.05,
              height: context.height*0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
            SizedBox(height: context.height*0.02,),
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: context.width*0.05,
              height: context.height*0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: context.width*0.02,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.height*0.04,),
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: context.width*0.05,
              height: context.height*0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
            SizedBox(height: context.height*0.02,),
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: context.width*0.05,
              height: context.height*0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}