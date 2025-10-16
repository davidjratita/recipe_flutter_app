import 'package:flutter/material.dart';
import 'package:recipe/splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Browser App',
      home: SplashScreen()
    );
  }
}