import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';

class LevelCardWidget extends StatelessWidget {
  const LevelCardWidget({
    required this.level,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.isCompleted = false,
    this.isLocked = false,
    super.key,
  });

  final int level;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;
  final bool isCompleted;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Opacity(
      opacity: isLocked ? 0.5 : 1.0,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: InkWell(
          onTap: isLocked ? null : onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted
                        ? colors.success.withValues(alpha: 0.1)
                        : colors.primary.withValues(alpha: 0.1),
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 28,
                      color: isCompleted ? colors.success : colors.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Icon(Icons.check_circle, color: colors.success)
                else if (isLocked)
                  Icon(Icons.lock, color: colors.disabled)
                else
                  Icon(
                    Icons.arrow_forward_ios,
                    color: colors.textSecondary,
                    size: 18,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
