import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const StaticDataApp());
}

class StaticDataApp extends StatelessWidget {
  const StaticDataApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Static Data Showcase',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: const Color(0xFF155EEF),
              brightness: Brightness.light,
            ).copyWith(
              primary: const Color(0xFF155EEF),
              secondary: const Color(0xFF0F766E),
              tertiary: const Color(0xFFF97316),
              surface: const Color(0xFFFFFFFF),
            ),
        scaffoldBackgroundColor: const Color(0xFFF3F7FF),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Color(0xFFF8FAFC),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFFFFFFFF),
          surfaceTintColor: Colors.white,
          shadowColor: const Color(0xFF0F172A).withValues(alpha: 0.08),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
