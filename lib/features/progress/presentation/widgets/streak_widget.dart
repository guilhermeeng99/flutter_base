import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({
    required this.currentStreak,
    this.longestStreak = 0,
    super.key,
  });

  final int currentStreak;
  final int longestStreak;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.streakFlame.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.streakFlame.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.local_fire_department,
            size: 32,
            color: AppColors.streakFlame,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.t.progress.dayStreak(count: currentStreak),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                context.t.progress.best(count: longestStreak),
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
