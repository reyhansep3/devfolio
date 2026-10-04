import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

// Hallmark · pre-emit critique: P4 H4 E4 S5 R4 V4
const _ink = Color(0xFF151715);
const _paper = Color(0xFFF0F0EB);
const _surface = Color(0xFF202420);
const _body = Color(0xFF515850);
const _muted = Color(0xFFB9BDB6);
const _rule = Color(0xFFB9BDB6);
const _accent = AppColor.yellowgreen;

class BlogDetailPage extends StatefulWidget {
  const BlogDetailPage({super.key, required this.blog});

  final Map<String, dynamic> blog;

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  final ScrollController _scrollController = ScrollController();
  late final List<_SectionEntry> _entries;
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _entries = _parseEntries();
    _scrollController.addListener(_handleScroll);
  }

  List<_SectionEntry> _parseEntries() {
    final raw = widget.blog['sections'];
    if (raw is! List) return [];
    final sections = raw.whereType<Map>().map((item) =>
      BlogSection.fromJson(Map<String, dynamic>.from(item))).toList();
    final entries = <_SectionEntry>[];
    var mainSectionNumber = 0;

    void add(List<BlogSection> items, int level) {
      for (final section in items) {
        if (level == 1) mainSectionNumber++;
        entries.add(_SectionEntry(
          section: section,
          level: level,
          key: GlobalKey(),
          index: entries.length,
          displayNumber: mainSectionNumber,
        ));
        if (section.children.isNotEmpty) add(section.children, level + 1);
      }
    }

    add(sections, 1);
    return entries;
  }

  void _handleScroll() {
    var active = 0;
    for (final entry in _entries) {
      final renderObject = entry.key.currentContext?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;
      if (renderObject.localToGlobal(Offset.zero).dy <= 220) active = entry.index;
    }
    if (active != _activeIndex && mounted) setState(() => _activeIndex = active);
  }

  void _scrollTo(_SectionEntry entry) {
    final target = entry.key.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(target,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOutCubic,
      alignment: .06);
    setState(() => _activeIndex = entry.index);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
      backgroundColor: _paper,
      appBar: AppBar(
        backgroundColor: _ink,
        foregroundColor: Colors.white,
        leading: IconButton(
          tooltip: 'Back to writing',
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text('DEV / NOTES', style: GoogleFonts.spaceMono(
          color: _accent, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final compact = constraints.maxWidth < 1000;
        if (compact) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [_hero(true), _article(true)]),
          );
        }
        return Row(children: [
          Expanded(child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(children: [_hero(false), _article(false)]),
          )),
          SizedBox(
            width: 280,
            height: constraints.maxHeight,
            child: ColoredBox(
              color: _surface,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(25, 38, 25, 40),
                child: _tableOfContents(dark: true),
              ),
            ),
          ),
        ]);
      }),
      ),
    );
  }

  Widget _hero(bool compact) => Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: compact ? 360 : 460),
    decoration: const BoxDecoration(
      color: _ink,
      image: DecorationImage(
        image: AssetImage('assets/image/blog_background.png'),
        fit: BoxFit.cover,
        opacity: .28,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: compact ? 24 : 64, vertical: compact ? 55 : 80),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('FIELD NOTE  /  REYHAN SEPTRI ASTA', style: GoogleFonts.spaceMono(
        color: _accent, fontSize: 12, letterSpacing: 1.2)),
      const SizedBox(height: 24),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760),
        child: Text(widget.blog['title']?.toString() ?? 'Untitled', style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: compact ? 42 : 65,
          fontWeight: FontWeight.w700,
          height: 1.08,
          letterSpacing: -2.2,
        )),
      ),
      const SizedBox(height: 22),
      Container(width: 58, height: 3, color: _accent),
      const SizedBox(height: 22),
      ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 650),
        child: Text(widget.blog['subtitle']?.toString() ?? '', style: GoogleFonts.poppins(
          color: _muted, fontSize: compact ? 14 : 17, height: 1.65)),
      ),
    ]),
  );

  Widget _article(bool compact) => Container(
    width: double.infinity,
    color: _paper,
    padding: EdgeInsets.fromLTRB(compact ? 24 : 64, compact ? 45 : 75,
      compact ? 24 : 64, compact ? 88 : 110),
    child: Center(child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 780),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (compact && _entries.isNotEmpty) ...[
          Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent), child:
            ExpansionTile(
              tilePadding: EdgeInsets.zero,
              title: Text('IN THIS ARTICLE', style: GoogleFonts.spaceMono(
                color: _ink, fontSize: 12, letterSpacing: 1.1)),
              children: [for (final entry in _entries) _tocItem(entry, dark: false)],
            )),
          const SizedBox(height: 32),
        ],
        if (_entries.isEmpty)
          Text('No content available.', style: GoogleFonts.poppins(color: _body)),
        for (final entry in _entries) _section(entry, compact),
        const SizedBox(height: 55),
        OutlinedButton.icon(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_rounded, size: 18),
          label: const Text('Back to writing'),
          style: OutlinedButton.styleFrom(
            foregroundColor: _ink,
            side: const BorderSide(color: _ink),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            textStyle: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ]),
    )),
  );

  Widget _section(_SectionEntry entry, bool compact) {
    final section = entry.section;
    final main = entry.level == 1;
    return Container(
      key: entry.key,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(main ? 0 : (compact ? 12 : 22), main ? 55 : 28, 0, 0),
      padding: EdgeInsets.only(left: main ? 0 : 20, top: main ? 25 : 0),
      decoration: BoxDecoration(border: Border(
        top: main ? const BorderSide(color: _rule) : BorderSide.none,
        left: main ? BorderSide.none : const BorderSide(color: _rule),
      )),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (main) ...[
          Text('SECTION  ${entry.displayNumber.toString().padLeft(2, '0')}',
            style: GoogleFonts.spaceMono(color: _body, fontSize: 12, letterSpacing: 1.2)),
          const SizedBox(height: 15),
        ],
        Text(section.title, style: GoogleFonts.poppins(
          color: _ink,
          fontSize: main ? (compact ? 28 : 34) : (compact ? 20 : 23),
          fontWeight: FontWeight.w700,
          height: 1.25,
          letterSpacing: main ? -.9 : -.4,
        )),
        const SizedBox(height: 16),
        if (section.question != null && section.question!.trim().isNotEmpty)
          _question(section.question!),
        if (section.content.trim().isNotEmpty) _paragraph(section.content),
        if (section.comparison != null) _comparison(section.comparison!),
        if (section.result != null) _result(section.result!),
        if (section.resultsText != null && section.resultsText!.trim().isNotEmpty)
          Padding(padding: const EdgeInsets.only(top: 20), child: _paragraph(section.resultsText!)),
        if (section.keyTakeaway != null && section.keyTakeaway!.trim().isNotEmpty)
          _takeaway(section.keyTakeaway!),
        if (section.finalTakeaway != null && section.finalTakeaway!.trim().isNotEmpty)
          _takeaway(section.finalTakeaway!),
      ]),
    );
  }

  Widget _paragraph(String text) => Text(text, style: GoogleFonts.poppins(
    color: _body, fontSize: 15, height: 1.85));

  Widget _question(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: Color(0xFFE4E9D9),
      border: Border(left: BorderSide(color: _ink, width: 3)),
    ),
    child: Text(text, style: GoogleFonts.poppins(
      color: _ink, fontSize: 16, height: 1.6, fontWeight: FontWeight.w600)),
  );

  Widget _comparison(Map<String, dynamic> data) => Padding(
    padding: const EdgeInsets.only(top: 27),
    child: LayoutBuilder(builder: (context, constraints) {
      final before = _comparisonPanel('BEFORE', data['before']?.toString() ?? '');
      final after = _comparisonPanel('AFTER', data['after']?.toString() ?? '');
      return constraints.maxWidth < 620
        ? Column(children: [before, const SizedBox(height: 12), after])
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: before), const SizedBox(width: 12), Expanded(child: after),
          ]);
    }),
  );

  Widget _comparisonPanel(String label, String text) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(color: Colors.white, border: Border.all(color: _rule)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: GoogleFonts.spaceMono(color: _body, fontSize: 12, letterSpacing: 1.1)),
      const SizedBox(height: 13),
      Text(text, style: GoogleFonts.poppins(color: _body, fontSize: 13, height: 1.7)),
    ]),
  );

  Widget _result(Map<String, dynamic> data) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 24),
    padding: const EdgeInsets.all(22),
    decoration: const BoxDecoration(color: _ink),
    child: LayoutBuilder(builder: (context, constraints) {
      final values = [
        _resultValue('BEFORE', data['before_size']?.toString() ?? '—'),
        _resultValue('AFTER', data['after_size']?.toString() ?? '—'),
        _resultValue('REDUCTION', data['reduction']?.toString() ?? '—'),
      ];
      return constraints.maxWidth < 500
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            for (var i = 0; i < values.length; i++) ...[
              values[i], if (i != values.length - 1) const SizedBox(height: 20),
            ],
          ])
        : Row(children: [for (final value in values) Expanded(child: value)]);
    }),
  );

  Widget _resultValue(String label, String value) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: GoogleFonts.spaceMono(color: _accent, fontSize: 12, letterSpacing: 1.1)),
      const SizedBox(height: 8),
      Text(value, style: GoogleFonts.poppins(color: Colors.white,
        fontSize: 22, fontWeight: FontWeight.w700)),
    ],
  );

  Widget _takeaway(String text) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 25),
    padding: const EdgeInsets.all(20),
    decoration: const BoxDecoration(
      color: _surface,
      border: Border(left: BorderSide(color: _accent, width: 3)),
    ),
    child: Text(text, style: GoogleFonts.poppins(color: Colors.white,
      fontSize: 14, height: 1.75)),
  );

  Widget _tableOfContents({required bool dark}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('ON THIS PAGE', style: GoogleFonts.spaceMono(
        color: dark ? _accent : _ink, fontSize: 12, letterSpacing: 1.2)),
      const SizedBox(height: 19),
      for (final entry in _entries) _tocItem(entry, dark: dark),
    ],
  );

  Widget _tocItem(_SectionEntry entry, {required bool dark}) {
    final active = entry.index == _activeIndex;
    return InkWell(
      onTap: () => _scrollTo(entry),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10 + (entry.level - 1) * 12, 10, 4, 10),
        decoration: BoxDecoration(border: Border(left: BorderSide(
          color: active ? _accent : Colors.transparent, width: 2))),
        child: Text(entry.section.title, maxLines: 2, overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
            color: active ? (dark ? Colors.white : _ink) : (dark ? _muted : _body),
            fontSize: entry.level == 1 ? 13 : 12,
            fontWeight: active ? FontWeight.w600 : FontWeight.w400,
            height: 1.4,
          )),
      ),
    );
  }
}

class _SectionEntry {
  const _SectionEntry({
    required this.section,
    required this.level,
    required this.key,
    required this.index,
    required this.displayNumber,
  });

  final BlogSection section;
  final int level;
  final GlobalKey key;
  final int index;
  final int displayNumber;
}

class BlogSection {
  final String type;
  final String title;
  final String content;

  final String? question;

  final Map<String, dynamic>? comparison;

  final Map<String, dynamic>? result;

  final String? resultsText;

  final String? keyTakeaway;

  final String? finalTakeaway;

  final List<BlogSection> children;

  BlogSection({
    required this.type,
    required this.title,
    required this.content,
    this.question,
    this.comparison,
    this.result,
    this.resultsText,
    this.keyTakeaway,
    this.finalTakeaway,
    this.children = const [],
  });

  factory BlogSection.fromJson(
    Map<String, dynamic> json,
  ) {
    final rawChildren = json['sections'];

    final List<BlogSection> children = [];

    if (rawChildren is List) {
      for (final item in rawChildren) {
        if (item is Map) {
          children.add(
            BlogSection.fromJson(
              Map<String, dynamic>.from(item),
            ),
          );
        }
      }
    }

    Map<String, dynamic>? comparison;

    if (json['comparison'] is Map) {
      comparison = Map<String, dynamic>.from(
        json['comparison'] as Map,
      );
    }

    Map<String, dynamic>? result;

    if (json['result'] is Map) {
      result = Map<String, dynamic>.from(
        json['result'] as Map,
      );
    }

    return BlogSection(
      type: json['type']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      content: json['content']?.toString() ?? '',
      question: json['question']?.toString(),
      comparison: comparison,
      result: result,
      resultsText: json['results_text']?.toString(),
      keyTakeaway: json['key_takeaway']?.toString(),
      finalTakeaway: json['final_takeaway']?.toString(),
      children: children,
    );
  }
}
