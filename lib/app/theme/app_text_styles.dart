import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // =========================
  // Light Mode (Cairo Font)
  // =========================

  static TextStyle lightDisplayLarge = GoogleFonts.cairo(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle lightDisplayMedium = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle lightHeadlineLarge = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle lightHeadlineMedium = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle lightTitleLarge = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle lightTitleMedium = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle lightBodyLarge = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle lightBodyMedium = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle lightBodySmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle lightButton = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // =========================
  // Dark Mode (Cairo Font)
  // =========================

  static TextStyle darkDisplayLarge = GoogleFonts.cairo(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkDisplayMedium = GoogleFonts.cairo(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkHeadlineLarge = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkHeadlineMedium = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkTitleLarge = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkTitleMedium = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkBodyLarge = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: DarkAppColors.textPrimary,
  );

  static TextStyle darkBodyMedium = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: DarkAppColors.textSecondary,
  );

  static TextStyle darkBodySmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: DarkAppColors.textSecondary,
  );

  static TextStyle darkButton = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}