import 'package:flutter/material.dart';

abstract class AppColors {
  // Primary palette (neon green – tech / terminal)
  static const Color primary = Color(0xFF4ADE80);
  static const Color primaryDark = Color(0xFF22C55E);
  static const Color primaryLight = Color(0xFF86EFAC);

  // Secondary (cyan / electric blue)
  static const Color secondary = Color(0xFF22D3EE);
  static const Color secondaryDark = Color(0xFF06B6D4);

  // Accent (amber glow)
  static const Color accent = Color(0xFFFBBF24);
  static const Color accentDark = Color(0xFFF59E0B);

  // Feedback
  static const Color success = Color(0xFF4ADE80);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFFBBF24);
  static const Color info = Color(0xFF38BDF8);

  // Dark neutrals
  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);
  static const Color textPrimary = Color(0xFFF1F5F9);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color border = Color(0xFF334155);
  static const Color disabled = Color(0xFF475569);

  // Code editor
  static const Color codeBackground = Color(0xFF0D1117);
  static const Color codeBorder = Color(0xFF21262D);
  static const Color codeText = Color(0xFFE6EDF3);
  static const Color codeKeyword = Color(0xFFFF7B72);
  static const Color codeString = Color(0xFFA5D6FF);
  static const Color codeComment = Color(0xFF8B949E);

  // XP / Gamification
  static const Color xpGold = Color(0xFFFBBF24);
  static const Color streakFlame = Color(0xFFF97316);
  static const Color levelBadge = Color(0xFFA78BFA);
}
