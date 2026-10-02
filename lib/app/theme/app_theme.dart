import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyThemeData {
  MyThemeData._();

  // ============================================================
  // LIGHT THEME
  // ============================================================

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,

      secondary: AppColors.secondary,
      onSecondary: Colors.white,

      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,

      error: AppColors.error,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: AppColors.textSecondary,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: Color(0xFFE2E8F0),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );

  // ============================================================
  // DARK THEME
  // ============================================================

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,

    scaffoldBackgroundColor: DarkAppColors.background,

    colorScheme: const ColorScheme.dark(
      primary: DarkAppColors.primary,
      onPrimary: Colors.white,

      secondary: DarkAppColors.secondary,
      onSecondary: Colors.white,

      surface: DarkAppColors.surface,
      onSurface: DarkAppColors.textPrimary,

      error: DarkAppColors.error,
      onError: Colors.white,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: DarkAppColors.background,
      foregroundColor: DarkAppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    cardTheme: CardThemeData(
      color: DarkAppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: DarkAppColors.surface,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: DarkAppColors.textSecondary,
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: Color(0xFF263244),
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide(
          color: DarkAppColors.primary,
          width: 2,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkAppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}