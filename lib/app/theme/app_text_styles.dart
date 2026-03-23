import 'package:flutter/material.dart';
import 'package:flutter_base/app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTextStyles {
  static const AppColorsExtension _colors = AppColorsExtension.dark;

  static TextStyle get heading1 => GoogleFonts.jetBrainsMono(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: _colors.textPrimary,
  );

  static TextStyle get heading2 => GoogleFonts.jetBrainsMono(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: _colors.textPrimary,
  );

  static TextStyle get heading3 => GoogleFonts.jetBrainsMono(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: _colors.textPrimary,
  );

  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _colors.textPrimary,
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _colors.textPrimary,
  );

  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _colors.textSecondary,
  );

  static TextStyle get button => GoogleFonts.jetBrainsMono(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: _colors.background,
  );

  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _colors.textSecondary,
  );

  static TextStyle get code => GoogleFonts.firaCode(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _colors.codeText,
  );
}
