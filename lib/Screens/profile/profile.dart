import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home_page.dart';
import 'package:full_circle/Screens/profile/history.dart';
import '../../design.dart';
import '../../services/donation_service.dart';
import 'edit_info.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const String id = 'profile';

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  String? userId;
  int _selectedIndex = 4;
  String? fullName = '';

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
    retrieveUserId();
    if (userId != null) {
      DatabaseReference database = FirebaseDatabase(
          databaseURL: "https://fullcircle-b6721-default-rtdb.europe-west1.firebasedatabase.app/")
          .reference().child('userInfo')
          .child(userId!);
      DatabaseEvent event = await database.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? userData = snapshot.value as Map<dynamic,
          dynamic>?;
      if (userData != null) {
        String firstName = userData['firstName'];
        String lastName = userData['lastName'];
        setState(() {
          fullName = '$firstName $lastName';
        });
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => navBarScreens[index]));
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
                        Navigator.pushReplacementNamed(context, HomeScreen.id);
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                CircleAvatar(
                  backgroundColor: const Color(0xFF3D8361),
                  radius: 70,
                  child: Text(fullName != null && fullName!.isNotEmpty ? fullName![0] : '',
                    style: textStyle.copyWith(
                      color: Colors.white,
                      fontSize: 55,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(fullName!, style: textStyle.copyWith(fontSize: 30, color: Colors.black)),
                SizedBox(height: screenHeight * 0.1),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditInfo()),
                    );
                  },
                  style: buttonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all<Size>(const Size(300, 53))),
                  child: const Text("Edit Profile"),
                ),
                SizedBox(height: screenHeight * 0.08),
                ElevatedButton(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const History()),
                  );},
                  style: buttonStyle.copyWith(
                      minimumSize: MaterialStateProperty.all<Size>(const Size(300, 53))),
                  child: const Text("History"),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(
          _selectedIndex,
          _onItemTapped,
        ),
      ),
    );
  }
}
