import 'package:flutter/material.dart';
import 'package:lietweit/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class AppTheme {
  static const Color background = Color(0xFF232323);
  static const Color onBackground = Color(0xFFEDEDED);
  static const Color onBackground2 = Color(0xFFA0A0A0);
  static const Color primarySurface = Color(0xFF343434);
  static const Color secondarySurface = Color(0xFF282828);
  static const Color onSurface = Color(0xFFEDEDED);
  static const Color onSurface2 = Color(0xFF707070);
  static const Color border = Color(0xFF343434);
  static const Color shadow = Color(0xFF000000);
  static const Color green = Color(0xFF34D399);
  static const Color red = Color(0xFFFF5A5A);
  static const Color aqua = Color(0xFF35CFFF);
  static const double borderRadius = 18.0;
}

class AppThemeData extends InheritedWidget {
  final AppTheme theme;

  AppThemeData({Key? key, required this.theme, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppThemeData oldWidget) => theme != oldWidget.theme;
}

extension AppThemeExtension on BuildContext {
  AppTheme get appTheme {
    final appThemeData = dependOnInheritedWidgetOfExactType<AppThemeData>();
    if (appThemeData == null) {
      throw Exception('No AppThemeData found in context');
    }
    return appThemeData.theme;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeData(
      theme: AppTheme(),
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppTheme.background,
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 24.0,
                color: AppTheme.onBackground,
                fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(fontSize: 16.0, color: AppTheme.onBackground),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
