import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/data/datasource/experience_local_datasource.dart';
import 'package:flutter_portofolio/data/datasource/model/experience_model.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;


Widget experienceTabletBody(BuildContext context, double width, double height, ExperienceLocalDatasource data) {
  final screenHeight = MediaQuery.of(context).size.height;
  const navbarHeight = 80.0; // masih belum fix

  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(minHeight: screenHeight - navbarHeight),
      child: Container(
        color: Colors.black,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mq.MediaQueryValues(context).width * 0.15,
            vertical: mq.MediaQueryValues(context).width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RepaintBoundary(
                child: FadeInUp(
                  config: BaseAnimationConfig(
                    delay: 1000.ms,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white.withValues(alpha:0.05),
                                Colors.white.withValues(alpha:0.02),
                              ],
                            ),
                            border: Border.all(
                              color: Colors.white.withValues(alpha:0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha:0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
                                Icon(Icons.arrow_forward_ios_rounded, color: Colors.green, size: mq.MediaQueryValues(context).height*0.02,),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width : mq.MediaQueryValues(context).width*0.005),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "WORK",
                                style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.white),
                              ),
                              TextSpan(
                                text: " EXPERIENCE",
                                style: AppFontStyle.vcrMonoHeadingSmall.copyWith(fontWeight: FontWeight.bold, color: AppColor.yellowgreen),
                              )
                            ]
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
              FutureBuilder<List<ExperienceModel>>(
                future: data.getExperience(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('to be experienced soon :3.'));
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RepaintBoundary(
                          child: FadeInUp(
                            config: BaseAnimationConfig(
                              delay: 1000.ms,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: mq.MediaQueryValues(context).height*0.03),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "${snapshot.data?[index].jobTitle}",
                                            style: AppFontStyle.poppinsHeadingSmall.copyWith(
                                              fontWeight: FontWeight.bold
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          "${snapshot.data?[index].date}",
                                          style: AppFontStyle.poppinsBodyLarge.copyWith(
                                            color: AppColor.grey1,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "${snapshot.data?[index].jobName}",
                                            style: AppFontStyle.poppinsBodySmall.copyWith(
                                              color: AppColor.grey1,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(width: mq.MediaQueryValues(context).width * 0.01),
                                        Flexible(
                                          child: Text(
                                            "${snapshot.data?[index].status}",
                                            style: AppFontStyle.poppinsBodySmall.copyWith(
                                              color: AppColor.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
                                    ListView.builder(
                                      itemCount: snapshot.data![index].jobExperience.length,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index2) {
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: mq.MediaQueryValues(context).height * 0.01),
                                          child: Text(
                                            "• ${snapshot.data![index].jobExperience[index2]}",
                                            style: AppFontStyle.poppinsBodySmall,
                                          ),
                                        );
                                      },
                                    ),
                                    
                                    SizedBox(height: mq.MediaQueryValues(context).height * 0.02),
                                    Text("Tools I use :", style: AppFontStyle.poppinsBodySmall),
                                    SizedBox(height: mq.MediaQueryValues(context).height * 0.01),
                                    SizedBox(
                                      height: mq.MediaQueryValues(context).height * 0.05,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data![index].tools.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index2) {
                                          return Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
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
                                                  color: Colors.black.withValues(alpha: 0.2),
                                                  blurRadius: 15,
                                                  offset: const Offset(0, 10),
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Center(
                                                child: Text(
                                                  snapshot.data![index].tools[index2],
                                                  style: AppFontStyle.poppinsBodySmall.copyWith(
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColor.grey2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}              
