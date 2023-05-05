import 'package:flutter/material.dart';
import 'package:full_circle/Screens/onboarding-page.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import '../design.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);
  static const String id = 'getStarted_screen';

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {

  @override
  void initState() {
    super.initState();
    _checkIfShowOnboarding();
  }

  Future<void> _checkIfShowOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showOnboarding = prefs.getBool('showOnboarding') ?? true;
    setState(() {
    });
    if (!showOnboarding) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, WelcomeScreen.id);
    }
  }

  Future<void> _setShowOnboardingFlag() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showOnboarding', false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'images/SplashScreen-green.png',
                  width: 290,
                  height: 290,
                ),
                ElevatedButton(
                  style: buttonStyle.copyWith(
                    minimumSize:
                    MaterialStateProperty.all<Size>(const Size(295, 50)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, OnBoardingScreen.id);
                    _setShowOnboardingFlag();
                  },
                  child: const Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
