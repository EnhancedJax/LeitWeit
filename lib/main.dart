import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter/services.dart';
import 'package:LeitWeit/themedata.dart';
import 'package:LeitWeit/pages/chooseexercise.dart';

import 'package:LeitWeit/pages/home.dart';
import 'package:LeitWeit/pages/newroutine.dart';
import 'package:LeitWeit/pages/auth/login.dart';

Future<void> main() async {
  GetStorage.init();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      routerConfig: _router,
      themeMode: ThemeMode.dark,
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
    GoRoute(
      path: NewRoutinePage.route,
      builder: (context, state) => NewRoutinePage(),
    ),
    GoRoute(
        path: ChooseExercisePage.route,
        builder: (context, state) => ChooseExercisePage()),
  ],
  redirect: (context, state) async {
    final session = Supabase.instance.client.auth.currentSession;
    // A user without a session should be redirected to the register page
    if (session == null) {
      return LoginPage.route;
    }

    // The user has signed, and is allowed to view any page.
    return null;
  },
);
