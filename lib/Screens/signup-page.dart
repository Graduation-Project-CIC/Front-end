// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import '../design.dart';
import 'home-page.dart';
import 'login-page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const String id = 'Signup_screen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmedPasswordController = TextEditingController();
  final ageController = TextEditingController();
  String confirmedErrorMessage = '';
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String Address = '';
  String phoneNumber ='';
  bool isChecked = false;
  bool canSignUp = false;
  int? age;

  void checkSignUpEnabled() {
    setState(() {
      int? ageValue = int.tryParse(ageController.text);

      canSignUp = firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          Address.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          (ageValue != null && ageValue > 0) && // check if ageValue is not null and is greater than zero
          isChecked;
    });
  }

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
                      const SizedBox(width: 135),
                      OutlinedButton(
                        onPressed: () {Navigator.pushNamed(context, LoginScreen.id);},
                        child: const Text(
                          'Sign In',
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
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome,\nSet up your profile:',
                          style: mainLogoName.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                onChanged: (value) {
                                  firstName = value;
                                  checkSignUpEnabled();
                                },
                                decoration: textFieldDecoration.copyWith(
                                  hintText: 'First Name',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                onChanged: (value) {
                                  lastName = value;
                                  checkSignUpEnabled();
                                },
                                decoration: textFieldDecoration.copyWith(
                                  hintText: 'Last Name',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: emailController,
                          onChanged: (value) {
                            if (emailErrorMessage.isNotEmpty) {
                              setState(() {
                                emailErrorMessage = '';
                              });
                            }
                            email = value;
                            checkSignUpEnabled();
                          },
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'example@domain.com',
                              errorText: emailErrorMessage.isNotEmpty
                                  ? emailErrorMessage
                                  : null),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          controller: passwordController,
                          onChanged: (value) {
                            if (passwordErrorMessage.isNotEmpty) {
                              setState(() {
                                passwordErrorMessage = '';
                              });
                            }
                            password = value;
                            checkSignUpEnabled();
                          },
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Your password',
                              errorText: passwordErrorMessage.isNotEmpty
                                  ? passwordErrorMessage
                                  : null),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          obscureText: true,
                          controller: confirmedPasswordController,
                          onChanged: (value) {
                            if (value != passwordController.text) {
                              setState(() {
                                confirmedErrorMessage = '';
                              });
                            }
                            confirmPassword = value;
                            checkSignUpEnabled();
                          },
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Confirm Password',
                              errorText: confirmedErrorMessage.isNotEmpty ? confirmedErrorMessage
                                : null),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            phoneNumber = value;
                            checkSignUpEnabled();
                          },
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Phone Number'),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            Address = value;
                            checkSignUpEnabled();
                          },
                          decoration:
                              textFieldDecoration.copyWith(hintText: 'Address'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly // restricts input to digits only
                                ],
                                onChanged: (value) {
                                  int? age = int.tryParse(value);
                                  checkSignUpEnabled();
                                },
                                decoration: textFieldDecoration.copyWith(
                                  hintText: 'Age',
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  checkSignUpEnabled();
                                });
                              },
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Accept Terms and conditions',
                                style: textStyle.copyWith(
                                    fontSize: 16, color: const Color(0xFF3D8361)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //SIGN UP BUTTON
                  ElevatedButton(
                    style: buttonStyle.copyWith(
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(213, 50)),
                    ),
                    //Disable the button if any field is empty or checkbox is unchecked
                    //otherwise enable it
                    onPressed: canSignUp ? () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        Navigator.pushNamed(context, HomeScreen.id);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          passwordErrorMessage = 'The password provided is too weak.';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(emailController.text)) {
                          emailErrorMessage = 'Please enter a valid email address.';
                        } else if (e.code == 'email-already-in-use') {
                          emailErrorMessage = 'The account already exists for that email.';
                        } else if (passwordController.text != confirmedPasswordController.text) {
                          confirmedErrorMessage = 'Passwords do not match.';
                        }
                        setState(() {}); // trigger a rebuild to show the error message
                      } catch (e) {
                        emailErrorMessage = e.toString();
                        setState(() {}); // trigger a rebuild to show the error message
                      }
                    } : null,
                    child: const Text('Sign Up'),
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
