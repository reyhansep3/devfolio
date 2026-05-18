import 'package:flutter/material.dart';

class Responsivelayout extends StatefulWidget {
  final Widget desktop;
  final Widget mobile;
  final Widget tablet;

  const Responsivelayout(
      {Key? key,
      required this.desktop,
      required this.mobile,
      required this.tablet})
      : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 500;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1000;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1100;
  }

  @override
  State<Responsivelayout> createState() => _ResponsivelayoutState();
}

class _ResponsivelayoutState extends State<Responsivelayout> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1024) {
      return widget.desktop;
    } else if (size.width >= 800) {
      return widget.tablet;
    } else {
      return widget.mobile;
    }
  }
}
