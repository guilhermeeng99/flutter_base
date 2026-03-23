import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:flutter_base/gen/i18n/strings.g.dart';

class XpBarWidget extends StatelessWidget {
  const XpBarWidget({
    required this.currentXp,
    this.nextLevelXp = 100,
    super.key,
  });

  final int currentXp;
  final int nextLevelXp;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final progress = (currentXp % nextLevelXp) / nextLevelXp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.bolt, color: colors.xpGold, size: 20),
                const SizedBox(width: 4),
                Text(
                  context.t.common.xp(count: currentXp),
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colors.textPrimary,
                  ),
                ),
              ],
            ),
            Text(
              '${currentXp % nextLevelXp}/$nextLevelXp',
              style: TextStyle(
                fontSize: 12,
                color: colors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 12,
            backgroundColor: colors.border,
            valueColor: AlwaysStoppedAnimation<Color>(colors.xpGold),
          ),
        ),
      ],
    );
  }
}
