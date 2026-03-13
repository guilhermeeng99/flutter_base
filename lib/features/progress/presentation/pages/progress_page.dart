import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/progress/presentation/controllers/progress_controller.dart';
import 'package:flutter_base/features/progress/presentation/widgets/level_badge_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/streak_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/xp_bar_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:get/get.dart';

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.t.progress.title)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final p = controller.progress.value;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile header
              Row(
                children: [
                  LevelBadgeWidget(level: p.currentLevel, size: 64),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.t.progress.level(level: p.currentLevel),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        context.t.progress.questionsAnswered(
                          count: p.questionsAnswered,
                        ),
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // XP Bar
              XpBarWidget(currentXp: p.totalXp),
              const SizedBox(height: 20),

              // Streak
              StreakWidget(
                currentStreak: p.currentStreak,
                longestStreak: p.longestStreak,
              ),
              const SizedBox(height: 24),

              // Stats Grid
              Text(
                context.t.progress.statistics,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: context.t.progress.accuracy,
                      value: '${p.accuracyPercent.toStringAsFixed(0)}%',
                      icon: Icons.gps_fixed,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: context.t.progress.correct,
                      value: '${p.correctAnswers}',
                      icon: Icons.check_circle_outline,
                      color: AppColors.success,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: context.t.progress.totalXp,
                      value: '${p.totalXp}',
                      icon: Icons.bolt,
                      color: AppColors.xpGold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: context.t.progress.levelsDone,
                      value: '${p.completedLevels.length}',
                      icon: Icons.emoji_events_outlined,
                      color: AppColors.levelBadge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
