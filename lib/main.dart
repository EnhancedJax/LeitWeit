import 'package:flutter/material.dart';
import 'package:LeitWeit/pages/home.dart';
import 'package:LeitWeit/pages/auth/login.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Set status bar color to transparent
    statusBarIconBrightness:
        Brightness.light, // Set status bar icons to be white
  ));

  await Supabase.initialize(
    url: 'https://gpvzjolzvecywsfoajxu.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdwdnpqb2x6dmVjeXdzZm9hanh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIyODgwNjEsImV4cCI6MjAyNzg2NDA2MX0.sDRTxW2rWk7ZRao22rnLar72-Xs7AP6AcKFUOYT_whA',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

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
      child: MaterialApp.router(
          title: 'My App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
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
          ),
          routerConfig: _router,
          themeMode: ThemeMode.dark),
    );
  }
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: HomePage.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: LoginPage.route,
      builder: (context, state) => const LoginPage(),
    ),
  ],
  redirect: (context, state) async {
    final session = supabase.auth.currentSession;
    // A user without a session should be redirected to the register page
    if (session == null) {
      return LoginPage.route;
    }

    // The user has signed, and is allowed to view any page.
    return null;
  },
);
