import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/media_query.dart';
import 'package:svg_flutter/svg.dart';

Widget icon(String path, BuildContext context, double scale) {
  return SizedBox(
    width: context.width*0.02  * scale,
    child: InkWell(
      onTap: () {},
      child: SvgPicture.asset(path, fit: BoxFit.contain),
    ),
  );
}