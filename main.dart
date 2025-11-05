import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/submit_screen.dart';
import 'screens/report_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const QuizyApp(),
    ),
  );
}

class QuizyApp extends StatelessWidget {
  const QuizyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        DashboardScreen.routeName: (_) => DashboardScreen(),
        QuizScreen.routeName: (_) => QuizScreen(),
        SubmitScreen.routeName: (_) => SubmitScreen(),
        ReportScreen.routeName: (_) => ReportScreen(),
      },
    );
  }
}
