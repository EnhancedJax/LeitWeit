import 'package:flutter/material.dart';

class AppTheme {
  static const Color background = Color(0xFF232323);
  static const Color onBackground = Color(0xFFEDEDED);
  static const Color onBackground2 = Color(0xFFA0A0A0);
  static const Color primarySurface = Color(0xFF343434);
  static const Color secondarySurface = Color(0xFF282828);
  static const Color onSurface = Color(0xFFEDEDED);
  static const Color onSurface2 = Color(0xFF707070);
  static const Color border = Color(0xFF343434);
  static const Color shadow = Colors.transparent;
  static const Color green = Color(0xFF34D399);
  static const Color red = Color(0xFFFF5A5A);
  static const Color aqua = Color(0xFF35CFFF);
  static const double borderRadius = 18.0;
}

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppTheme.background,
  fontFamily: 'Inter',
  cardTheme: const CardTheme(
    color: AppTheme.secondarySurface,
    shadowColor: AppTheme.shadow,
    surfaceTintColor: Colors.transparent,
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(AppTheme.borderRadius),
      ),
    ),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 24.0,
        color: AppTheme.onBackground,
        fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(
        fontSize: 20.0,
        color: AppTheme.onBackground,
        fontWeight: FontWeight.w600),
    headlineSmall: TextStyle(
        fontSize: 16,
        color: AppTheme.onBackground2,
        fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(
        fontSize: 16,
        color: AppTheme.onBackground,
        fontWeight: FontWeight.w300),
  ),
);
