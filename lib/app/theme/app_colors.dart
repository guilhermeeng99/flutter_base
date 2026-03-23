import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.primary,
    required this.primaryDark,
    required this.primaryLight,
    required this.secondary,
    required this.secondaryDark,
    required this.accent,
    required this.accentDark,
    required this.success,
    required this.error,
    required this.warning,
    required this.info,
    required this.background,
    required this.surface,
    required this.surfaceLight,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
    required this.disabled,
    required this.codeBackground,
    required this.codeBorder,
    required this.codeText,
    required this.codeKeyword,
    required this.codeString,
    required this.codeComment,
    required this.xpGold,
    required this.streakFlame,
    required this.levelBadge,
  });

  // Primary palette (neon green – tech / terminal)
  final Color primary;
  final Color primaryDark;
  final Color primaryLight;

  // Secondary (cyan / electric blue)
  final Color secondary;
  final Color secondaryDark;

  // Accent (amber glow)
  final Color accent;
  final Color accentDark;

  // Feedback
  final Color success;
  final Color error;
  final Color warning;
  final Color info;

  // Dark neutrals
  final Color background;
  final Color surface;
  final Color surfaceLight;
  final Color textPrimary;
  final Color textSecondary;
  final Color border;
  final Color disabled;

  // Code editor
  final Color codeBackground;
  final Color codeBorder;
  final Color codeText;
  final Color codeKeyword;
  final Color codeString;
  final Color codeComment;

  // XP / Gamification
  final Color xpGold;
  final Color streakFlame;
  final Color levelBadge;

  static const dark = AppColorsExtension(
    primary: Color(0xFF4ADE80),
    primaryDark: Color(0xFF22C55E),
    primaryLight: Color(0xFF86EFAC),
    secondary: Color(0xFF22D3EE),
    secondaryDark: Color(0xFF06B6D4),
    accent: Color(0xFFFBBF24),
    accentDark: Color(0xFFF59E0B),
    success: Color(0xFF4ADE80),
    error: Color(0xFFEF4444),
    warning: Color(0xFFFBBF24),
    info: Color(0xFF38BDF8),
    background: Color(0xFF0F172A),
    surface: Color(0xFF1E293B),
    surfaceLight: Color(0xFF334155),
    textPrimary: Color(0xFFF1F5F9),
    textSecondary: Color(0xFF94A3B8),
    border: Color(0xFF334155),
    disabled: Color(0xFF475569),
    codeBackground: Color(0xFF0D1117),
    codeBorder: Color(0xFF21262D),
    codeText: Color(0xFFE6EDF3),
    codeKeyword: Color(0xFFFF7B72),
    codeString: Color(0xFFA5D6FF),
    codeComment: Color(0xFF8B949E),
    xpGold: Color(0xFFFBBF24),
    streakFlame: Color(0xFFF97316),
    levelBadge: Color(0xFFA78BFA),
  );

  @override
  AppColorsExtension copyWith({
    Color? primary,
    Color? primaryDark,
    Color? primaryLight,
    Color? secondary,
    Color? secondaryDark,
    Color? accent,
    Color? accentDark,
    Color? success,
    Color? error,
    Color? warning,
    Color? info,
    Color? background,
    Color? surface,
    Color? surfaceLight,
    Color? textPrimary,
    Color? textSecondary,
    Color? border,
    Color? disabled,
    Color? codeBackground,
    Color? codeBorder,
    Color? codeText,
    Color? codeKeyword,
    Color? codeString,
    Color? codeComment,
    Color? xpGold,
    Color? streakFlame,
    Color? levelBadge,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      primaryDark: primaryDark ?? this.primaryDark,
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      accent: accent ?? this.accent,
      accentDark: accentDark ?? this.accentDark,
      success: success ?? this.success,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceLight: surfaceLight ?? this.surfaceLight,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      border: border ?? this.border,
      disabled: disabled ?? this.disabled,
      codeBackground: codeBackground ?? this.codeBackground,
      codeBorder: codeBorder ?? this.codeBorder,
      codeText: codeText ?? this.codeText,
      codeKeyword: codeKeyword ?? this.codeKeyword,
      codeString: codeString ?? this.codeString,
      codeComment: codeComment ?? this.codeComment,
      xpGold: xpGold ?? this.xpGold,
      streakFlame: streakFlame ?? this.streakFlame,
      levelBadge: levelBadge ?? this.levelBadge,
    );
  }

  @override
  AppColorsExtension lerp(covariant AppColorsExtension? other, double t) {
    if (other == null) return this;
    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDark: Color.lerp(primaryDark, other.primaryDark, t)!,
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryDark: Color.lerp(secondaryDark, other.secondaryDark, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentDark: Color.lerp(accentDark, other.accentDark, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceLight: Color.lerp(surfaceLight, other.surfaceLight, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      border: Color.lerp(border, other.border, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      codeBackground: Color.lerp(codeBackground, other.codeBackground, t)!,
      codeBorder: Color.lerp(codeBorder, other.codeBorder, t)!,
      codeText: Color.lerp(codeText, other.codeText, t)!,
      codeKeyword: Color.lerp(codeKeyword, other.codeKeyword, t)!,
      codeString: Color.lerp(codeString, other.codeString, t)!,
      codeComment: Color.lerp(codeComment, other.codeComment, t)!,
      xpGold: Color.lerp(xpGold, other.xpGold, t)!,
      streakFlame: Color.lerp(streakFlame, other.streakFlame, t)!,
      levelBadge: Color.lerp(levelBadge, other.levelBadge, t)!,
    );
  }
}

extension AppColorsContext on BuildContext {
  AppColorsExtension get appColors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
