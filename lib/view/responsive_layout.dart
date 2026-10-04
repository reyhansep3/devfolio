import 'package:flutter/material.dart';

class Responsivelayout extends StatelessWidget {
  static const double mobileBreakpoint = 800;
  static const double desktopBreakpoint = 1024;
  final WidgetBuilder desktop;
  final WidgetBuilder mobile;
  final WidgetBuilder tablet;

  const Responsivelayout({
    super.key,
    required this.desktop,
    required this.mobile,
    required this.tablet,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width <= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileBreakpoint &&
      MediaQuery.sizeOf(context).width < desktopBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    if (width >= desktopBreakpoint) {
      return desktop(context);
    } else if (width >= mobileBreakpoint) {
      return tablet(context);
    } else {
      return mobile(context);
    }
  }
}
