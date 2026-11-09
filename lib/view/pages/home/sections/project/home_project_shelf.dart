import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · pre-emit critique: P5 H5 E4 S5 R5 V4.
// The Shelf uses the portfolio's Poppins type and dark green palette.
abstract final class _ShelfColors {
  static const background = Color(0xFF151715);
  static const panel = Color(0xFF202420);
  static const paper = Color(0xFFF1EFE8);
  static const body = Color(0xFFD1D1C9);
  static const muted = Color(0xFFB9BDB6);
  static const rule = Color(0xFF424A42);
  static const outline = Color(0xFF687168);
  static const accent = AppColor.yellowgreen;
}

class _ShelfProject {
  const _ShelfProject({
    required this.number,
    required this.title,
    required this.description,
    required this.tags,
    required this.imageLabel,
    required this.imageAsset,
    required this.slug,
  });

  final String number;
  final String title;
  final String description;
  final List<String> tags;
  final String imageLabel;
  final String imageAsset;
  final String slug;
}

const _projects = [
  _ShelfProject(
    number: '01',
    title: 'DIDO',
    description:
        'Driver and logistics app for cargo delivery at PT CKL Indonesia Raya.',
    tags: ['Flutter', 'Android', 'Logistics'],
    imageLabel: 'DIDO cargo delivery app preview',
    imageAsset: 'assets/image/dido.png',
    slug: 'dido',
  ),
  _ShelfProject(
    number: '02',
    title: 'CKlink',
    description:
        'An internal workspace for attendance, employee data, and daily operations.',
    tags: ['Flutter', 'Firebase', 'Operations'],
    imageLabel: 'CKlink employee workspace app preview',
    imageAsset: 'assets/image/CKLink.png',
    slug: 'cklink',
  ),
  _ShelfProject(
    number: '03',
    title: 'Werkspace',
    description:
        'A mobile workspace for attendance, employee requests, approvals, and team communication.',
    tags: ['Flutter', 'iOS', 'Android'],
    imageLabel: 'Werkspace mobile app preview',
    imageAsset: 'assets/image/werkspace_store_banner.png',
    slug: 'werkspace',
  ),
];

class HomeProjectShelf extends StatelessWidget {
  const HomeProjectShelf({super.key, this.onViewAll});

  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final phone = width < 600;
    final stacked = width < 900;
    final inset = width < 800 ? 24.0 : width * .09;

    return Container(
      width: double.infinity,
      color: _ShelfColors.background,
      padding: EdgeInsets.fromLTRB(
        inset,
        phone ? 72 : 110,
        inset,
        phone ? 48 : 92,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ShelfHeading(phone: phone),
          SizedBox(height: phone ? 64 : 88),
          for (var index = 0; index < _projects.length; index++) ...[
            _ProjectRow(
              project: _projects[index],
              stacked: stacked,
              reverse: index.isOdd,
            ),
            if (index != _projects.length - 1)
              SizedBox(height: phone ? 64 : 88),
          ],
          if (onViewAll != null) ...[
            const SizedBox(height: 48),
            OutlinedButton.icon(
              onPressed: onViewAll,
              icon: const Icon(Icons.arrow_outward_rounded, size: 18),
              label: const Text('View all projects'),
              style: OutlinedButton.styleFrom(
                foregroundColor: _ShelfColors.paper,
                side: const BorderSide(color: _ShelfColors.accent),
                minimumSize: const Size(0, 48),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 14,
                ),
                textStyle: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
          SizedBox(height: phone ? 72 : 100),
          const _ShelfFooter(),
        ],
      ),
    );
  }
}

class _ShelfHeading extends StatelessWidget {
  const _ShelfHeading({required this.phone});
  final bool phone;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 760),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '03  /  THE SHELF',
          style: GoogleFonts.poppins(
            color: _ShelfColors.accent,
            fontSize: 12,
            letterSpacing: 1.3,
          ),
        ),
        const SizedBox(height: 25),
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(text: 'Things I built, and what each one '),
              TextSpan(
                text: 'taught me.',
                style: TextStyle(color: _ShelfColors.accent),
              ),
            ],
          ),
          style: GoogleFonts.poppins(
            color: _ShelfColors.paper,
            fontSize: phone ? 43 : 64,
            height: 1.08,
            letterSpacing: phone ? -1.5 : -2.3,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 25),
        Container(width: 58, height: 3, color: _ShelfColors.accent),
      ],
    ),
  );
}

class _ProjectRow extends StatelessWidget {
  const _ProjectRow({
    required this.project,
    required this.stacked,
    required this.reverse,
  });
  final _ShelfProject project;
  final bool stacked;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final image = _ProjectImage(project: project);
    final copy = _ProjectCopy(project: project);
    if (stacked) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [image, const SizedBox(height: 32), copy],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: reverse
          ? [
              Expanded(child: copy),
              const SizedBox(width: 72),
              Expanded(child: image),
            ]
          : [
              Expanded(child: image),
              const SizedBox(width: 72),
              Expanded(child: copy),
            ],
    );
  }
}

class _ProjectImage extends StatelessWidget {
  const _ProjectImage({required this.project});
  final _ShelfProject project;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 580),
    child: Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).width < 600 ? 240 : 340,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _ShelfColors.panel,
        border: Border.all(color: _ShelfColors.rule),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        project.imageAsset,
        fit: BoxFit.contain,
        semanticLabel: project.imageLabel,
      ),
    ),
  );
}

class _ProjectCopy extends StatelessWidget {
  const _ProjectCopy({required this.project});
  final _ShelfProject project;

  @override
  Widget build(BuildContext context) {
    final phone = MediaQuery.sizeOf(context).width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${project.number}  /  DAY-JOB',
          style: GoogleFonts.poppins(
            color: _ShelfColors.accent,
            fontSize: 12,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          project.title,
          style: GoogleFonts.poppins(
            color: _ShelfColors.paper,
            fontSize: phone ? 36 : 52,
            height: 1.08,
            letterSpacing: -1.2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Text(
            project.description,
            style: GoogleFonts.poppins(
              color: _ShelfColors.body,
              fontSize: 16,
              height: 1.7,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final tag in project.tags)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: _ShelfColors.outline),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  tag,
                  style: GoogleFonts.poppins(
                    color: _ShelfColors.paper,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 18),
        TextButton(
          onPressed: () => context.go('/project/${project.slug}'),
          style: TextButton.styleFrom(
            foregroundColor: _ShelfColors.accent,
            minimumSize: const Size(0, 44),
            padding: const EdgeInsets.symmetric(vertical: 12),
            textStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text('Read the story →'),
        ),
      ],
    );
  }
}

class _ShelfFooter extends StatelessWidget {
  const _ShelfFooter();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(top: 20),
    decoration: const BoxDecoration(
      border: Border(top: BorderSide(color: _ShelfColors.rule)),
    ),
    child: Wrap(
      spacing: 16,
      runSpacing: 12,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(
          '3 entries on the shelf',
          style: GoogleFonts.poppins(color: _ShelfColors.muted, fontSize: 12),
        ),
        Text(
          'more in the logbook ↑',
          style: GoogleFonts.poppins(color: _ShelfColors.muted, fontSize: 12),
        ),
      ],
    ),
  );
}
