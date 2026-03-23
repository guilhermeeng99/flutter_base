import 'package:flutter/material.dart';

const availableLevels = [
  LevelInfo(
    level: 1,
    titleKey: 'beginner',
    subtitleKey: 'beginnerDesc',
    icon: Icons.terminal,
  ),
  LevelInfo(
    level: 2,
    titleKey: 'intermediate',
    subtitleKey: 'intermediateDesc',
    icon: Icons.code,
  ),
  LevelInfo(
    level: 3,
    titleKey: 'advanced',
    subtitleKey: 'advancedDesc',
    icon: Icons.memory,
  ),
];

class LevelInfo {
  const LevelInfo({
    required this.level,
    required this.titleKey,
    required this.subtitleKey,
    required this.icon,
  });

  final int level;
  final String titleKey;
  final String subtitleKey;
  final IconData icon;
}
