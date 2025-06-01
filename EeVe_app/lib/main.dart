import 'package:flutter/material.dart';
import 'views/splash_view.dart';
import 'Ai_views/Ai_getstarted.dart';
import 'Ai_views/ai_chat_view.dart';
import 'Ai_views/ai_chat_results_view.dart';
import 'package:sawwah_app/navigation/main_nav_shell.dart';
import 'Ai_views/Ai_onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EEVE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
      ),

      home:SplashView(),
    );
  }
}

