import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/blog/blog_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/about_me/about_me_section.dart';
import 'package:flutter_portofolio/view/pages/formalities/sections/experience/experience_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/about/aboutme_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/contact/contact_section.dart';
import 'package:flutter_portofolio/view/pages/home/sections/project/project_list.dart';
import 'package:flutter_portofolio/view/pages/home/sections/top/top_section.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';

/// Flag module-level: di-set oleh _handleNav (dari link footer "Resources")
/// SEBELUM go_router, lalu dikonsumsi saat halaman tujuan dibangun untuk
/// memicu efek "mulai dari bawah lalu scroll ke atas".
bool _scrollUpFromBottomTablet = false;

class TabletPage extends StatefulWidget {
  final String section;
  const TabletPage({Key? key, required this.section}) : super(key: key);

  @override
  State<TabletPage> createState() => _TabletPageState();
}

class _TabletPageState extends State<TabletPage> {
  late ScrollController _scrollController;
  bool _needsReveal = false;
  bool _coverVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (_scrollUpFromBottomTablet) {
      _scrollUpFromBottomTablet = false;
      _needsReveal = true;
      _coverVisible = true;
    }
  }

  @override
  void didUpdateWidget(covariant TabletPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.section != widget.section && _scrollUpFromBottomTablet) {
      _scrollUpFromBottomTablet = false;
      final oldController = _scrollController;
      _scrollController = ScrollController();
      _needsReveal = true;
      _coverVisible = true;
      WidgetsBinding.instance.addPostFrameCallback((_) => oldController.dispose());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// HANYA dipanggil dari link footer "Resources" (ContactSection).
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

    _scrollUpFromBottomTablet = true;
    GoRouter.of(context).go(path);
  }

  @override
  Widget build(BuildContext context) {
    if (_needsReveal) {
      _needsReveal = false;
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
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                // Navbar pakai navigasi default (langsung pindah, tanpa efek).
                child: Navbar(selectedSection: widget.section),
              ),
              if (widget.section == 'formalities') ...[
                const SliverToBoxAdapter(child: FormalitiesSection()),
                SliverToBoxAdapter(child: ExperienceSection()),
              ] else if (widget.section == 'project') ...[
                SliverToBoxAdapter(child: ProjectList()),
              ] else if (widget.section == 'blog') ...[
                const SliverToBoxAdapter(child: BlogPage()),
                SliverToBoxAdapter(
                  child: ContactSection(onNavigate: _handleNav),
                ),
              ] else ...[
                const SliverToBoxAdapter(child: TopSection()),
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
            ],
          ),
          if (_coverVisible)
            const Positioned.fill(
              child: ColoredBox(color: Colors.black),
            ),
        ],
      ),
    );
  }
}
