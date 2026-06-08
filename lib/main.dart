import 'package:flutter/material.dart';

import 'theme/theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const BasicNavigationApp());
}

class BasicNavigationApp extends StatelessWidget {
  const BasicNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sport Zone',
      theme: buildAppTheme(),
      home: const SplashScreen(),
    );
  }
}

