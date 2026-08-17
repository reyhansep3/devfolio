import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class Navbar extends StatelessWidget {
  final Function(String)? onNavTap;
  final String? selectedSection;
  const Navbar({super.key, this.onNavTap, this.selectedSection});

  @override
  Widget build(BuildContext context) {
    return Responsivelayout(
      desktop: (context) => desktopTabletBody(context),
      mobile: (context) => mobileBody(context),
      tablet: (context) => desktopTabletBody(context),
    );
  }

  void _navigate(BuildContext context, String section) {
    if (onNavTap != null) {
      onNavTap!(section);
      return;
    }

    final path = section == 'home' ? '/' : '/$section';
    GoRouter.of(context).go(path);
  }

  String _currentSection(BuildContext context) {
    if (selectedSection != null && selectedSection!.isNotEmpty) {
      return selectedSection!;
    }

    final uri = GoRouter.of(context).state.uri;
    final path = uri.path;
    if (path == '/' || path.isEmpty || path == '/home') {
      return 'home';
    }

    final segments = path.split('/').where((part) => part.isNotEmpty).toList();
    return segments.isEmpty ? 'home' : segments.first;
  }

  Widget mobileBody(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Dev/",
                  style: AppFontStyle.vtBodyMedium.copyWith(color: AppColor.yellowgreen),
                ),
                TextSpan(
                  text: "S3p.",
                  style: AppFontStyle.vtBodyMedium.copyWith(color: AppColor.white),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Download CV",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget desktopTabletBody(BuildContext context) {
    final activeSection = _currentSection(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 920;
        final navItems = [
          {'key': 'home', 'label': 'HOME', 'width': 80.0},
          {'key': 'formalities', 'label': 'ABOUT', 'width': 92.0},
          {'key': 'project', 'label': 'PROJECT', 'width': 112.0},
          {'key': 'blog', 'label': 'BLOG', 'width': 112.0},
        ];
        Widget navRow = Row(
          mainAxisSize: MainAxisSize.min,
          children: navItems.map((item) {
            final key = item['key'] as String;
            final label = item['label'] as String;
            final isActive = activeSection == key;
            return Padding(
              padding: const EdgeInsets.only(right: 24),
              child: _navItem(
                label,
                isActive: isActive,
                onTap: () => _navigate(context, key),
              ),
            );
          }).toList(),
        );

        if (isCompact) {
          return Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "<DEV",
                            style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                          ),
                          TextSpan(
                            text: "/S3P",
                            style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                          ),
                          TextSpan(
                            text: ">_",
                            style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Download CV",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Center(child: navRow),
              ],
            ),
          );
        }

        return Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "<DEV",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                    ),
                    TextSpan(
                      text: "/S3P",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                    ),
                    TextSpan(
                      text: ">_",
                      style: AppFontStyle.vcrMonoBodyLarge.copyWith(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              ),
              navRow,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Download CV",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }

Widget _navItem(
  String title, {
  bool isActive = false,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeInOutCubic,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withValues(alpha: 0.08) : Colors.transparent,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: isActive ? Colors.white.withValues(alpha: 0.20) : Colors.transparent,
          width: 1,
        ),
        boxShadow: isActive
          ? [
              BoxShadow(
                color: Colors.tealAccent.withValues(alpha: 0.12),
                blurRadius: 18,
                spreadRadius: 0,
              ),
            ]
          : [],
      ),
      child: Text(
        title,
        style: AppFontStyle.vcrMonoBodyLarge.copyWith(
          color: isActive ? Colors.tealAccent : Colors.white,
          fontSize: 15,
          fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
        ),
      ),
    ),
  );
}
}
