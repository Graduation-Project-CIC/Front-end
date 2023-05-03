import 'package:flutter/material.dart';
import 'package:full_circle/Screens/getStarted-page.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'package:full_circle/Screens/onboarding-page.dart';
import 'Screens/donationForm.dart';
import 'Screens/instructionsScreen.dart';
import 'Screens/recipient-signUp.dart';
import 'Screens/recipientPreferences.dart';
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
      //initialRoute: GetStarted.id,
      initialRoute: MyScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        //id bta3 el page bta3k example: instructions.id
        MyScreen.id: (context) => const MyScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        GetStarted.id: (context) => const GetStarted(),
        DonationForm.id: (context) => DonationForm(),
        RecipientSignUp.id: (context) =>  const RecipientSignUp(),
        RecipientPreferences.id: (context) =>  const RecipientPreferences(),
      },
    );
  }
}