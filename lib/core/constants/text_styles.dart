import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'Inter';
  
  static const TextStyle heading1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    color: Color(0xFFE2E8F0),
    height: 1.2,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: Color(0xFFE2E8F0),
    height: 1.3,
  );
  
  static const TextStyle heading3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color(0xFFE2E8F0),
    height: 1.4,
  );
  
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: Color(0xFFE2E8F0),
    height: 1.5,
  );
  
  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Color(0xFFE2E8F0),
    height: 1.6,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Color(0xFF94A3B8),
    height: 1.5,
  );
}

class AppConstants {
  static const String appName = 'AMK Developer';
  static const String appDescription = 'Personal Portfolio & Dashboard';
  
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(16.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(24.0);
  
  static const double borderRadius = 12.0;
  static const double cardElevation = 4.0;
}