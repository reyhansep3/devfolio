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
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.03),
            Colors.white.withValues(alpha: 0.01),
          ],
        ),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Container(
              color: Colors.black,
              height: mq.MediaQueryValues(context).height * 0.38,
              width: double.infinity,
              child: Image.asset(
                blog['image']?.toString() ?? "assets/image/mobile_size_blog.png",
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  "assets/image/mobile_size_blog.png",
                  fit: BoxFit.contain,
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
                    fontSize: 22,
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
                    fontSize: 14,
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
                  style: AppFontStyle.poppinsBodyLarge.copyWith(
                    fontSize: 14,
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