import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

Widget trophyWidget(BuildContext context, {double? cardWidth}) {
  final double cardW = cardWidth ?? context.width * 0.2;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: cardW,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.yellowgreen),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FLUTTER",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white, fontSize: 18),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.01,),
              Text(
                "Mid Level",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.yellowgreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "Building high peformance, beautiful and cross-platform apps with Flutter",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.yellowgreen)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "I SPECIALIZE IN",
                    style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.yellowgreen),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: context.height*0.02,),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "State Management",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.yellowgreen, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: " : Provider, BLoC, Cubit, and GetX",
                      style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                    ),
                  ],
                ),
              ),
             
              SizedBox(height: context.height*0.02,),
              Text(
                "I enjoy designing application logic using state management patterns because they help keep code organized, scalable, and easier to maintain. It's rewarding to see how the right architecture can make complex applications more reliable and easier to develop.",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.yellowgreen)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ARCHITECTURE",
                    style: AppFontStyle.poppinsBodySmall.copyWith(color: AppColor.yellowgreen),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "MVVM, Clean Architecture",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.yellowgreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "designing software architecture because it provides a solid foundation for building scalable, maintainable, and well-structured applications.",
                style: AppFontStyle.poppinsBodyMedium.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
      
            ],
          ),
        ),
      ),
    ],
  );
}