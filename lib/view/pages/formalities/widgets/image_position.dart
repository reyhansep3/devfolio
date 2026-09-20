import 'package:flutter/material.dart';

class ThreeImages extends StatelessWidget {
  const ThreeImages({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
  });

  final String image1;
  final String image2;
  final String image3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 520,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 20,
            top: 30,
            bottom: 30,
            child: _ImageCard(
              image: image1,
              width: 350,
              height: 350,
            ),
          ),

          Positioned(
            right: 70,
            top: 0,
            child: _ImageCard(
              image: image2,
              width: 250,
              height: 250,
            ),
          ),

          Positioned(
            right: 20,
            bottom: 0,
            child: _ImageCard(
              image: image3,
              width: 250,
              height: 250,
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}