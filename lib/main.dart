import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/forget_password.dart';
import 'screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LPI App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(title: ''),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/forget-password': (context) => const ForgetPasswordScreen(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
