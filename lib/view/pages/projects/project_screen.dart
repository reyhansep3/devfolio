import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_banku.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/preview_forum.dart';
import 'package:flutter_portofolio/animation/preview_history.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/home_project_showcase.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return const _ProjectArchive(projects: _projects);
  }
}

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _surface = Color(0xFF202420);
const _rule = Color(0xFF424A42);
const _muted = Color(0xFFB9BDB6);
const _body = Color(0xFF515850);
const _accent = AppColor.yellowgreen;

class _ProjectArchive extends StatelessWidget {
  const _ProjectArchive({required this.projects});

  final List<ProjectShowcaseData> projects;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final compact = width < 800;
    final narrow = width < 1180;
    final inset = compact ? 24.0 : width * .09;
    final count = projects.length.toString().padLeft(2, '0');

    final heroCopy = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PROJECT ARCHIVE  /  REYHAN SEPTRI ASTA',
          style: GoogleFonts.spaceMono(color: _body, fontSize: 12, letterSpacing: 1.2)),
        const SizedBox(height: 27),
        Text('Built for work.\nMade to last.', style: GoogleFonts.poppins(
          color: _ink,
          fontSize: compact ? 43 : (narrow ? 57 : 76),
          height: 1.07,
          letterSpacing: -2.6,
          fontWeight: FontWeight.w700,
        )),
        const SizedBox(height: 28),
        Container(width: 58, height: 3, color: _ink),
      ],
    );
    final heroAside = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(count, style: GoogleFonts.poppins(
          color: _ink, fontSize: compact ? 74 : 104,
          height: 1, letterSpacing: -5, fontWeight: FontWeight.w700)),
        Text('PROJECTS IN THE ARCHIVE', style: GoogleFonts.spaceMono(
          color: _body, fontSize: 12, letterSpacing: 1.2)),
        const SizedBox(height: 25),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 390),
          child: Text(
            'A collection of production and personal projects shaped around useful mobile experiences and clear implementation.',
            style: GoogleFonts.poppins(color: _body, fontSize: compact ? 14 : 16, height: 1.75),
          ),
        ),
      ],
    );

    return Column(children: [
      Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: compact ? 0 : height),
        color: _paper,
        padding: EdgeInsets.fromLTRB(
          inset, compact ? 76 : 140, inset, compact ? 78 : 92),
        child: narrow
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ScrollReveal(child: heroCopy),
              SizedBox(height: compact ? 55 : 70),
              ScrollReveal(fromLeft: false, child: heroAside),
            ])
          : Row(children: [
              Expanded(flex: 6, child: ScrollReveal(child: heroCopy)),
              SizedBox(width: width * .07),
              Expanded(flex: 3, child: ScrollReveal(fromLeft: false, child: heroAside)),
            ]),
      ),
      Container(
        width: double.infinity,
        color: _ink,
        padding: EdgeInsets.fromLTRB(inset, compact ? 76 : 100, inset, compact ? 88 : 110),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('THE INDEX  /  01—$count', style: GoogleFonts.spaceMono(
            color: _accent, fontSize: 12, letterSpacing: 1.3)),
          SizedBox(height: compact ? 35 : 48),
          for (var index = 0; index < projects.length; index++) ...[
            ScrollReveal(
              fromLeft: index.isEven,
              child: _ArchiveProjectCard(
                data: projects[index], number: index + 1,
                compact: compact, imageOnLeft: index.isEven,
              ),
            ),
            if (index != projects.length - 1)
              SizedBox(height: compact ? 18 : 24),
          ],
        ]),
      ),
    ]);
  }
}

class _ArchiveProjectCard extends StatefulWidget {
  const _ArchiveProjectCard({
    required this.data,
    required this.number,
    required this.compact,
    required this.imageOnLeft,
  });

  final ProjectShowcaseData data;
  final int number;
  final bool compact;
  final bool imageOnLeft;

  @override
  State<_ArchiveProjectCard> createState() => _ArchiveProjectCardState();
}

class _ArchiveProjectCardState extends State<_ArchiveProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final preview = Container(
      width: double.infinity,
      height: widget.compact ? 210 : 310,
      color: const Color(0xFF2B302B),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RepaintBoundary(child: widget.data.preview),
      ),
    );
    final details = Padding(
      padding: EdgeInsets.all(widget.compact ? 24 : 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PROJECT  ${widget.number.toString().padLeft(2, '0')}',
            style: GoogleFonts.spaceMono(color: _accent, fontSize: 12, letterSpacing: 1.2)),
          const SizedBox(height: 17),
          Text(widget.data.title, style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: widget.compact ? 27 : 37,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.3,
          )),
          const SizedBox(height: 12),
          Text(widget.data.description, style: GoogleFonts.poppins(
            color: _muted, fontSize: widget.compact ? 13 : 14, height: 1.7)),
          const SizedBox(height: 25),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final tool in widget.data.tools)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(border: Border.all(color: _rule)),
                child: Text(tool, style: GoogleFonts.spaceMono(
                  color: _muted, fontSize: 12)),
              ),
          ]),
          const SizedBox(height: 25),
          Row(mainAxisSize: MainAxisSize.min, children: [
            Text('TAP IMAGE TO OPEN', style: GoogleFonts.spaceMono(
              color: _accent, fontSize: 12, letterSpacing: .6)),
            const SizedBox(width: 9),
            const Icon(Icons.arrow_outward_rounded, size: 16, color: _accent),
          ]),
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: _surface,
          border: Border.all(color: _hovered ? _accent : _rule),
          boxShadow: _hovered
            ? [BoxShadow(color: _accent.withValues(alpha: .08), blurRadius: 25)]
            : null,
        ),
        child: widget.compact
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [preview, details])
          : Row(children: widget.imageOnLeft
              ? [Expanded(child: preview), Expanded(child: details)]
              : [Expanded(child: details), Expanded(child: preview)]),
      ),
    );
  }
}
