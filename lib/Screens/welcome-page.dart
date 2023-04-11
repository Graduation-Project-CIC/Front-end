// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/login-page.dart';
import 'package:full_circle/Screens/signup-page.dart';
import 'package:full_circle/design.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: dropShadowDecoration,
                    child: Image.asset(
                      'images/fullCircle-GreenBG.png',
                      width: 80,
                      height: 80,
                    ),
                  ), // el sora
                  const Text(
                    'FULL CIRCLE',
                    style: mainLogoName,
                  ),
                  const SizedBox(height: 100),
                  //start buttons
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.id);
                      },
                      style: buttonStyle,
                      child: const Text('Sign Up'),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      style: buttonStyle,
                      child: const Text('Sign in'),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      Container(
                        height: 0.5,
                        width: 155,
                        margin:
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        decoration: lineDecoration.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(width: 31),
                      Text(
                        'OR',
                        style: mainLogoName.copyWith(
                            fontSize: 25, color: Colors.grey),
                      ),
                      const SizedBox(width: 31),
                      Container(
                        height: 0.5,
                        width: 157,
                        margin:
                            const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                        decoration: lineDecoration.copyWith(color: Colors.grey),
                      ),
                    ],
                  ), //Line
                  const SizedBox(height: 25),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                          final GoogleSignInAccount? googleUser =
                              await GoogleSignIn().signIn();
                          if (googleUser != null) {
                            final GoogleSignInAuthentication googleAuth =
                                await googleUser.authentication;
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken,
                            );
                            final UserCredential userCredential =
                                await FirebaseAuth.instance
                                    .signInWithCredential(credential);
                            // Navigate to home screen after successful sign-in
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            print(e.toString());
                          }
                          // Handle sign-in errors
                        }
                      },
                      style: elevatedButtonStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'icons/google.png',
                            width: 24,
                            height: 24,
                          ),
                          const SizedBox(width: 16),
                          Text('Sign in with Google',
                              style: buttonTextStyle.copyWith(
                                  color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
