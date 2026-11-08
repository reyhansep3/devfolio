import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/cv_download.dart';

class ResumeActions extends StatelessWidget {
  const ResumeActions({
    super.key,
    this.compact = false,
    this.lightBackground = false,
  });

  final bool compact;
  final bool lightBackground;

  @override
  Widget build(BuildContext context) {
    final fill = lightBackground
        ? const Color(0xFF151715)
        : AppColor.yellowgreen;
    final onFill = lightBackground ? Colors.white : const Color(0xFF151715);
    final textStyle = TextStyle(
      fontSize: compact ? 10 : 11,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.3,
    );

    return TextButton(
      onPressed: seeCv,
      style: TextButton.styleFrom(
        backgroundColor: fill,
        foregroundColor: onFill,
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 10 : 15,
          vertical: 12,
        ),
        minimumSize: const Size(0, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: textStyle,
      ),
      child: const Text('RESUME'),
    );
  }
}
