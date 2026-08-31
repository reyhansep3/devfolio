import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:flutter_portofolio/item/app_colors.dart';

class HoverSkillIcon extends StatefulWidget {
  final String assetPath;
  final String label;
  final double size;

  const HoverSkillIcon({
    super.key,
    required this.assetPath,
    required this.label,
    this.size = 30,
  });

  @override
  State<HoverSkillIcon> createState() => _HoverSkillIconState();
}

class _HoverSkillIconState extends State<HoverSkillIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 150),
            opacity: _isHovered ? 1.0 : 0.0,
            child: AnimatedSlide(
              duration: const Duration(milliseconds: 150),
              offset: _isHovered ? Offset.zero : const Offset(0, 0.3),
              child: _CommentBubble(text: widget.label),
            ),
          ),
          const SizedBox(height: 6),
          SvgPicture.asset(
            widget.assetPath,
            height: widget.size,
            width: widget.size,
          ),
        ],
      ),
    );
  }
}

class _CommentBubble extends StatelessWidget {
  final String text;

  const _CommentBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColor.grey2,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: AppFontStyle.poppinsBodySmall.copyWith(color: Colors.black)
          ),
        ),
        CustomPaint(
          size: const Size(10, 6),
          painter: _BubbleTailPainter(color: AppColor.grey2,),
        ),
      ],
    );
  }
}

class _BubbleTailPainter extends CustomPainter {
  final Color color;

  _BubbleTailPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path()
      ..moveTo(size.width / 2 - 5, 0)
      ..lineTo(size.width / 2 + 5, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BubbleTailPainter oldDelegate) =>
      oldDelegate.color != color;
}