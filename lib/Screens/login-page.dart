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
  String email ='' ;
  String password= '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //TOP ICON AND BUTTONS
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, WelcomeScreen.id);
                        },
                      ),
                      const SizedBox(width: 69),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, RegisterScreen.id);

                        },
                        child: const Text(
                          'Sign Up As A Donor',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up As Driver',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  //LOGO AND NAME
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.9),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
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
                  const SizedBox(height: 40),
                  //EMAIL ADDRESS and password
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 11.0),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(' Your Email Address', style: textStyle),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value){
                            email = value;
                          },
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'example@domain.com' ),
                        ),
                        const SizedBox(height: 34),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(' Password', style: textStyle),
                        ),
                        const SizedBox(height: 10),
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
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
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
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 0.5,
                        width: 150,
                        decoration: lineDecoration.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(width: 25),
                      Text(
                        'OR',
                        style: textStyle.copyWith(
                            fontSize: 25, color: Colors.grey),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        height: 0.5,
                        width: 150,
                        decoration: lineDecoration.copyWith(color: Colors.grey),
                      ),
                    ],
                  ), //Line
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
