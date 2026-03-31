import 'package:flutter/material.dart';

class AppColors {
  // Dark theme colors
  static const Color bgDark = Color(0xFF0a0a0f);
  static const Color cardDark = Color(0xFF13131a);
  static const Color card2Dark = Color(0xFF17171f);
  static const Color accentOrange = Color(0xFFf5a623);
  static const Color accentRed = Color(0xFFff6b35);
  static const Color textLight = Color(0xFFf0f0f0);
  static const Color textMuted = Color(0xFF666680);
  static const Color borderDark = Color(0xFF1e1e2e);
  static const Color greenSuccess = Color(0xFF2ecc71);
  static const Color blueInfo = Color(0xFF4a9eff);

  // Light theme colors
  static const Color bgLight = Color(0xFFfafafa);
  static const Color cardLight = Color(0xFFffffff);
  static const Color textDark = Color(0xFF0a0a0f);
  static const Color borderLight = Color(0xFFe0e0e0);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDark,
      primaryColor: AppColors.accentOrange,
      secondaryHeaderColor: AppColors.accentRed,
      cardColor: AppColors.cardDark,
      dividerColor: AppColors.borderDark,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
          letterSpacing: 1.0,
        ),
        displayMedium: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textLight,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.textLight,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textMuted,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgDark,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentOrange,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgLight,
      primaryColor: AppColors.accentOrange,
      secondaryHeaderColor: AppColors.accentRed,
      cardColor: AppColors.cardLight,
      dividerColor: AppColors.borderLight,
    );
  }
}
