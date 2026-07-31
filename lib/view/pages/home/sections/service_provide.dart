import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

class ToolsSection extends StatelessWidget {
  const ToolsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.width*0.15,
            right: context.width*0.15,
            bottom: context.height * 0.2,
            top: context.height*0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Featured Projects",
              style: AppFontStyle.poppinsHeadingLarge.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: context.height*0.01,),
            Text(
              "Projects that keep my passion for technology alive.",
              style: AppFontStyle.poppinsBodyMedium.copyWith(fontWeight: FontWeight.bold, color: AppColor.grey2),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.height*0.07,),
            

          ],
        )
      ),
    );
  }
}
