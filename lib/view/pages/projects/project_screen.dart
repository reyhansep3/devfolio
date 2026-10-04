import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/home_project_showcase.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  static const _projects = <ProjectShowcaseData>[
    ProjectShowcaseData(
      title: 'DIDO',
      description:
          'Drive In Drop Off: exclusive cargo-delivery companion by PT CKL Indonesia Raya.',
      tools: ['Flutter', 'Dart', 'Android Studio', 'VsCode'],
      preview: DidoPreview(),
    ),
    ProjectShowcaseData(
      title: 'CKlink',
      description:
          'An internal workspace for attendance, employee data, and daily operations.',
      tools: ['Flutter', 'Dart', 'Firebase', 'Android Studio', 'VsCode'],
      preview: CKlinkPreview(),
    ),
    ProjectShowcaseData(
      title: 'Delta Spa',
      description: 'A premium men’s wellness app for booking and services.',
      tools: ['Flutter', 'Dart', 'Firebase', 'Xendit', 'Jira'],
      preview: DeltaSpaPreview(),
    ),
    ProjectShowcaseData(
      title: 'Forum Discussion',
      description:
          'A community application for creating and joining conversations around shared interests.',
      tools: ['Flutter', 'Dart', 'Golang', 'Android Studio', 'VsCode', 'Figma'],
      preview: CardPreview(),
    ),
    ProjectShowcaseData(
      title: 'Hi!Story',
      description:
          'A museum discovery and review application shaped around personal interests and experiences.',
      tools: ['Flutter', 'Dart', 'PhpMyAdmin', 'Android Studio', 'VsCode', 'Figma'],
      preview: HistoryPreview(),
    ),
    ProjectShowcaseData(
      title: 'BanKu',
      description: 'A reader app with a broad online collection of free novels.',
      tools: ['Flutter', 'Dart', 'Firebase', 'Android Studio', 'VsCode', 'Figma'],
      preview: BankuPreview(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return const ProjectShowcase(
      projects: _projects,
      eyebrow: 'PROJECT ARCHIVE',
      title: 'Built for work.\nMade to last.',
      description:
          'A complete collection of production and personal projects, designed around useful mobile experiences and clean implementation.',
    );
  }
}
