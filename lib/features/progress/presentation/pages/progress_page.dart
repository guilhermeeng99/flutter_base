import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/progress/presentation/cubit/progress_cubit.dart';
import 'package:flutter_base/features/progress/presentation/widgets/level_badge_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/streak_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/xp_bar_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
              return;
            }
            context.go(AppRoutes.home);
          },
        ),
        title: Text(context.t.progress.title),
      ),
      body: BlocBuilder<ProgressCubit, ProgressState>(
        builder: (context, state) {
          if (state is ProgressLoading || state is ProgressInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProgressError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          final p = (state as ProgressLoaded).progress;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    LevelBadgeWidget(level: p.currentLevel, size: 64),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.t.progress.level(level: p.currentLevel),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: context.appColors.textPrimary,
                          ),
                        ),
                        Text(
                          context.t.progress.questionsAnswered(
                            count: p.questionsAnswered,
                          ),
                          style: TextStyle(
                            color: context.appColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: context.appColors.textPrimary,
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
                        color: context.appColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        label: context.t.progress.correct,
                        value: '${p.correctAnswers}',
                        icon: Icons.check_circle_outline,
                        color: context.appColors.success,
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
                        color: context.appColors.xpGold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        label: context.t.progress.levelsDone,
                        value: '${p.completedLevels.length}',
                        icon: Icons.emoji_events_outlined,
                        color: context.appColors.levelBadge,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
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
              style: TextStyle(
                fontSize: 13,
                color: context.appColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
