import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart';

Widget trophyWidget(BuildContext context){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        width: context.width*0.27,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.yellowgreen),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "FLUTTER",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "Mid Level",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.yellowgreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "Building high peformance, beautiful and cross-platform apps with Flutter",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "I SPECIALIZE IN",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "State Management : Provider, BLoC, Cubit, and GetX",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.yellowgreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "I enjoy designing application logic using state management patterns because they help keep code organized, scalable, and easier to maintain. It's rewarding to see how the right architecture can make complex applications more reliable and easier to develop.",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "Architecture : MVVM, Clean Architecture",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.yellowgreen),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: context.height*0.02,),
              Text(
                "designing software architecture because it provides a solid foundation for building scalable, maintainable, and well-structured applications.",
                style: AppFontStyle.vtBodyLarge.copyWith(color: AppColor.white),
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