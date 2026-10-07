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
            child: _ImageCard(image: image1, width: 350, height: 350),
          ),

          Positioned(
            right: 70,
            top: 0,
            child: _ImageCard(image: image2, width: 250, height: 250),
          ),

          Positioned(
            right: 20,
            bottom: 0,
            child: _ImageCard(image: image3, width: 250, height: 250),
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatefulWidget {
  const _ImageCard({
    required this.image,
    required this.width,
    required this.height,
  });

  final String image;
  final double width;
  final double height;

  @override
  State<_ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<_ImageCard> {
  bool _hovered = false;

  static const _duration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedScale(
          scale: _hovered ? 1.06 : 1,
          duration: _duration,
          curve: Curves.easeOutCubic,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(end: _hovered ? 1 : 0),
            duration: _duration,
            curve: Curves.easeOutCubic,
            builder: (context, saturation, child) {
              final grayscale = 1 - saturation;
              return ColorFiltered(
                colorFilter: ColorFilter.matrix([
                  .2126 * grayscale + saturation,
                  .7152 * grayscale,
                  .0722 * grayscale,
                  0,
                  0,
                  .2126 * grayscale,
                  .7152 * grayscale + saturation,
                  .0722 * grayscale,
                  0,
                  0,
                  .2126 * grayscale,
                  .7152 * grayscale,
                  .0722 * grayscale + saturation,
                  0,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                ]),
                child: child!,
              );
            },
            child: Image.asset(widget.image, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
