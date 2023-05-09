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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: dropShadowDecoration,
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFF3D8361),
                    radius: 30,
                    // half the width and height of the image
                    backgroundImage:
                    AssetImage('images/fullCircle-GreenBG.png'),
                  ),
                ),// el sora
                const Text(
                  'FULL CIRCLE',
                  style: mainLogoName,
                ),
                SizedBox(height: screenHeight *0.1),
                //start buttons
                Container(
                  margin:  EdgeInsets.symmetric(
                      vertical: screenHeight > 600 ? 20 : 10,
                      horizontal: screenWidth > 600 ? 20 : 10
                  ),

                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.id);
                    },
                    style: buttonStyle,
                    child: const Text('Sign Up'),
                  ),
                ),
                Container(
                  margin:  EdgeInsets.symmetric(
                      vertical: screenHeight > 600 ? 20 : 10,
                      horizontal: screenWidth > 600 ? 20 : 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    style: buttonStyle,
                    child: const Text('Sign in'),
                  ),
                ),
                SizedBox(height: screenHeight* 0.025),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: screenHeight > 600 ? 20 : 10),
                        decoration: lineDecoration,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'OR',
                        style: textStyle.copyWith(fontSize: 25,color: const Color(0x8EB2B0B0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: screenHeight > 600 ? 20 : 10),
                        decoration: lineDecoration,
                      ),
                    ),
                  ],
                ),
                //Line
                SizedBox(height: screenHeight* 0.025),
                Container(
                  margin: EdgeInsets.symmetric(vertical: screenHeight > 600 ? 20 : 10,horizontal: screenWidth > 600 ? 20 : 10),
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
                          width: screenWidth * 0.04,
                          height: screenHeight * 0.04,
                        ),
                        SizedBox(width: screenWidth * 0.03),
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
    );
  }
}