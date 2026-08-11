import 'package:flutter/material.dart';

void scrollTo(GlobalKey key) {
  final context = key.currentContext;
  if (context == null) return;

  Scrollable.ensureVisible(
    context,
    duration: const Duration(milliseconds: 600),
    curve: Curves.easeInOut,
  );
}

String routeToSection(String? route) {
  if (route == null || route.isEmpty || route == '/') {
    return 'home';
  }

  final normalized = route.toLowerCase();
  if (normalized == '/about') return 'about';
  if (normalized == '/contact') return 'contact';
  if (normalized == '/projects' || normalized == '/project') return 'project';
  return 'home';
}

String sectionToRoute(String section) {
  switch (section) {
    case 'about':
      return '/about';
    case 'contact':
      return '/contact';
    case 'project':
      return '/project';
    default:
      return '/';
  }
}
