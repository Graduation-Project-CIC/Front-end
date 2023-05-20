import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:full_circle/Screens/Tracking%20Screens/matching.dart';
import 'package:full_circle/Screens/Tracking%20Screens/recipientMatch.dart';
import 'package:full_circle/Screens/DoneTracking/NewTracking.dart';
import 'package:full_circle/Screens/donationDetails.dart';
import 'package:full_circle/Screens/driver_sign_up.dart';
import 'package:full_circle/Screens/driver_welcome_page.dart';
import 'package:full_circle/Screens/Safety%20check/SafetyCheck2.dart';
import 'package:full_circle/Screens/donorreviews.dart';
import 'package:full_circle/Screens/driverrevies.dart';
import 'package:full_circle/Screens/getStarted-page.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/homeless_map.dart';
import 'package:full_circle/Screens/instructionsScreens/Donors.dart';
import 'package:full_circle/Screens/instructionsScreens/Drivers.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipients.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'package:full_circle/Screens/onboarding-page.dart';
import 'package:full_circle/Screens/recipientreviews.dart';
import 'package:full_circle/Screens/Safety%20check/Safety%20Check.dart';
import 'package:full_circle/Screens/reviews/donorreview1.dart';
import 'package:full_circle/Screens/reviews/donorreview2.dart';
import 'package:full_circle/Screens/reviews/driverriveiw1.dart';
import 'package:full_circle/Screens/reviews/recipientreview1.dart';
import 'Screens/donationForm.dart';
import 'Screens/instructionsScreen.dart';
import 'Screens/mark_homeless.dart';
import 'Screens/recipient-signUp.dart';
import 'Screens/recipientPreferences.dart';
import 'Screens/signup-page.dart';
import 'Screens/welcome-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print(fcmToken);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
   Widget build(BuildContext context) {
  //   final fcmToken =  FirebaseMessaging.instance.getToken();
    return MaterialApp(
      //initialRoute: GetStarted.id,
      initialRoute:  RecipientReview1.id,

      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        Matching.id: (context) => const Matching(),
        RecipientMatching.id: (context) => const RecipientMatching(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        MarkHomeless.id: (context) => const MarkHomeless(),
        DriverSignUp.id: (context) => const DriverSignUp(),
        MyScreen.id: (context) => const MyScreen(),
        HomelessMap.id: (context) => const HomelessMap(),
        DonorsInstructions.id: (context) => const DonorsInstructions(),
        DriversInstructions.id: (context) => const DriversInstructions(),
        DriverWelcomePage.id: (context) => const DriverWelcomePage(),
        Recipientsinstructions.id: (context) => const Recipientsinstructions(),
        DriverReviews.id: (context) => const DriverReviews(),
        DriverReview1.id: (context) =>  DriverReview1(),
        DonorReviews.id: (context) => const DonorReviews(),
        DonorReview1.id: (context) => const DonorReview1(),
        DonorReview2.id: (context) => const DonorReview2(),
        RecipientReviews.id: (context) => const RecipientReviews(),
        RecipientReview1.id: (context) => const RecipientReview1(),
        SafetyCheck1.id: (context) => const SafetyCheck1(),
        SafetyCheck2.id: (context) => const SafetyCheck2(),
        DoneTracking.id: (context) => const DoneTracking(),
        HomeScreen.id: (context) => const HomeScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        OnBoardingScreen.id: (context) => const OnBoardingScreen(),
        GetStarted.id: (context) => const GetStarted(),
        DonationForm.id: (context) => DonationForm(),
        RecipientSignUp.id: (context) =>  const RecipientSignUp(),
      },
    );
  }
}