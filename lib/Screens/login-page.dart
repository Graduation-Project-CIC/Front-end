// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/signup-page.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import 'package:full_circle/design.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email ='' ;
  String password= '';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //TOP ICON AND BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, WelcomeScreen.id);
                        },
                      ),
                    ),
                    Expanded(
                        flex:4,
                        child: SizedBox(width: screenWidth*0.02,)),
                    Expanded(
                      flex:2,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth*0.01),
                    Expanded(
                      flex:3,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up As Driver',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.05),
                //LOGO AND NAME
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: dropShadowDecoration,
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFF3D8361),
                        radius: 30,
                        // half the width and height of the image
                        backgroundImage:
                        AssetImage('images/fullCircle-GreenBG.png'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'FULL CIRCLE',
                      style: mainLogoName.copyWith(fontSize: 25),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight*0.05),
                //EMAIL ADDRESS and password
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 600 ? 17.0 : 15.0,
                      right: MediaQuery.of(context).size.width > 600 ? 17.0 : 15.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' Your Email Address', style: textStyle),
                      ),
                      SizedBox(height: screenHeight*0.01),
                      TextField(
                        onChanged: (value){
                          email = value;
                        },
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'example@domain.com' ),
                      ),
                      SizedBox(height: screenHeight*0.04),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(' Password', style: textStyle),
                      ),
                      SizedBox(height: screenHeight*0.01),
                      TextField(
                        obscureText: true,
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'Your password'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password?',
                            style: textStyle.copyWith(
                                fontSize: 16, color: const Color(0xFF3D8361)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:  EdgeInsets.symmetric(
                      vertical: screenHeight > 600 ? 20 : 10,
                      horizontal: screenWidth > 600 ? 20 : 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: email,
                            password: password
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          if (kDebugMode) {
                            print('No user found for that email.');
                          }
                        } else if (e.code == 'wrong-password') {
                          if (kDebugMode) {
                            print('Wrong password provided for that user.');
                          }
                        }
                      }
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    style: buttonStyle.copyWith(
                        minimumSize:
                        MaterialStateProperty.all<Size>(const Size(213, 53))),
                    child: const Text('Sign In'),
                  ),
                ),
                SizedBox(height: screenHeight *0.015),
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
                ), //Line
                const SizedBox(height: 15),
                Container(
                  margin:  EdgeInsets.symmetric(
                      vertical: screenHeight > 600 ? 20 : 10,
                      horizontal: screenWidth > 600 ? 20 : 10),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {

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
                          width: screenWidth *0.04,
                          height: screenHeight *0.024,
                        ),
                        SizedBox(width: screenWidth *0.025),
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