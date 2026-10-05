import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/core/constant.dart';

class ProjectShowcaseData {
  const ProjectShowcaseData({
    required this.slug,
    required this.title,
    required this.description,
    required this.overview,
    required this.highlights,
    required this.tools,
    required this.preview,
    required this.imageAsset,
    required this.link,
    required this.linkLabel,
    this.secondaryLink,
    this.secondaryLinkLabel,
  });

  final String slug;
  final String title;
  final String description;
  final String overview;
  final List<String> highlights;
  final List<String> tools;
  final Widget preview;
  final String imageAsset;
  final String link;
  final String linkLabel;
  final String? secondaryLink;
  final String? secondaryLinkLabel;
}

class ProjectCatalog {
  static const projects = <ProjectShowcaseData>[
    ProjectShowcaseData(
      slug: 'werkspace',
      title: 'Werkspace',
      description:
          'A mobile workspace for attendance, employee requests, approvals, and team communication.',
      overview:
          'Werkspace brings everyday HR tasks into one mobile app for employees of registered companies. Team members can record attendance, submit and track requests, view payslips, and stay connected through chat and company news. Managers and HR can review requests from a shared approval queue.',
      highlights: [
        'Clock in and out with a clear view of today’s attendance; location and photo verification can be used when required by the company.',
        'Submit leave, permits, overtime, business trips, reimbursements, and booking requests, then follow each approval step.',
        'Review and approve team requests from one queue, with a reason recorded for rejections.',
        'Access protected payslips, workplace announcements, and private or group chat where available in the company plan.',
      ],
      tools: ['Flutter', 'Dart', 'iOS', 'Android'],
      preview: _WerkspacePreview(),
      imageAsset: 'assets/image/werkspace_store_banner.png',
      link:
          'https://play.google.com/store/apps/details?id=com.cklcargo.werkspace',
      linkLabel: 'View on Google Play',
      secondaryLink: 'https://apps.apple.com/us/app/werkspace/id6811734673',
      secondaryLinkLabel: 'View on App Store',
    ),
    ProjectShowcaseData(
      slug: 'dido',
      title: 'DIDO',
      description:
          'Drive In Drop Off: exclusive cargo-delivery companion by PT CKL Indonesia Raya.',
      overview:
          'DIDO (Drive In Drop Off) is a mobile companion for cargo delivery at PT CKL Indonesia Raya. It brings the delivery experience into one application built around the needs of cargo operations.',
      highlights: [
        'A mobile application focused on cargo delivery.',
        'Designed for the Drive In Drop Off service.',
        'Created for PT CKL Indonesia Raya.',
      ],
      tools: ['Flutter', 'Dart', 'Android Studio', 'VsCode'],
      preview: DidoPreview(),
      imageAsset: 'assets/image/dido.png',
      link: urlDIDO,
      linkLabel: 'View on Play Store',
    ),
    ProjectShowcaseData(
      slug: 'cklink',
      title: 'CKlink',
      description:
          'An internal workspace for attendance, employee data, and daily operations.',
      overview:
          'CKlink is an internal management application that helps bring employee information and everyday work into one place. Its scope includes attendance and employee data, supporting daily operations through a mobile workspace.',
      highlights: [
        'Attendance in an internal mobile workspace.',
        'Employee data in the same application.',
        'Support for daily operational work.',
      ],
      tools: ['Flutter', 'Dart', 'Firebase', 'Android Studio', 'VsCode'],
      preview: CKlinkPreview(),
      imageAsset: 'assets/image/CKLink.png',
      link: urlCklink,
      linkLabel: 'View on Play Store',
    ),
    ProjectShowcaseData(
      slug: 'delta-spa',
      title: 'Delta Spa',
      description: 'A premium men’s wellness app for booking and services.',
      overview:
          'Delta Spa is a mobile application for men’s wellness services. It gives customers a place to explore the service offering and make bookings from their phone.',
      highlights: [
        'Mobile access to wellness services.',
        'A booking experience for customers.',
        'Built for a premium men’s wellness brand.',
      ],
      tools: ['Flutter', 'Dart', 'Firebase', 'Xendit', 'Jira'],
      preview: DeltaSpaPreview(),
      imageAsset: 'assets/image/delta.png',
      link: urlDelta,
      linkLabel: 'View on Play Store',
    ),
    ProjectShowcaseData(
      slug: 'forum-discussion',
      title: 'Forum Discussion',
      description:
          'A community application for creating and joining conversations around shared interests.',
      overview:
          'Forum Discussion is a mobile community application where people can create and join groups around their hobbies and interests. The project centers on making it easier to find others with shared interests and take part in online discussion.',
      highlights: [
        'Create communities around a topic or hobby.',
        'Join groups with shared interests.',
        'Discuss those interests with other members online.',
      ],
      tools: ['Flutter', 'Dart', 'Golang', 'Android Studio', 'VsCode', 'Figma'],
      preview: CardPreview(),
      imageAsset: 'assets/image/forum_diskusi.png',
      link: urlForum,
      linkLabel: 'View on GitHub',
    ),
    ProjectShowcaseData(
      slug: 'hi-story',
      title: 'Hi!Story',
      description:
          'A museum discovery and review application shaped around personal interests and experiences.',
      overview:
          'Hi!Story helps people discover museums and share reviews based on their interests and experiences. It brings museum exploration and personal perspectives together in a mobile application.',
      highlights: [
        'Discover museums that match personal interests.',
        'Read about other visitors’ experiences.',
        'Review museums after a visit.',
      ],
      tools: [
        'Flutter',
        'Dart',
        'PhpMyAdmin',
        'Android Studio',
        'VsCode',
        'Figma',
      ],
      preview: HistoryPreview(),
      imageAsset: 'assets/image/history.png',
      link: urlHiStory,
      linkLabel: 'View on GitHub',
    ),
    ProjectShowcaseData(
      slug: 'banku',
      title: 'BanKu',
      description:
          'A reader app with a broad online collection of free novels.',
      overview:
          'BanKu is a mobile reading application that offers access to a collection of novels online for free. It is designed to give readers a simple place to find a story and read it on their phone.',
      highlights: [
        'Browse a collection of novels.',
        'Read stories online from a mobile device.',
        'Free access to the reading collection.',
      ],
      tools: [
        'Flutter',
        'Dart',
        'Firebase',
        'Android Studio',
        'VsCode',
        'Figma',
      ],
      preview: BankuPreview(),
      imageAsset: 'assets/image/banku.png',
      link: urlBanku,
      linkLabel: 'View on GitHub',
    ),
  ];

  static ProjectShowcaseData? bySlug(String? slug) {
    for (final project in projects) {
      if (project.slug == slug) return project;
    }
    return null;
  }
}

class _WerkspacePreview extends StatelessWidget {
  const _WerkspacePreview();

  @override
  Widget build(BuildContext context) => Image.asset(
    'assets/image/werkspace_store_banner.png',
    width: 540,
    fit: BoxFit.contain,
  );
}
