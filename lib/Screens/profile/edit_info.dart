import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/profile/profile.dart';
import 'package:namefully/namefully.dart';
import '../../design.dart';

class EditInfo extends StatefulWidget {
  const EditInfo({Key? key}) : super(key: key);
  @override
  EditInfoState createState() => EditInfoState();
}

class EditInfoState extends State<EditInfo> {
  TextEditingController? emailController;
  User? user = FirebaseAuth.instance.currentUser;
  String? userId;
  final ageController = TextEditingController();
  String emailErrorMessage = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String phoneNumber = '';
  bool isChecked = false;
  int? age;

  void retrieveUserId() {
    if (user != null) {
      if (user!.providerData.isNotEmpty && user?.providerData[0].providerId == 'google.com') {
        // User signed up with Google
        userId = user?.providerData[0].uid;
      } else {
        // User signed up with email/password or other providers
        userId = user?.uid;
      }
    } else {
      // No user signed in
      userId = null;
    }

    if (userId != null) {
      print('User ID: $userId');
    } else {
      print('User ID not found.');
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveUserData();
  }

  void retrieveUserData() async {
    retrieveUserId(); // Call retrieveUserId method here

    if (userId != null) {
      DatabaseReference database = FirebaseDatabase(databaseURL: "https://fullcircle-b6721-default-rtdb.europe-west1.firebasedatabase.app/").reference().child('userInfo').child(userId!);
      DatabaseEvent event = await database.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        firstName = userData['firstName'];
        lastName = userData['lastName'];
        address = userData['address'];
        email = userData['email'];
        phoneNumber = userData['phoneNumber'];
        age = userData['age'];
      }
      emailController = TextEditingController(text: email);
    }
  }

  void updateUserInformation() async{
    retrieveUserId();
    if (userId != null) {
      DatabaseReference database = FirebaseDatabase(
          databaseURL: "https://fullcircle-b6721-default-rtdb.europe-west1.firebasedatabase.app/")
          .reference().child('userInfo')
          .child(userId!);
      await database.update({
        'firstName': firstName,
        'lastName': lastName,
        //'email': emailController,
        'phoneNumber': phoneNumber,
        'address': address,
        'age': age,
      }).then((_) {}).catchError((error) {
        print('Failed to update fields: $error');
      });
    }
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Profile.id);
                      },
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
                        'Edit your information',
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
                              },
                              decoration: textFieldDecoration.copyWith(
                                hintText: 'firstName',
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.010),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              onChanged: (value) {
                                lastName = value;
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
                        controller:emailController,
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'email address' ,
                            errorText: emailErrorMessage.isNotEmpty
                                ? emailErrorMessage
                                : null),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      TextField(
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                        decoration: textFieldDecoration.copyWith(
                            hintText: 'Phone Number'),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextField(
                        onChanged: (value) {
                          address = value;
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
                        },
                        decoration: textFieldDecoration.copyWith(
                          hintText: 'Age',
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(213, 50),
                    ),
                    onPressed: () {
                     updateUserInformation();
                   //  print(emailController);
                   //  print(firstName);
                      },
                    child: const Text('Add')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
