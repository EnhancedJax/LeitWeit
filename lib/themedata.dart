import 'package:flutter/material.dart';

/* ---------------------------------- */
/*               Colors               */
/* ---------------------------------- */
class AppTheme {
  static const Color background = Color(0xFF202020);
  static const Color onBackground = Color(0xFFEDEDED);
  static const Color onBackground2 = Color(0xFFA0A0A0);
  static const Color inverseSurface = Color(0xFFEDEDED);
  static const Color onInverseSurface = Color(0xFF343434);
  static const Color primarySurface = Color(0xFF343434);
  static const Color secondarySurface = Color(0xFF282828);
  static const Color onSurface = Color(0xFFEDEDED);
  static const Color onSurface2 = Color(0xFF707070);
  static const Color border = Color(0xFF343434);
  static const Color shadow = Colors.transparent;
  static const Color green = Color(0xFF34D399);
  static const Color red = Color(0xFFFF5A5A);
  static const Color aqua = Color(0xFF35CFFF);
  static const double borderRadius = 10.0;
}

final ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: AppTheme.background,
  fontFamily: 'Inter',
  /* ---------------------------------- */
  /*                Card                */
  /* ---------------------------------- */
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
  /* ---------------------------------- */
  /*               AppBar               */
  /* ---------------------------------- */
  appBarTheme: const AppBarTheme(
    backgroundColor: AppTheme.background,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      color: AppTheme.onBackground,
      fontWeight: FontWeight.w300,
    ),
    iconTheme: IconThemeData(
      color: AppTheme.onBackground,
      weight: 22,
    ),
    shape: Border(bottom: BorderSide(color: AppTheme.border, width: 1)),
  ),
  /* ---------------------------------- */
  /*               Input                */
  /* ---------------------------------- */
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppTheme.secondarySurface,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.borderRadius),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(
      color: AppTheme.onSurface2,
      fontWeight: FontWeight.w300,
    ),
    floatingLabelStyle: const TextStyle(
      color: AppTheme.onSurface,
      fontWeight: FontWeight.w300,
    ),
  ),
  /* ---------------------------------- */
  /*               Buttons              */
  /* ---------------------------------- */
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppTheme.inverseSurface),
      overlayColor: MaterialStateProperty.all(AppTheme.onSurface2),
      shadowColor: MaterialStateProperty.all(AppTheme.shadow),
      foregroundColor: MaterialStateProperty.all(AppTheme.onInverseSurface),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 24.0, vertical: 2.0),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        ),
      ),
    ),
  ),
  /* ---------------------------------- */
  /*              ListTile              */
  /* ---------------------------------- */
  listTileTheme: const ListTileThemeData(
    tileColor: AppTheme.background,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    shape: Border(bottom: BorderSide(color: AppTheme.border, width: 1)),
  ),
  /* ---------------------------------- */
  /*                Text                */
  /* ---------------------------------- */
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
    bodySmall: TextStyle(
        fontSize: 14, color: AppTheme.onSurface2, fontWeight: FontWeight.w300),
  ),
  colorScheme: ColorScheme.dark().copyWith(
    primary: AppTheme.onBackground,
    secondary: AppTheme.onBackground2,
    error: AppTheme.red,
    onBackground: AppTheme.onBackground,
    onSurface: AppTheme.onSurface,
    shadow: AppTheme.shadow,
    brightness: Brightness.dark,
  ),
);
