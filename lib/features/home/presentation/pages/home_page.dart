import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_routes.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_base/features/home/presentation/widgets/daily_challenge_widget.dart';
import 'package:flutter_base/features/home/presentation/widgets/level_card_widget.dart';
import 'package:flutter_base/features/progress/presentation/providers/progress_providers.dart';
import 'package:flutter_base/features/progress/presentation/widgets/streak_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/xp_bar_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levels = ref.watch(availableLevelsProvider);
    final asyncProgress = ref.watch(progressProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.t.home.title,
          style: const TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => context.push(AppRoutes.progress),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // XP and Streak section
            asyncProgress.when(
              data: (p) => Padding(
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
              ),
              loading: () => const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 20),

            // Daily Challenge
            DailyChallengeWidget(
              onTap: () => context.push(AppRoutes.quizByLevel(1)),
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
            asyncProgress.when(
              data: (p) {
                final completedLevels = p.completedLevels;
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
                  children: levels.map((level) {
                    return LevelCardWidget(
                      level: level.level,
                      title: resolveTitle(level.titleKey),
                      subtitle: resolveSubtitle(level.subtitleKey),
                      icon: level.icon,
                      isCompleted: completedLevels.contains(level.level),
                      onTap: () =>
                          context.push(AppRoutes.quizByLevel(level.level)),
                    );
                  }).toList(),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, _) => const SizedBox.shrink(),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
