import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt selectedLevel = 1.obs;
  final RxList<LevelInfo> availableLevels = <LevelInfo>[
    const LevelInfo(
      level: 1,
      titleKey: 'beginner',
      subtitleKey: 'beginnerDesc',
      icon: Icons.terminal,
    ),
    const LevelInfo(
      level: 2,
      titleKey: 'intermediate',
      subtitleKey: 'intermediateDesc',
      icon: Icons.code,
    ),
    const LevelInfo(
      level: 3,
      titleKey: 'advanced',
      subtitleKey: 'advancedDesc',
      icon: Icons.memory,
    ),
  ].obs;

  // ignore: avoid_setters_without_getters
  set level(int level) {
    selectedLevel.value = level;
  }
}

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
