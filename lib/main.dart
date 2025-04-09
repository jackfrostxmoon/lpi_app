import 'package:flutter/material.dart';
// 1. Import your WelcomeScreen file
//    Adjust the path if your file is located elsewhere (e.g., 'screens/welcome_screen.dart')
import 'package:lpi_app/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // You can change the title to match your app
      title: 'LPI App', // Example title change
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ), // Example theme
        useMaterial3: true,
      ),
      // 2. Set WelcomeScreen as the home screen
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false, // Hides the debug banner
    );
  }
}

// 3. The MyHomePage and _MyHomePageState classes are no longer needed here
//    (You can safely delete them from this file)
