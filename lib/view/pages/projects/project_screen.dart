import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/projects/dimension/project_list_desktop.dart';
import 'package:flutter_portofolio/view/pages/projects/dimension/project_list_mobile.dart';
import 'package:flutter_portofolio/view/pages/projects/dimension/project_list_tablet.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class ProjectList extends StatelessWidget {
  ProjectList({Key? key}) : super(key: key);
  final List<String> forumd = <String>[
    'Flutter',
    'Dart',
    'Golang',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> banku = <String>[
    'Flutter',
    'Dart',
    'Firebase',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> history = <String>[
    'Flutter',
    'Dart',
    'PhpMyAdmin',
    'Android Studio',
    'VsCode',
    'Figma'
  ];

  final List<String> cklink = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
    'Firebase',
  ];

  final List<String> dido = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
  ];

  final List<String> delta = <String>[
    'Flutter',
    'Dart',
    'Android Studio',
    'VsCode',
    'Firebase',
    'Xendit',
    'Jira',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Responsivelayout(
        mobile: (context) => projectMobilebBody(
          context: context,
          cklink: cklink,
            forumd: forumd,
            delta : delta,
            banku: banku,
            dido : dido,
            history: history,
            widthBody: width,
            heightBody: height * 0.27,
            imageHeight: 200,
            imageWidth: 200),
        tablet: (context) => projectTabletBody(
          context: context,
          cklink: cklink,
            forumd: forumd,
            delta : delta,
            banku: banku,
            dido : dido,
            history: history,
            widthBody: width,
            heightBody: height * 0.27,
            imageHeight: 200,
            imageWidth: 200),
        desktop: (context) => projectDesktopBody(
            cklink: cklink,
            delta: delta,
            context: context,
            forumd: forumd,
            banku: banku,
            dido : dido,
            history: history,
            widthBody: width,
            heightBody: height * 0.27,
            imageHeight: 200,
            imageWidth: 200),
      );
  }
}
