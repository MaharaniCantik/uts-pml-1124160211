import 'package:flutter/material.dart';
import 'package:soal2_profile_app/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  void _ubahTema(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF047857),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Color(0xFFF0FDF4),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF059669),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Color(0xFF071E1A),
      ),
      themeMode: _themeMode,
      home: LoginPage(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _ubahTema,
      ),
    );
  }
}
