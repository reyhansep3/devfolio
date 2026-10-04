import 'package:flutter/material.dart';
import 'package:flutter_portofolio/animation/preview_cklink.dart';
import 'package:flutter_portofolio/animation/preview_deltaspa.dart';
import 'package:flutter_portofolio/animation/preview_dido.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeProjectShowcase extends StatelessWidget {
  const HomeProjectShowcase({super.key, this.onViewAll});

  final VoidCallback? onViewAll;

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
  ];

  @override
  Widget build(BuildContext context) {
    return _HomeProjects(projects: _projects, onViewAll: onViewAll);
  }
}

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _homeInk = Color(0xFF151715);
const _homeSurface = Color(0xFF202420);
const _homeRule = Color(0xFF424A42);
const _homeMuted = Color(0xFFB9BDB6);
const _homeAccent = AppColor.yellowgreen;

class _HomeProjects extends StatelessWidget {
  const _HomeProjects({required this.projects, this.onViewAll});

  final List<ProjectShowcaseData> projects;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 800;
    final inset = compact ? 24.0 : width * .09;

    return Container(
      width: double.infinity,
      color: _homeInk,
      padding: EdgeInsets.fromLTRB(inset, compact ? 76 : 110, inset, compact ? 82 : 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrollReveal(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('03  /  SELECTED WORK', style: GoogleFonts.spaceMono(
                  color: _homeAccent, fontSize: 12, letterSpacing: 1.3)),
                const SizedBox(height: 25),
                Text('Work made for\nthe real world.', style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: compact ? 43 : 64,
                  fontWeight: FontWeight.w700,
                  height: 1.08,
                  letterSpacing: -2.3,
                )),
                const SizedBox(height: 25),
                Container(width: 58, height: 3, color: _homeAccent),
                const SizedBox(height: 25),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 550),
                  child: Text(
                    'Mobile products shaped around clear interfaces, reliable workflows, and code built to last.',
                    style: GoogleFonts.poppins(
                      color: _homeMuted, fontSize: compact ? 14 : 16, height: 1.75),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: compact ? 44 : 64),
          for (var index = 0; index < projects.length; index++) ...[
            ScrollReveal(
              fromLeft: index.isEven,
              child: _HomeProjectRow(
                data: projects[index],
                number: index + 1,
                compact: compact,
                imageOnLeft: index.isEven,
              ),
            ),
            if (index != projects.length - 1)
              SizedBox(height: compact ? 18 : 24),
          ],
          if (onViewAll != null) ...[
            SizedBox(height: compact ? 36 : 48),
            OutlinedButton.icon(
              onPressed: onViewAll,
              icon: const Icon(Icons.arrow_outward_rounded, size: 18),
              label: const Text('View all projects'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: _homeAccent),
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _HomeProjectRow extends StatefulWidget {
  const _HomeProjectRow({
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
  State<_HomeProjectRow> createState() => _HomeProjectRowState();
}

class _HomeProjectRowState extends State<_HomeProjectRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final preview = Container(
      width: double.infinity,
      height: widget.compact ? 205 : 300,
      color: const Color(0xFF2B302B),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: RepaintBoundary(child: widget.data.preview),
      ),
    );
    final details = Padding(
      padding: EdgeInsets.all(widget.compact ? 24 : 42),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('PROJECT  ${widget.number.toString().padLeft(2, '0')}',
              style: GoogleFonts.spaceMono(
                color: _homeAccent, fontSize: 12, letterSpacing: 1.2)),
          const SizedBox(height: 18),
          Text(widget.data.title, style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: widget.compact ? 27 : 37,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.3,
          )),
          const SizedBox(height: 13),
          Text(widget.data.description, style: GoogleFonts.poppins(
            color: _homeMuted, fontSize: widget.compact ? 13 : 14, height: 1.7)),
          const SizedBox(height: 26),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: widget.data.tools.map((tool) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(border: Border.all(color: _homeRule)),
              child: Text(tool, style: GoogleFonts.spaceMono(
                color: _homeMuted, fontSize: 12)),
            )).toList(),
          ),
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
          color: _homeSurface,
          border: Border.all(color: _hovered ? _homeAccent : _homeRule),
        ),
        child: widget.compact
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              preview,
              details,
            ])
          : Row(children: widget.imageOnLeft
              ? [Expanded(flex: 5, child: preview), Expanded(flex: 5, child: details)]
              : [Expanded(flex: 5, child: details), Expanded(flex: 5, child: preview)]),
      ),
    );
  }
}

class ProjectShowcase extends StatelessWidget {
  const ProjectShowcase({
    super.key,
    required this.projects,
    required this.eyebrow,
    required this.title,
    required this.description,
    this.onViewAll,
  });

  final List<ProjectShowcaseData> projects;
  final String eyebrow;
  final String title;
  final String description;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 800;
    final horizontalPadding = (width * (compact ? 0.07 : 0.12))
        .clamp(24.0, 180.0)
        .toDouble();

    return Container(
      color: AppColor.primary,
      padding: EdgeInsets.fromLTRB(horizontalPadding, 72, horizontalPadding, 88),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrollReveal(
            child: _SectionHeading(
              compact: compact,
              eyebrow: eyebrow,
              title: title,
              description: description,
            ),
          ),
          const SizedBox(height: 36),
          for (var index = 0; index < projects.length; index++) ...[
            ScrollReveal(
              fromLeft: index.isEven,
              child: _ProjectFeatureCard(
                data: projects[index],
                compact: compact,
                imageOnLeft: index.isEven,
              ),
            ),
            if (index != projects.length - 1) const SizedBox(height: 24),
          ],
          if (onViewAll != null) ...[
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.center,
              child: _ViewAllButton(onPressed: onViewAll),
            ),
          ],
        ],
      ),
    );
  }
}

class _SectionHeading extends StatelessWidget {
  const _SectionHeading({
    required this.compact,
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  final bool compact;
  final String eyebrow;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(compact ? 24 : 32),
      decoration: BoxDecoration(
        color: AppColor.pureWhite,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A313948),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppColor.yellowgreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              eyebrow,
              style: AppFontStyle.vcrMonoSmall.copyWith(
                color: AppColor.darkUI,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            title,
            style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
              color: AppColor.darkUI,
              fontSize: compact ? 32 : 42,
              height: 1.05,
            ),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              description,
              style: AppFontStyle.poppinsBodyMedium.copyWith(
                color: AppColor.darkGray,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectFeatureCard extends StatefulWidget {
  const _ProjectFeatureCard({
    required this.data,
    required this.compact,
    required this.imageOnLeft,
  });

  final ProjectShowcaseData data;
  final bool compact;
  final bool imageOnLeft;

  @override
  State<_ProjectFeatureCard> createState() => _ProjectFeatureCardState();
}

class _ProjectFeatureCardState extends State<_ProjectFeatureCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final details = _ProjectDetails(data: widget.data, compact: widget.compact);
    final preview = SizedBox(
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: RepaintBoundary(child: widget.data.preview),
      ),
    );
    final content = widget.compact
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: preview),
              const SizedBox(height: 24),
              details,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.imageOnLeft
                ? [Expanded(child: preview), const SizedBox(width: 36), Expanded(child: details)]
                : [Expanded(child: details), const SizedBox(width: 36), Expanded(child: preview)],
          );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: EdgeInsets.all(widget.compact ? 22 : 32),
        decoration: BoxDecoration(
          color: AppColor.pureWhite,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? AppColor.yellowgreen : const Color(0x18313948),
            width: _hovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF313948).withValues(alpha: _hovered ? 0.18 : 0.10),
              blurRadius: _hovered ? 30 : 18,
              offset: Offset(0, _hovered ? 16 : 9),
            ),
          ],
        ),
        child: content,
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.data, required this.compact});

  final ProjectShowcaseData data;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.title,
          style: AppFontStyle.vcrMonoHeadingSmall.copyWith(
            color: AppColor.darkUI,
            fontSize: compact ? 26 : 30,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          data.description,
          style: AppFontStyle.poppinsBodySmall.copyWith(
            color: AppColor.darkGray,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'TOOLS',
          style: AppFontStyle.vcrMonoSmall.copyWith(
            color: AppColor.darkUI,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: data.tools
              .map(
                (tool) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0x10313948),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tool,
                    style: AppFontStyle.poppinsBodySmall.copyWith(
                      color: AppColor.darkUI,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class _ViewAllButton extends StatefulWidget {
  const _ViewAllButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<_ViewAllButton> createState() => _ViewAllButtonState();
}

class _ViewAllButtonState extends State<_ViewAllButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(_hovered ? 4 : 0, 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: _hovered ? AppColor.yellowgreen : AppColor.darkUI,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'VIEW ALL PROJECTS',
                style: AppFontStyle.vcrMonoSmall.copyWith(
                  color: _hovered ? AppColor.darkUI : AppColor.pureWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_outward_rounded,
                size: 18,
                color: _hovered ? AppColor.darkUI : AppColor.pureWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectShowcaseData {
  const ProjectShowcaseData({
    required this.title,
    required this.description,
    required this.tools,
    required this.preview,
  });

  final String title;
  final String description;
  final List<String> tools;
  final Widget preview;
}
