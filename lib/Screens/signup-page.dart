import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import '../design.dart';
import 'home-page.dart';
import 'login-page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String phoneNumber = '';
  bool isChecked = false;
  bool canSignUp = false;
  int? age;

  Future<void> saveUserData(String userId, String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('email', email);
  }

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
          (ageValue != null &&
              ageValue >
                  0) && // check if ageValue is not null and is greater than zero
          isChecked;
    });
  }

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
                        flex: 4,
                        child: SizedBox(
                          width: screenWidth * 0.02,
                        )),
                    Expanded(
                      flex: 2,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      flex: 3,
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
                Padding(
                  padding: EdgeInsets.only(
                      left:
                          MediaQuery.of(context).size.width > 600 ? 17.0 : 15.0,
                      right: MediaQuery.of(context).size.width > 600
                          ? 17.0
                          : 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome,\nSet up your profile:',
                        style: mainLogoName.copyWith(color: Colors.black),
                      ),
                      SizedBox(height: screenHeight * 0.03),
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
                          SizedBox(width: screenWidth * 0.010),
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
                      SizedBox(height: screenHeight * 0.03),
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
                      SizedBox(height: screenHeight * 0.03),
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
                      SizedBox(height: screenHeight * 0.03),
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
                            errorText: confirmedErrorMessage.isNotEmpty
                                ? confirmedErrorMessage
                                : null),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextField(
                        onChanged: (value) {
                          phoneNumber = value;
                          checkSignUpEnabled();
                        },
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'Phone Number'),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextField(
                        onChanged: (value) {
                          Address = value;
                          checkSignUpEnabled();
                        },
                        decoration:
                            textFieldDecoration.copyWith(hintText: 'Address'),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter
                              .digitsOnly // restricts input to digits only
                        ],
                        onChanged: (value) {
                          int? age = int.tryParse(value);
                          checkSignUpEnabled();
                        },
                        decoration: textFieldDecoration.copyWith(
                          hintText: 'Age',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
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
                  onPressed: () async {
                    try {
                      final newUser = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString('userId', newUser.user!.uid) as String;
                     await prefs.setString('email', emailController.text);
                      Navigator.pushNamed(context, HomeScreen.id);

                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        if (e.code == 'email-already-in-use') {
                          setState(() {
                            emailErrorMessage = 'This email is already in use.';
                          });
                        } else if (e.code == 'weak-password') {
                          setState(() {
                            passwordErrorMessage =
                                'Password should be at least 6 characters.';
                          });
                        }
                      }
                    }
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
