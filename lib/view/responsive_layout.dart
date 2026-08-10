import 'package:flutter/material.dart';

class Responsivelayout extends StatelessWidget {
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
      MediaQuery.of(context).size.width <= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width >= 1024) {
      return desktop(context);
    } else if (width >= 800) {
      return tablet(context);
    } else {
      return mobile(context);
    }
  }
}