import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/projects/project_data.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _muted = Color(0xFFB9BDB6);
const _body = Color(0xFF515850);
const _accent = AppColor.yellowgreen;

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.project});

  final ProjectShowcaseData project;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        backgroundColor: _paper,
        appBar: AppBar(
          backgroundColor: _ink,
          foregroundColor: Colors.white,
          leading: IconButton(
            tooltip: 'Back to projects',
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () => context.go('/project'),
          ),
          title: Text(
            'DEV / PROJECTS',
            style: GoogleFonts.spaceMono(
              color: _accent,
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 800;
            final inset = compact
                ? 24.0
                : (constraints.maxWidth * .09).clamp(64.0, 160.0);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: _ink,
                    padding: EdgeInsets.fromLTRB(
                      inset,
                      compact ? 62 : 95,
                      inset,
                      compact ? 60 : 90,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1220),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PROJECT DETAIL  /  REYHAN SEPTRI ASTA',
                              style: GoogleFonts.spaceMono(
                                color: _accent,
                                fontSize: 12,
                                letterSpacing: 1.2,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              project.title,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: compact ? 44 : 76,
                                fontWeight: FontWeight.w700,
                                height: 1.08,
                                letterSpacing: -2.5,
                              ),
                            ),
                            const SizedBox(height: 20),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 720),
                              child: Text(
                                project.description,
                                style: GoogleFonts.poppins(
                                  color: _muted,
                                  fontSize: compact ? 15 : 19,
                                  height: 1.65,
                                ),
                              ),
                            ),
                            const SizedBox(height: 36),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: AspectRatio(
                                aspectRatio: compact ? 1.6 : 2.4,
                                child: Image.asset(
                                  project.imageAsset,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(
                      inset,
                      compact ? 58 : 90,
                      inset,
                      compact ? 85 : 110,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1220),
                        child: compact
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _story(),
                                  const SizedBox(height: 52),
                                  _facts(context),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(flex: 6, child: _story()),
                                  const SizedBox(width: 90),
                                  Expanded(flex: 4, child: _facts(context)),
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _story() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _eyebrow('01  /  ABOUT THE APP'),
      const SizedBox(height: 19),
      Text(
        'What is ${project.title}?',
        style: GoogleFonts.poppins(
          color: _ink,
          fontSize: 34,
          fontWeight: FontWeight.w700,
          height: 1.2,
          letterSpacing: -1,
        ),
      ),
      const SizedBox(height: 20),
      Text(
        project.overview,
        style: GoogleFonts.poppins(color: _body, fontSize: 16, height: 1.85),
      ),
      const SizedBox(height: 52),
      _eyebrow('02  /  WHAT IT DOES'),
      const SizedBox(height: 20),
      for (final highlight in project.highlights)
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 7),
                child: Icon(Icons.arrow_outward_rounded, color: _ink, size: 18),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  highlight,
                  style: GoogleFonts.poppins(
                    color: _body,
                    fontSize: 15,
                    height: 1.65,
                  ),
                ),
              ),
            ],
          ),
        ),
    ],
  );

  Widget _facts(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(28),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFBBC1B8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _eyebrow('03  /  BUILT WITH'),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final tool in project.tools)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFBBC1B8)),
                ),
                child: Text(
                  tool,
                  style: GoogleFonts.spaceMono(color: _ink, fontSize: 12),
                ),
              ),
          ],
        ),
        const SizedBox(height: 30),
        TextButton.icon(
          onPressed: () => launchUrl(
            Uri.parse(project.link),
            mode: LaunchMode.externalApplication,
          ),
          icon: const Icon(Icons.arrow_outward_rounded, size: 18),
          label: Text(project.linkLabel),
          style: TextButton.styleFrom(
            backgroundColor: _ink,
            foregroundColor: _accent,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        if (project.secondaryLink case final String secondaryLink) ...[
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: () => launchUrl(
              Uri.parse(secondaryLink),
              mode: LaunchMode.externalApplication,
            ),
            icon: const Icon(Icons.arrow_outward_rounded, size: 18),
            label: Text(project.secondaryLinkLabel ?? 'View app'),
            style: TextButton.styleFrom(
              foregroundColor: _ink,
              side: const BorderSide(color: _ink),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
        const SizedBox(height: 14),
        TextButton.icon(
          onPressed: () => context.go('/project'),
          icon: const Icon(Icons.arrow_back_rounded, size: 17),
          label: const Text('All projects'),
          style: TextButton.styleFrom(
            foregroundColor: _ink,
            textStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _eyebrow(String label) => Text(
    label,
    style: GoogleFonts.spaceMono(
      color: _body,
      fontSize: 12,
      letterSpacing: 1.2,
    ),
  );
}
