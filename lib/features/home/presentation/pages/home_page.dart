import 'package:flutter/material.dart';
import 'package:flutter_base/app/routes/app_router.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/features/home/presentation/providers/home_providers.dart';
import 'package:flutter_base/features/home/presentation/widgets/daily_challenge_widget.dart';
import 'package:flutter_base/features/home/presentation/widgets/level_card_widget.dart';
import 'package:flutter_base/features/progress/presentation/cubit/progress_cubit.dart';
import 'package:flutter_base/features/progress/presentation/widgets/streak_widget.dart';
import 'package:flutter_base/features/progress/presentation/widgets/xp_bar_widget.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<ProgressCubit, ProgressState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is ProgressLoaded) ...[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Column(
                      children: [
                        XpBarWidget(currentXp: state.progress.totalXp),
                        const SizedBox(height: 12),
                        StreakWidget(
                          currentStreak: state.progress.currentStreak,
                          longestStreak: state.progress.longestStreak,
                        ),
                      ],
                    ),
                  ),
                ] else if (state is ProgressLoading) ...[
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ],
                const SizedBox(height: 20),

                DailyChallengeWidget(
                  onTap: () => context.push(AppRoutes.quizByLevel(1)),
                ),
                const SizedBox(height: 12),
                Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  color: context.appColors.levelBadge,
                  child: InkWell(
                    onTap: () => context.push(AppRoutes.challenges),
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withValues(alpha: 0.2),
                            ),
                            child: const Icon(
                              Icons.forum_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.t.challenges.forumTitle,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  context.t.challenges.forumSubtitle,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withValues(alpha: 0.85),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    context.t.home.learningPath,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: context.appColors.textPrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                if (state is ProgressLoaded) ...[
                  Builder(
                    builder: (context) {
                      final completedLevels = state.progress.completedLevels;
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
                        children: availableLevels.map((level) {
                          return LevelCardWidget(
                            level: level.level,
                            title: resolveTitle(level.titleKey),
                            subtitle: resolveSubtitle(level.subtitleKey),
                            icon: level.icon,
                            isCompleted: completedLevels.contains(level.level),
                            onTap: () => context.push(
                              AppRoutes.quizByLevel(level.level),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ] else if (state is ProgressLoading) ...[
                  const Center(child: CircularProgressIndicator()),
                ],
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
