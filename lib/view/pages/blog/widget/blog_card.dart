import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/blog/detail_blog.dart';
import 'package:flutter_portofolio/item/media_query.dart' as mq;

Widget blogCard(
  BuildContext context,
  Map<String, dynamic> blog,
) {
  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlogDetailPage(
            blog: blog,
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.white,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColor.white,
              ),
            ),
            height: mq.MediaQueryValues(context).height * 0.4,
            width: double.infinity,
            child: Image.asset(
              "assets/image/mobile_size_blog.png",
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog['title']?.toString() ?? '-',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                    fontSize: 25,
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  blog['subtitle']?.toString() ?? '-',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                    fontSize: 15,
                    color: AppColor.grey2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "4 Min Read",
                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                    fontSize: 15,
                    color: AppColor.grey2,
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.grey2,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}