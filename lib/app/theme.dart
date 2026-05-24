import 'package:flutter/material.dart';

class AppColors {
  // Background
  static const Color background = Color(0xFF0F172A);
  
  // Primary Accent - Neon Sky Blue
  static const Color primaryAccent = Color(0xFF38BDF8);
  
  // Secondary Accent - Vibrant Rose
  static const Color secondaryAccent = Color(0xFFF43F5E);
  
  // Text - Off-White
  static const Color text = Color(0xFFE2E8F0);
  
  // Additional shades
  static const Color surfaceDark = Color(0xFF1E293B);
  static const Color surfaceLight = Color(0xFF334155);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryAccent,
        secondary: AppColors.secondaryAccent,
        surface: AppColors.surfaceDark,
        onSurface: AppColors.text,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColors.text),
        bodyMedium: TextStyle(color: AppColors.text),
        bodySmall: TextStyle(color: AppColors.text),
        headlineLarge: TextStyle(color: AppColors.text),
        headlineMedium: TextStyle(color: AppColors.text),
        headlineSmall: TextStyle(color: AppColors.text),
        titleLarge: TextStyle(color: AppColors.text),
        titleMedium: TextStyle(color: AppColors.text),
        titleSmall: TextStyle(color: AppColors.text),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.text,
      ),
    );
  }

  static ThemeData get darkTheme => lightTheme;
}