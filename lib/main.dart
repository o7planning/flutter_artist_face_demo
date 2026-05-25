import 'package:flutter/material.dart';
import 'package:flutter_artist_face_demo/pages/analytics_screen.dart';
import 'package:flutter_artist_face_demo/pages/dashboard_screen.dart';
import 'package:flutter_artist_face_demo/pages/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_artist_face Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/settings': (context) => const SettingsScreen(),
        // Mock analytics route points back to dashboard for testing simplicity
        '/analytics': (context) => const AnalyticsScreen(),
        '/logout': (context) => const SettingsScreen(),
      },
    );
  }
}
