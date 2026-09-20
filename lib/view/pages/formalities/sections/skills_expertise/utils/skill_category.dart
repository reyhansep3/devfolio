import 'package:flutter/material.dart';

class SkillCategory {
  const SkillCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.technologies,
  });

  final String title;
  final String description;
  final IconData icon;
  final List<String> technologies;
}