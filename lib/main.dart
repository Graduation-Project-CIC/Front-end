import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:full_circle/Screens/driver_sign_up.dart';
import 'package:full_circle/Screens/driver_welcome_page.dart';
import 'package:full_circle/Screens/getStarted-page.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/homeless_map.dart';
import 'package:full_circle/Screens/instructionsScreens/Donors.dart';
import 'package:full_circle/Screens/instructionsScreens/Drivers.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipients.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'package:full_circle/Screens/onboarding-page.dart';
import 'Screens/donationForm.dart';
import 'Screens/instructionsScreen.dart';
import 'Screens/mark_homeless.dart';
import 'Screens/recipient-signUp.dart';
import 'Screens/recipientPreferences.dart';
import 'Screens/signup-page.dart';
import 'Screens/welcome-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: GetStarted.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        MarkHomeless.id: (context) => const MarkHomeless(),
        DriverSignUp.id: (context) => const DriverSignUp(),
        MyScreen.id: (context) => const MyScreen(),
        HomelessMap.id: (context) => const HomelessMap(),
        DonorsInstructions.id: (context) => const DonorsInstructions(),
        DriversInstructions.id: (context) => const DriversInstructions(),
        DriverWelcomePage.id: (context) => const DriverWelcomePage(),
        Recipientsinstructions.id: (context) => const Recipientsinstructions(),
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