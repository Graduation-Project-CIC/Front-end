import 'package:flutter/material.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'Screens/signup-page.dart';
import 'Screens/welcome-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'Welcome page',
      routes: {
        'Welcome page': (context) => WelcomeScreen(),
        'Login page': (context) => LoginScreen(),
        'Sign-up page': (context) => RegisterScreen()
      },

    );
  }
}
