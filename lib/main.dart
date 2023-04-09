import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'package:full_circle/design.dart';
import 'Screens/donationForm.dart';
import 'Screens/signup-page.dart';
import 'Screens/welcome-page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: DonationForm.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        DonationForm.id: (context) => DonationForm(),
      },
    );
  }
}
