import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle get titleMono => GoogleFonts.spaceMono(
        fontSize: 20,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.0,
      );

  static TextStyle get bodyMono => GoogleFonts.spaceMono(
        fontSize: 14,
        color: AppColors.textSecondary,
        height: 1.4,
      );

  static TextStyle get button => GoogleFonts.spaceMono(
        fontSize: 16,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w700,
        letterSpacing: .5,
      );

  static TextStyle get caption => GoogleFonts.spaceMono(
        fontSize: 12,
        color: AppColors.textSecondary,
        letterSpacing: .5,
      );
}
