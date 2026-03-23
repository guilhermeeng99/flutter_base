import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';

class LevelBadgeWidget extends StatelessWidget {
  const LevelBadgeWidget({
    required this.level,
    this.size = 48,
    super.key,
  });

  final int level;
  final double size;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colors.levelBadge,
            colors.levelBadge.withValues(alpha: 0.7),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colors.levelBadge.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          '$level',
          style: TextStyle(
            fontSize: size * 0.4,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
