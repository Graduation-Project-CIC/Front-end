import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import '../design.dart';
import '../services/user_service.dart';
import 'home-page.dart';
import 'login-page.dart';
import 'package:firebase_database/firebase_database.dart';

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
  String address = '';
  String phoneNumber = '';
  bool isChecked = false;
  bool canSignUp = false;
  int? age;

  @override
  void initState() {
    super.initState();
  }

  Future<void> registerUser() async {
    try {
      UserCredential? userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        String userId = userCredential.user!.uid;
        DatabaseReference database = FirebaseDatabase(databaseURL: "https://fullcircle-b6721-default-rtdb.europe-west1.firebasedatabase.app/").reference().child('userInfo').child(userId);

        UserInformation userInformation = UserInformation(
          firstName,
          lastName,
          email,
          address,
          phoneNumber,
          age,
        );

        await database.set(userInformation.toJson());

        Navigator.pushNamed(context, HomeScreen.id);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          emailErrorMessage = 'This email is already in use.';
        });
      } else if (e.code == 'weak-password') {
        setState(() {
          passwordErrorMessage = 'Password should be at least 6 characters.';
        });
      } else {
        // Handle other FirebaseAuthException errors
        print('FirebaseAuthException: ${e.code}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
  }


  void checkSignUpEnabled() {
    setState(() {
      int? ageValue = int.tryParse(ageController.text);

      canSignUp = firstName.isNotEmpty &&
          lastName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          confirmPassword.isNotEmpty &&
          address.isNotEmpty &&
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
                          address = value;
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
                          FilteringTextInputFormatter.digitsOnly // restricts input to digits only
                        ],
                        onChanged: (value) {
                          age = int.tryParse(value); // Assign the value to the instance variable age
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
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(213, 50),
                  ),
                  onPressed: canSignUp
                      ? () async {
                    await registerUser();} : null,
                 child: const Text('Sign Up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
