import 'package:flutter/material.dart';

class BlogDetailPage extends StatefulWidget {
  final Map<String, dynamic> blog;

  const BlogDetailPage({
    super.key,
    required this.blog,
  });

  @override
  State<BlogDetailPage> createState() => _BlogDetailPageState();
}

class _BlogDetailPageState extends State<BlogDetailPage> {
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _headingKeys = [];

  late List<BlogSection> sections;

  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();

    sections = _parseSections();

    _createHeadingKeys();

    _scrollController.addListener(_handleScroll);

    debugPrint('================================');
    debugPrint('BLOG DETAIL');
    debugPrint('Title: ${widget.blog['title']}');
    debugPrint('ID: ${widget.blog['id']}');
    debugPrint(
      'Sections type: ${widget.blog['sections']?.runtimeType}',
    );
    debugPrint('Sections count: ${sections.length}');
    debugPrint('================================');
  }

  // ============================================================
  // PARSE SECTIONS
  // ============================================================

  List<BlogSection> _parseSections() {
    final rawSections = widget.blog['sections'];

    if (rawSections == null) {
      debugPrint('WARNING: blog tidak memiliki key "sections"');
      return [];
    }

    if (rawSections is! List) {
      debugPrint(
        'WARNING: sections bukan List. '
        'Type: ${rawSections.runtimeType}',
      );
      return [];
    }

    return rawSections
        .whereType<Map>()
        .map(
          (item) => BlogSection.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList();
  }

  // ============================================================
  // CREATE HEADING KEYS
  // ============================================================

  void _createHeadingKeys() {
    _headingKeys.clear();

    _addKeysRecursively(sections);
  }

  void _addKeysRecursively(List<BlogSection> items) {
    for (final section in items) {
      _headingKeys.add(GlobalKey());

      if (section.children.isNotEmpty) {
        _addKeysRecursively(section.children);
      }
    }
  }

  // ============================================================
  // FLATTEN SECTIONS
  // ============================================================

  List<_SectionEntry> _flattenSections() {
    final result = <_SectionEntry>[];

    int keyIndex = 0;

    void addSections(
      List<BlogSection> items,
      int level,
    ) {
      for (final section in items) {
        result.add(
          _SectionEntry(
            section: section,
            level: level,
            key: _headingKeys[keyIndex],
            keyIndex: keyIndex,
          ),
        );

        keyIndex++;

        if (section.children.isNotEmpty) {
          addSections(
            section.children,
            level + 1,
          );
        }
      }
    }

    addSections(sections, 1);

    return result;
  }

  // ============================================================
  // SCROLL LISTENER
  // ============================================================

  void _handleScroll() {
    final entries = _flattenSections();

    if (entries.isEmpty) {
      return;
    }

    int activeIndex = 0;

    for (final entry in entries) {
      final context = entry.key.currentContext;

      if (context == null) {
        continue;
      }

      final renderObject = context.findRenderObject();

      if (renderObject is! RenderBox) {
        continue;
      }

      final position = renderObject.localToGlobal(
        Offset.zero,
      );

      if (position.dy <= 180) {
        activeIndex = entry.keyIndex;
      }
    }

    if (activeIndex != _activeIndex && mounted) {
      setState(() {
        _activeIndex = activeIndex;
      });
    }
  }

  // ============================================================
  // SCROLL TO SECTION
  // ============================================================

  void _scrollToSection(int index) {
    if (index < 0 || index >= _headingKeys.length) {
      return;
    }

    final context = _headingKeys[index].currentContext;

    if (context == null) {
      return;
    }

    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );

    setState(() {
      _activeIndex = index;
    });
  }

  // ============================================================
  // DISPOSE
  // ============================================================

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    final title = widget.blog['title']?.toString() ?? 'Blog';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 900;

          if (isWide) {
            return _buildDesktopLayout();
          }

          return _buildMobileLayout();
        },
      ),
    );
  }

  // ============================================================
  // MOBILE
  // ============================================================

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.fromLTRB(
        24,
        24,
        24,
        100,
      ),
      child: _buildContent(),
    );
  }

  // ============================================================
  // DESKTOP
  // ============================================================

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ========================================================
        // CONTENT
        // ========================================================

        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.fromLTRB(
              48,
              32,
              48,
              100,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: _buildContent(),
              ),
            ),
          ),
        ),

        const SizedBox(width: 40),

        // ========================================================
        // TABLE OF CONTENT
        // ========================================================

        SizedBox(
          width: 280,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              right: 32,
            ),
            child: _buildTableOfContents(),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // CONTENT
  // ============================================================

  Widget _buildContent() {
    final entries = _flattenSections();

    if (entries.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Text(
            'No content available',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...entries.map(
          (entry) => _buildSectionWidget(entry),
        ),
      ],
    );
  }

  // ============================================================
  // SECTION WIDGET
  // ============================================================

  Widget _buildSectionWidget(
    _SectionEntry entry,
  ) {
    final section = entry.section;

    if (entry.level == 1) {
      return _buildMainSection(
        section: section,
        key: entry.key,
      );
    }

    return _buildChildSection(
      section: section,
      key: entry.key,
      level: entry.level,
    );
  }

  // ============================================================
  // MAIN SECTION
  // ============================================================

  Widget _buildMainSection({
    required BlogSection section,
    required GlobalKey key,
  }) {
    return Container(
      key: key,
      margin: const EdgeInsets.only(
        bottom: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Text(
            section.title,
            style: const TextStyle(
              fontSize: 30,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          // QUESTION
          if (section.question != null &&
              section.question!.trim().isNotEmpty)
            _buildQuestion(
              section.question!,
            ),

          // CONTENT
          if (section.content.trim().isNotEmpty)
            _buildContentText(
              section.content,
            ),

          // COMPARISON
          if (section.comparison != null)
            _buildComparison(
              section.comparison!,
            ),

          // RESULT
          if (section.result != null)
            _buildResult(
              section.result!,
            ),

          // RESULTS TEXT
          if (section.resultsText != null &&
              section.resultsText!.trim().isNotEmpty)
            _buildResultsText(
              section.resultsText!,
            ),

          // KEY TAKEAWAY
          if (section.keyTakeaway != null &&
              section.keyTakeaway!.trim().isNotEmpty)
            _buildTakeaway(
              section.keyTakeaway!,
            ),

          // FINAL TAKEAWAY
          if (section.finalTakeaway != null &&
              section.finalTakeaway!.trim().isNotEmpty)
            _buildTakeaway(
              section.finalTakeaway!,
            ),
        ],
      ),
    );
  }

  // ============================================================
  // CHILD SECTION
  // ============================================================

  Widget _buildChildSection({
    required BlogSection section,
    required GlobalKey key,
    required int level,
  }) {
    final leftPadding = 20.0 + ((level - 2) * 12);

    return Container(
      key: key,
      margin: EdgeInsets.only(
        left: leftPadding,
        bottom: 36,
      ),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.grey.shade700,
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              fontSize: level == 2 ? 22 : 19,
              height: 1.3,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          if (section.question != null &&
              section.question!.trim().isNotEmpty)
            _buildQuestion(
              section.question!,
            ),

          if (section.content.trim().isNotEmpty)
            _buildContentText(
              section.content,
            ),

          if (section.comparison != null)
            _buildComparison(
              section.comparison!,
            ),

          if (section.result != null)
            _buildResult(
              section.result!,
            ),

          if (section.resultsText != null &&
              section.resultsText!.trim().isNotEmpty)
            _buildResultsText(
              section.resultsText!,
            ),

          if (section.keyTakeaway != null &&
              section.keyTakeaway!.trim().isNotEmpty)
            _buildTakeaway(
              section.keyTakeaway!,
            ),

          if (section.finalTakeaway != null &&
              section.finalTakeaway!.trim().isNotEmpty)
            _buildTakeaway(
              section.finalTakeaway!,
            ),
        ],
      ),
    );
  }

  // ============================================================
  // QUESTION
  // ============================================================

  Widget _buildQuestion(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          height: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============================================================
  // CONTENT TEXT
  // ============================================================

  Widget _buildContentText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        height: 1.7,
      ),
    );
  }

  // ============================================================
  // RESULTS TEXT
  // ============================================================

  Widget _buildResultsText(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          height: 1.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ============================================================
  // COMPARISON
  // ============================================================

  Widget _buildComparison(
    Map<String, dynamic> data,
  ) {
    final before = data['before']?.toString() ?? '';
    final after = data['after']?.toString() ?? '';

    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Before',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          _buildInfoBox(
            before,
          ),

          const SizedBox(height: 16),

          const Text(
            'After',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          _buildInfoBox(
            after,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // RESULT
  // ============================================================

  Widget _buildResult(
    Map<String, dynamic> data,
  ) {
    final before =
        data['before_size']?.toString() ?? '-';

    final after =
        data['after_size']?.toString() ?? '-';

    final reduction =
        data['reduction']?.toString() ?? '-';

    return Container(
      margin: const EdgeInsets.only(
        top: 24,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildResultItem(
              'Before',
              before,
            ),
          ),

          Expanded(
            child: _buildResultItem(
              'After',
              after,
            ),
          ),

          Expanded(
            child: _buildResultItem(
              'Reduction',
              reduction,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(
    String label,
    String value,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade400,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // INFO BOX
  // ============================================================

  Widget _buildInfoBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.5,
        ),
      ),
    );
  }

  // ============================================================
  // TAKEAWAY
  // ============================================================

  Widget _buildTakeaway(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 24,
      ),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        border: Border(
          left: BorderSide(
            color: Colors.grey.shade500,
            width: 3,
          ),
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          height: 1.6,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  // ============================================================
  // TABLE OF CONTENTS
  // ============================================================

  Widget _buildTableOfContents() {
    final entries = _flattenSections();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'On this page',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey.shade800,
        ),

        const SizedBox(height: 10),

        if (entries.isEmpty)
          Text(
            'No sections',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),

        ...entries.map(
          (entry) => _buildTocItem(
            entry,
          ),
        ),
      ],
    );
  }

  // ============================================================
  // TOC ITEM
  // ============================================================

  Widget _buildTocItem(
    _SectionEntry entry,
  ) {
    final isActive =
        entry.keyIndex == _activeIndex;

    final leftPadding =
        (entry.level - 1) * 16.0;

    return InkWell(
      onTap: () {
        _scrollToSection(
          entry.keyIndex,
        );
      },
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          left: leftPadding + 10,
          right: 6,
          top: 6,
          bottom: 6,
        ),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isActive
                  ? Colors.white
                  : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          entry.section.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: entry.level == 1 ? 14 : 13,
            height: 1.4,
            fontWeight: isActive
                ? FontWeight.w600
                : FontWeight.normal,
            color: isActive
                ? Colors.white
                : Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}

// ================================================================
// SECTION ENTRY
// ================================================================

class _SectionEntry {
  final BlogSection section;
  final int level;
  final GlobalKey key;
  final int keyIndex;

  const _SectionEntry({
    required this.section,
    required this.level,
    required this.key,
    required this.keyIndex,
  });
}

// ================================================================
// BLOG SECTION MODEL
// ================================================================

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