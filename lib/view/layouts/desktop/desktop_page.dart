import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/blog/blog_page.dart';
import 'package:flutter_portofolio/view/pages/home/sections/skills/skill_section.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';

/// Flag module-level: di-set oleh _handleNav (dipanggil dari link footer
/// "Resources") SEBELUM go_router, lalu dikonsumsi saat halaman tujuan
/// dibangun untuk memicu efek "mulai dari bawah lalu scroll ke atas".
bool _scrollUpFromBottom = false;

class DesktopPage extends StatefulWidget {
  final String section;
  const DesktopPage({super.key, required this.section});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  late ScrollController _scrollController;
  // Efek "dari bawah -> atas": tutupi dulu dengan layar hitam (menyembunyikan
  // background biru scaffold) sampai posisi benar-benar di bawah, baru buka.
  bool _needsReveal = false;
  bool _coverVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (_scrollUpFromBottom) {
      _scrollUpFromBottom = false;
      _needsReveal = true;
      _coverVisible = true;
    }
  }

  @override
  void didUpdateWidget(covariant DesktopPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section && _scrollUpFromBottom) {
      _scrollUpFromBottom = false;
      final oldController = _scrollController;
      _scrollController = ScrollController();
      _needsReveal = true;
      _coverVisible = true;
      // Dispose controller lama setelah Scrollable lama dilepas framework.
      WidgetsBinding.instance.addPostFrameCallback((_) => oldController.dispose());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// HANYA dipanggil dari link footer "Resources" (ContactSection).
  /// - Halaman SAMA   : smooth-scroll halus ke atas.
  /// - Halaman BEDA   : picu efek "mulai dari bawah", lalu navigasi.
  /// (Navbar memakai navigasi default go_router — langsung pindah, tanpa efek.)
  void _handleNav(String path) {
    final currentPath = GoRouter.of(context).state.uri.path;
    final isHome = currentPath == '/' || currentPath.isEmpty || currentPath == '/home';
    final targetIsHome = path == '/' || path == '/home';

    if ((isHome && targetIsHome) || currentPath == path) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOutCubic,
        );
      }
      return;
    }

    _scrollUpFromBottom = true;
    GoRouter.of(context).go(path);
  }

  @override
  Widget build(BuildContext context) {
    if (_needsReveal) {
      _needsReveal = false;
      // Setelah layout selesai: loncat ke bawah (tanpa animasi, tanpa flash
      // biru karena masih tertutup layer hitam), buka cover, lalu animasi naik.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        }
        if (mounted) setState(() => _coverVisible = false);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 750),
              curve: Curves.easeInOutCubic,
            );
          }
        });
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xff00285d),
      body: Stack(
        children: [
          _buildPage(context),
          // Layer penutup: menyembunyikan background biru scaffold pada frame
          // pertama sebelum posisi scroll benar-benar di bawah.
          if (_coverVisible)
            const Positioned.fill(
              child: ColoredBox(color: Colors.black),
            ),
          Container(
            height: kNavbarHeight,
            color: Colors.transparent,
            // Navbar pakai navigasi default (langsung pindah, tanpa efek).
            child: Navbar(selectedSection: widget.section),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    if (widget.section == 'home') {
      return CustomScrollView(
        key: const ValueKey('home'),
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: TopSection()),
          const SliverToBoxAdapter(child: SkillSection()),
          SliverToBoxAdapter(
            child: AboutMe(
              onViewAllArticles: () => _handleNav('/blog'),
            ),
          ),
          SliverToBoxAdapter(
            child: ProjectSection(
              onViewAll: () => GoRouter.of(context).go('/project'),
            ),
          ),
          SliverToBoxAdapter(
            child: ContactSection(onNavigate: _handleNav),
          ),
        ],
      );
    }

    if (widget.section == 'formalities') {
      return CustomScrollView(
        key: const ValueKey('formalities'),
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: FormalitiesSection()),
          SliverToBoxAdapter(child: ExperienceSection()),
          SliverToBoxAdapter(
            child: ContactSection(onNavigate: _handleNav),
          ),
        ],
      );
    }

    if (widget.section == 'project') {
      return CustomScrollView(
        key: const ValueKey('project'),
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(child: ProjectList()),
          SliverToBoxAdapter(
            child: ContactSection(onNavigate: _handleNav),
          ),
        ],
      );
    }

    if (widget.section == 'blog') {
      return CustomScrollView(
        key: const ValueKey('blog'),
        controller: _scrollController,
        slivers: [
          const SliverToBoxAdapter(child: BlogPage()),
          SliverToBoxAdapter(
            child: ContactSection(onNavigate: _handleNav),
          ),
        ],
      );
    }

    return const SizedBox();
  }
}
