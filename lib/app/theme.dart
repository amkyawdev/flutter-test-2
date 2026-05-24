import 'package:flutter/material.dart';

class AppColors {
  // Background - Light theme
  static const Color background = Color(0xFFFAFAFA);
  
  // Primary Accent - Royal Blue
  static const Color primaryAccent = Color(0xFF2563EB);
  
  // Secondary Accent - Burgundy Red
  static const Color secondaryAccent = Color(0xFF8B5CF6);
  
  // Text - Charcoal
  static const Color text = Color(0xFF1F2937);
  
  // Additional shades
  static const Color surfaceDark = Color(0xFFF3F4F6);
  static const Color surfaceLight = Color(0xFFE5E7EB);
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