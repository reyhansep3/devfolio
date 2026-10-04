import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/home_project_showcase.dart';

class ProjectSection extends StatelessWidget {
  final VoidCallback? onViewAll;
  const ProjectSection({super.key, this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return HomeProjectShowcase(onViewAll: onViewAll);
  }
}
