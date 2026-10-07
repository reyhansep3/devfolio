import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';
import 'package:flutter_portofolio/data/datasource/experience_local_datasource.dart';
import 'package:flutter_portofolio/data/datasource/model/experience_model.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/skills_expertise/utils/skill_category.dart';
import 'package:flutter_portofolio/view/pages/formalities/widgets/image_position.dart';
import 'package:google_fonts/google_fonts.dart';

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _surface = Color(0xFF202420);
const _muted = Color(0xFFB9BDB6);
const _body = Color(0xFF515850);
const _rule = Color(0xFF424A42);
const _lightRule = Color(0xFFB9BDB6);
const _accent = AppColor.yellowgreen;

const formalitiesCategories = <SkillCategory>[
  SkillCategory(
    title: 'Web Development',
    description: 'Building modern, responsive web applications',
    icon: Icons.code_rounded,
    technologies: ['React', 'TypeScript', 'JavaScript', 'Laravel', 'HTML', 'CSS', 'TailwindCSS', 'Bootstrap', 'Firebase'],
  ),
  SkillCategory(
    title: 'Backend & API',
    description: 'Creating robust and scalable backend services',
    icon: Icons.polyline_rounded,
    technologies: ['Golang', 'Laravel', 'REST API', 'MySQL', 'PostgreSQL', 'Firebase'],
  ),
  SkillCategory(
    title: 'Mobile Development',
    description: 'Cross-platform mobile app development',
    icon: Icons.phone_android_rounded,
    technologies: ['Flutter', 'React Native', 'Dart', 'Firebase', 'REST API', 'BLoC', 'Provider'],
  ),
];

const _infrastructureTools = [
  'Netlify', 'Figma', 'Git', 'Github', 'Gitlab', 'Insomnia', 'Postman', 'Firebase', 'Docker',
];

double _inset(double width) => width < 800 ? 24 : width * .09;

Widget formalitiesHero(BuildContext context, double width, double height) {
  final compact = width < 800;
  // Desktop/tablet navbar overlays the page. Mobile uses a Scaffold AppBar,
  // so its visible body starts below the status bar and toolbar.
  final viewportHeight = compact
      ? height - MediaQuery.paddingOf(context).top - kToolbarHeight
      : height;
  final image = SizedBox(
    width: double.infinity,
    height: compact ? (width * .88).clamp(265.0, 440.0) : viewportHeight,
    child: Stack(fit: StackFit.expand, children: [
      Image.asset('assets/image/about_picture.jpeg', fit: BoxFit.cover,
        alignment: Alignment.center, semanticLabel: 'Reyhan at work'),
      Container(decoration: BoxDecoration(gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [_ink.withValues(alpha: .08), _ink.withValues(alpha: .48)],
      ))),
      Positioned(right: 18, bottom: 18, child: Text('REYHAN  /  JAKARTA',
        style: GoogleFonts.spaceMono(color: Colors.white, fontSize: 12, letterSpacing: 1.2))),
    ]),
  );
  final copy = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('01  /  ABOUT', style: GoogleFonts.spaceMono(
        color: _accent, fontSize: 12, letterSpacing: 1.3)),
      const SizedBox(height: 26),
      Text('Curiosity drives\nmy work.', style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: compact ? (width * .12).clamp(37.0, 56.0) : (width * .055).clamp(54.0, 78.0),
        fontWeight: FontWeight.w700,
        height: 1.07,
        letterSpacing: -2.6,
      )),
      const SizedBox(height: 27),
      Container(width: 58, height: 3, color: _accent),
      const SizedBox(height: 25),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Text(
          'I’m Reyhan, a mobile developer in Jakarta. I enjoy turning ideas into useful products and working through the details that make them feel effortless.',
          style: GoogleFonts.poppins(color: _muted, fontSize: compact ? 14 : 16, height: 1.75),
        ),
      ),
    ],
  );
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: viewportHeight),
    color: _ink,
    child: compact
      ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FadeInRight(config: BaseAnimationConfig(delay: 160.ms, duration: 750.ms, child: image)),
          Padding(
            padding: EdgeInsets.fromLTRB(_inset(width), 43, _inset(width), 76),
            child: FadeInLeft(config: BaseAnimationConfig(delay: 250.ms, duration: 750.ms, child: copy)),
          ),
        ])
      : Padding(
          padding: EdgeInsets.only(left: _inset(width)),
          child: Row(children: [
            Expanded(flex: 5, child: FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: copy))),
            SizedBox(width: width * .06),
            Expanded(flex: 5, child: FadeInRight(config: BaseAnimationConfig(delay: 160.ms, duration: 750.ms, child: image))),
          ]),
        ),
  );
}

Widget formalitiesStory(BuildContext context, double width, double height) {
  final compact = width < 800;
  final imageWidth = compact
      ? width - 48
      : (width * (width < 1024 ? .35 : .4)).clamp(280.0, 560.0);
  final images = SizedBox(
    width: imageWidth,
    height: imageWidth * 520 / 600,
    child: const FittedBox(
      fit: BoxFit.contain,
      child: ThreeImages(
        image1: 'assets/image/image_1.jpeg',
        image2: 'assets/image/image_2.jpeg',
        image3: 'assets/image/image_3.jpeg',
      ),
    ),
  );
  final copy = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Hey, I’m Reyhan.', style: GoogleFonts.poppins(
        color: _ink, fontSize: compact ? 39 : 56,
        fontWeight: FontWeight.w700, height: 1.08, letterSpacing: -2.1)),
      const SizedBox(height: 24),
      Text('I’m a mobile developer and product enthusiast who enjoys turning ideas into seamless digital experiences. I focus on building products that are functional, intuitive, and enjoyable to use.',
        style: GoogleFonts.poppins(color: _body, fontSize: compact ? 14 : 15, height: 1.8)),
      const SizedBox(height: 18),
      Text('I work across the product lifecycle, from understanding requirements and shaping user flows to building polished, production-ready experiences. I enjoy bringing design and engineering together.',
        style: GoogleFonts.poppins(color: _body, fontSize: compact ? 14 : 15, height: 1.8)),
    ],
  );
  return Container(
    width: double.infinity,
    color: _paper,
    padding: EdgeInsets.symmetric(horizontal: _inset(width), vertical: compact ? 76 : 110),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHead('02  /  WHO I AM', 'The person behind\nthe work.', compact, dark: false),
      SizedBox(height: compact ? 46 : 65),
      compact
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: images)),
            const SizedBox(height: 38),
            FadeInRight(config: BaseAnimationConfig(delay: 150.ms, duration: 750.ms, child: copy)),
          ])
        : Row(children: [
            Expanded(flex: 5, child: FadeInLeft(config: BaseAnimationConfig(duration: 750.ms, child: images))),
            SizedBox(width: width * .05),
            Expanded(flex: 4, child: FadeInRight(config: BaseAnimationConfig(delay: 150.ms, duration: 750.ms, child: copy))),
          ]),
    ]),
  );
}

Widget formalitiesExpertise(BuildContext context, double width, int selectedCategory, ValueChanged<int> onCategoryChanged) {
  final compact = width < 800;
  final category = formalitiesCategories[selectedCategory];
  return Container(
    width: double.infinity,
    color: _ink,
    padding: EdgeInsets.symmetric(horizontal: _inset(width), vertical: compact ? 76 : 110),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHead('03  /  EXPERTISE', 'The tools behind\nthe ideas.', compact, dark: true),
      SizedBox(height: compact ? 44 : 64),
      LayoutBuilder(builder: (context, constraints) {
        final columns = constraints.maxWidth >= 640 ? 3 : (constraints.maxWidth >= 450 ? 2 : 1);
        final cardWidth = (constraints.maxWidth - (columns - 1) * 14) / columns;
        return Wrap(spacing: 14, runSpacing: 14, children: [
          for (var index = 0; index < formalitiesCategories.length; index++)
            SizedBox(width: cardWidth, child: _ExpertiseChoice(
              category: formalitiesCategories[index],
              selected: index == selectedCategory,
              onTap: () => onCategoryChanged(index),
            )),
        ]);
      }),
      const SizedBox(height: 22),
      AnimatedSwitcher(
        duration: const Duration(milliseconds: 260),
        child: Container(
          key: ValueKey(selectedCategory),
          width: double.infinity,
          padding: EdgeInsets.all(compact ? 24 : 32),
          decoration: BoxDecoration(color: _surface, border: Border.all(color: _rule)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('TECHNOLOGY STACK', style: GoogleFonts.spaceMono(
              color: _accent, fontSize: 12, letterSpacing: 1.2)),
            const SizedBox(height: 18),
            Wrap(spacing: 8, runSpacing: 8, children: [
              for (final tool in category.technologies) _toolChip(tool),
            ]),
          ]),
        ),
      ),
      const SizedBox(height: 22),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(compact ? 24 : 32),
        decoration: BoxDecoration(border: Border.all(color: _rule)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('INFRASTRUCTURE & TOOLS', style: GoogleFonts.spaceMono(
            color: _accent, fontSize: 12, letterSpacing: 1.2)),
          const SizedBox(height: 18),
          Wrap(spacing: 8, runSpacing: 8, children: [
            for (final tool in _infrastructureTools) _toolChip(tool),
          ]),
        ]),
      ),
    ]),
  );
}

Widget _toolChip(String tool) => Container(
  padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
  decoration: BoxDecoration(border: Border.all(color: _rule)),
  child: Text(tool, style: GoogleFonts.spaceMono(color: _muted, fontSize: 12)),
);

class _ExpertiseChoice extends StatefulWidget {
  const _ExpertiseChoice({required this.category, required this.selected, required this.onTap});
  final SkillCategory category;
  final bool selected;
  final VoidCallback onTap;

  @override
  State<_ExpertiseChoice> createState() => _ExpertiseChoiceState();
}

class _ExpertiseChoiceState extends State<_ExpertiseChoice> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: widget.onTap,
    onHover: (value) => setState(() => _hovered = value),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOutCubic,
      transform: Matrix4.translationValues(0, _hovered ? -3 : 0, 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: widget.selected
            ? _accent
            : (_hovered ? const Color(0xFF293129) : _surface),
        border: Border.all(
          color: widget.selected || _hovered ? _accent : _rule,
        ),
        boxShadow: _hovered
            ? [BoxShadow(
                color: _accent.withValues(alpha: widget.selected ? .24 : .15),
                blurRadius: 28,
                spreadRadius: 1,
                offset: const Offset(0, 8),
              )]
            : null,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(widget.category.icon, size: 26, color: widget.selected ? _ink : _accent),
        const SizedBox(height: 21),
        Text(widget.category.title, style: GoogleFonts.poppins(
          color: widget.selected ? _ink : Colors.white,
          fontSize: 17, fontWeight: FontWeight.w700)),
        const SizedBox(height: 7),
        Text(widget.category.description, style: GoogleFonts.poppins(
          color: widget.selected ? _ink : _muted, fontSize: 12, height: 1.5)),
      ]),
    ),
  );
}

Widget formalitiesExperience(BuildContext context, double width, ExperienceLocalDatasource data) {
  final compact = width < 800;
  return Container(
    width: double.infinity,
    color: _paper,
    padding: EdgeInsets.symmetric(horizontal: _inset(width), vertical: compact ? 76 : 110),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _sectionHead('04  /  WORK EXPERIENCE', 'Where I’ve put\nit into practice.', compact, dark: false),
      SizedBox(height: compact ? 42 : 64),
      FutureBuilder<List<ExperienceModel>>(
        future: data.getExperience(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Unable to load experience.', style: GoogleFonts.poppins(color: _body));
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator(color: _ink));
          final entries = snapshot.data!;
          return Column(children: [
            for (var index = 0; index < entries.length; index++)
              ScrollReveal(fromLeft: index.isEven, child: _ExperienceEntry(
                experience: entries[index], index: index + 1, compact: compact)),
          ]);
        },
      ),
    ]),
  );
}

class _ExperienceEntry extends StatelessWidget {
  const _ExperienceEntry({required this.experience, required this.index, required this.compact});
  final ExperienceModel experience;
  final int index;
  final bool compact;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: compact ? 28 : 38),
    decoration: const BoxDecoration(border: Border(top: BorderSide(color: _rule))),
    child: compact
      ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _entryNumber(),
          const SizedBox(height: 19),
          _entryContent(),
        ])
      : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(width: 125, child: _entryNumber()),
          Expanded(child: _entryContent()),
        ]),
  );

  Widget _entryNumber() => Text(index.toString().padLeft(2, '0'),
    style: GoogleFonts.spaceMono(color: _body, fontSize: 12, letterSpacing: 1.2));

  Widget _entryContent() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(experience.jobTitle, style: GoogleFonts.poppins(
      color: _ink, fontSize: compact ? 24 : 30, fontWeight: FontWeight.w700,
      height: 1.2, letterSpacing: -.7)),
    const SizedBox(height: 8),
    Text(experience.jobName, style: GoogleFonts.poppins(
      color: _body, fontSize: compact ? 15 : 17, fontWeight: FontWeight.w600)),
    const SizedBox(height: 14),
    Wrap(spacing: 13, runSpacing: 6, children: [
      Text(experience.date.trim(), style: GoogleFonts.spaceMono(color: _body, fontSize: 12)),
      Text(experience.status.toUpperCase(), style: GoogleFonts.spaceMono(color: _body, fontSize: 12)),
    ]),
    const SizedBox(height: 22),
    for (final item in experience.jobExperience)
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(padding: EdgeInsets.only(top: 8, right: 10),
            child: SizedBox(width: 5, height: 5, child: ColoredBox(color: _ink))),
          Expanded(child: Text(item, style: GoogleFonts.poppins(
            color: _body, fontSize: compact ? 12 : 13, height: 1.65))),
        ]),
      ),
    const SizedBox(height: 16),
    Wrap(spacing: 7, runSpacing: 7, children: [
      for (final tool in experience.tools)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(border: Border.all(color: _lightRule)),
          child: Text(tool, style: GoogleFonts.spaceMono(color: _body, fontSize: 11)),
        ),
    ]),
  ]);
}

Widget _sectionHead(String eyebrow, String title, bool compact, {required bool dark}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(eyebrow, style: GoogleFonts.spaceMono(
      color: dark ? _accent : _body, fontSize: 12, letterSpacing: 1.3)),
    const SizedBox(height: 25),
    Text(title, style: GoogleFonts.poppins(
      color: dark ? Colors.white : _ink,
      fontSize: compact ? 43 : 64,
      fontWeight: FontWeight.w700,
      height: 1.08,
      letterSpacing: -2.3,
    )),
    const SizedBox(height: 25),
    Container(width: 58, height: 3, color: dark ? _accent : _ink),
  ],
);
