import 'package:flutter/material.dart';
import 'package:full_circle/Screens/getStarted-page.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/login-page.dart';
<<<<<<< HEAD
import 'package:full_circle/Screens/onboarding-page.dart';
=======
import 'package:full_circle/design.dart';
import 'Screens/donationForm.dart';
>>>>>>> donationForm
import 'Screens/signup-page.dart';
import 'Screens/welcome-page.dart';
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
<<<<<<< HEAD
      initialRoute: GetStarted.id,
=======
      initialRoute: DonationForm.id,
>>>>>>> donationForm
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
<<<<<<< HEAD
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        GetStarted.id: (context) => GetStarted(),
=======
        DonationForm.id: (context) => DonationForm(),
>>>>>>> donationForm
      },
    );
  }
}