import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/item/app_fonts.dart';
import 'package:flutter_portofolio/view/responsive_layout.dart';

class Navbar extends StatelessWidget {
  final Function(String)? onNavTap;
  const Navbar({super.key, this.onNavTap});

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
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _navItem(
                      "HOME",
                      isActive: activeSection == 'home',
                      onTap: () => _navigate(context, 'home'),
                    ),
                    _navItem(
                      "ABOUT",
                      isActive: activeSection == 'formalities',
                      onTap: () => _navigate(context, 'formalities'),
                    ),
                    _navItem(
                      "PROJECT",
                      isActive: activeSection == 'project',
                      onTap: () => _navigate(context, 'project'),
                    ),
                  ],
                ),
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
              Row(
                children: [
                  _navItem(
                    "HOME",
                    isActive: activeSection == 'home',
                    onTap: () => _navigate(context, 'home'),
                  ),
                  const SizedBox(width: 30),
                  _navItem(
                    "ABOUT",
                    isActive: activeSection == 'formalities',
                    onTap: () => _navigate(context, 'formalities'),
                  ),
                  const SizedBox(width: 30),
                  _navItem(
                    "PROJECT",
                    isActive: activeSection == 'project',
                    onTap: () => _navigate(context, 'project'),
                  ),
                ],
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              )
            : null,
        child: Text(
          title,
          style: AppFontStyle.vcrMonoBodyLarge.copyWith(
            color: isActive ? Colors.tealAccent : Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
