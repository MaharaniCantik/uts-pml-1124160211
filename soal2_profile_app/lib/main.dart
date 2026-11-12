import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF047857),
        brightness: Brightness.light),
        scaffoldBackgroundColor: Color(0xFFF0FDF4),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF059669),
        brightness: Brightness.dark),
        scaffoldBackgroundColor: Color(0xFF071E1A),
      ),
      themeMode: ThemeMode.system,
    );
  }
}