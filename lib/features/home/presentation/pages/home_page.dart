import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter_base/features/home/presentation/widgets/daily_challenge_widget.dart';
import 'package:flutter_base/features/home/presentation/widgets/level_card_widget.dart';
import 'package:flutter_base/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_base/features/progress/presentation/widgets/streak_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/xp_bar_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final progressController = Get.find<ProgressController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.home.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => context.go('/progress'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // XP and Streak section
            Obx(() {
              final p = progressController.progress.value;
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  children: [
                    XpBarWidget(currentXp: p.totalXp),
                    const SizedBox(height: 12),
                    StreakWidget(
                      currentStreak: p.currentStreak,
                      longestStreak: p.longestStreak,
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),

            // Daily Challenge
            DailyChallengeWidget(
              onTap: () => context.go('/quiz/1'),
            ),
            const SizedBox(height: 24),

            // Levels
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.t.home.learningPath,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final completedLevels =
                  progressController.progress.value.completedLevels;
              final tr = context.t.levels;

              String resolveTitle(String key) => switch (key) {
                'beginner' => tr.beginner,
                'intermediate' => tr.intermediate,
                'advanced' => tr.advanced,
                _ => key,
              };

              String resolveSubtitle(String key) => switch (key) {
                'beginnerDesc' => tr.beginnerDesc,
                'intermediateDesc' => tr.intermediateDesc,
                'advancedDesc' => tr.advancedDesc,
                _ => key,
              };

              return Column(
                children: homeController.availableLevels.map((level) {
                  return LevelCardWidget(
                    level: level.level,
                    title: resolveTitle(level.titleKey),
                    subtitle: resolveSubtitle(level.subtitleKey),
                    icon: level.icon,
                    isCompleted: completedLevels.contains(level.level),
                    onTap: () => context.go('/quiz/${level.level}'),
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
