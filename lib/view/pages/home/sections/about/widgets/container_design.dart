import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';

class SelectedTextBox extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final double fontSize;

  const SelectedTextBox({
    super.key,
    required this.text,
    this.width = 160,
    this.height = 70,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Border Selection
          Positioned(
            left: 8,
            right: 8,
            top: 8,
            bottom: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: AppColor.white,
                  width: 1,
                ),
              ),
            ),
          ),

          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppFontStyle.poppinsBodyLarge.copyWith(
                fontWeight: FontWeight.w900,
                height: 1,
              ),
              // style: TextStyle(
              //   fontSize: fontSize,
              //   fontWeight: FontWeight.w900,
              //   color: AppColor.white,
                // height: 1,
                // letterSpacing: -1,
              // ),
            ),
          ),

          const Positioned(
            left: 0,
            top: 0,
            child: _ResizeHandle(),
          ),

          const Positioned(
            right: 0,
            top: 0,
            child: _ResizeHandle(),
          ),

          const Positioned(
            left: 0,
            bottom: 0,
            child: _ResizeHandle(),
          ),

          const Positioned(
            right: 0,
            bottom: 0,
            child: _ResizeHandle(),
          ),
        ],
      ),
    );
  }
}

class _ResizeHandle extends StatelessWidget {
  const _ResizeHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF1A1A1A),
          width: 3,
        ),
      ),
    );
  }
}