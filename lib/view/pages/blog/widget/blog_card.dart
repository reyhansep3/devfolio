import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/pages/blog/detail_blog.dart';
// import 'package:flutter_portofolio/item/media_query.dart' as mq;

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
    child: Card(
      color: AppColor.grey1.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColor.grey2,
          width: 0.5,        
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: AspectRatio(
                aspectRatio: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey2)
                  ),
                  child: Image.asset(
                    blog['image']?.toString() ??
                        "assets/image/mobile_size_blog.png",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Image.asset(
                      "assets/image/mobile_size_blog.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog['title']?.toString() ?? '-',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          
                const SizedBox(height: 8),
          
                Text(
                  blog['subtitle']?.toString() ?? '-',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppFontStyle.poppinsBodySmall.copyWith(
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
                  blog['read_time']?.toString() ?? "4 Min Read",
                  style: AppFontStyle.poppinsBodySmall.copyWith(
                    color: AppColor.grey2,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColor.grey2,
                  size: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}