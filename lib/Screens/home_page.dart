import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/Tracking%20Screens/tracking_map.dart';
import 'package:full_circle/Screens/donation_form.dart';
import 'package:full_circle/Screens/get_started.dart';
import 'package:full_circle/Screens/homeless_map.dart';
import 'package:full_circle/Screens/recipient-signUp.dart';
import 'package:full_circle/components/donations_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'Home_Screen';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  String? userId;
  String? name = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void retrieveUserId() {
    if (user != null) {
      if (user!.providerData.isNotEmpty &&
          user?.providerData[0].providerId == 'google.com') {
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

  void retrieveUserName() async {
    retrieveUserId();
    if (userId != null) {
      DatabaseReference database = FirebaseDatabase(
              databaseURL:
                  "https://fullcircle-b6721-default-rtdb.europe-west1.firebasedatabase.app/")
          .reference()
          .child('userInfo')
          .child(userId!);
      DatabaseEvent event = await database.once();
      DataSnapshot snapshot = event.snapshot;
      Map<dynamic, dynamic>? userData =
          snapshot.value as Map<dynamic, dynamic>?;
      if (userData != null) {
        String firstName = userData['firstName'];
        setState(() {
          name = firstName;
        });
      }
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => navBarScreens[index]),
    );
  }

  @override
  void initState() {
    super.initState();
    retrieveUserName();
  }

  void _onMenuTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => drawerScreens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        bool isPortrait = orientation == Orientation.portrait;
        double navBarHeight = isPortrait ? kBottomNavigationBarHeight : 0;
        return Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: drawerMenuItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        _onMenuTapped(index);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04,
                          vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8.0,
                              height: 8.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Text(drawerMenuItems[index], style: textStyle),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.remove('userId');
                      Navigator.pushNamed(context, GetStarted.id);
                    } catch (error) {
                      if (kDebugMode) {
                        print(
                            'Error removing user ID from SharedPreferences: $error');
                      }
                    }
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text('Sign Out', style: textStyle),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackingMap()),
                    );
                  },
                  title: const Text('Tracking', style: textStyle),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: constraints.maxWidth,
                      minHeight: constraints.maxHeight - navBarHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                            ],
                          ),
                          Text(
                            'Hello $name,',
                            style: textStyle.copyWith(
                              color: const Color(0xFFA5A4A4),
                              fontSize: isPortrait
                                  ? MediaQuery.of(context).size.width * 0.08
                                  : 30,
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: isPortrait
                                ? MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 4)
                                : 1,
                            child: Container(
                              decoration: homeMainButton,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DonationForm()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        'images/mainHomeButtonPhoto.png',
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Make A Difference',
                                            style: mainLogoName.copyWith(
                                              color: Colors.white,
                                              fontSize: isPortrait
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06
                                                  : 40,
                                            ),
                                          ),
                                          Text(
                                            'Start donating >>',
                                            style: textStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: isPortrait
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: isPortrait
                                  ? MediaQuery.of(context).size.width * 0.1
                                  : MediaQuery.of(context).size.height * 0.1),
                          Text(
                            'Want to volunteer?',
                            style: mainLogoName.copyWith(
                              color: const Color(0xFFA5A4A4),
                              fontSize: isPortrait
                                  ? MediaQuery.of(context).size.width * 0.06
                                  : 40,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'View donors requests',
                                style: TextStyle(
                                  color: const Color(0xffb7b9c2),
                                  fontSize: isPortrait
                                      ? MediaQuery.of(context).size.width * 0.04
                                      : MediaQuery.of(context).size.height *
                                          0.04,
                                ),
                              ),
                            ],
                          ),
                          const DonationsList(),
                          SizedBox(
                              height: isPortrait
                                  ? MediaQuery.of(context).size.width * 0.1
                                  : MediaQuery.of(context).size.height * 0.1),
                          AspectRatio(
                            aspectRatio: isPortrait
                                ? MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 4)
                                : 1,
                            child: Container(
                              decoration: homeMainButton,
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, HomelessMap.id);
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Help the homeless',
                                            style: mainLogoName.copyWith(
                                              color: Colors.white,
                                              fontSize: isPortrait
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.06
                                                  : 40,
                                            ),
                                          ),
                                          Text(
                                            'Help in finding homeless by marking their location on map',
                                            style: textStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: isPortrait
                                                  ? MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03
                                                  : MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Image.asset(
                                        'images/homelessImg.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height: isPortrait
                                  ? MediaQuery.of(context).size.width * 0.1
                                  : MediaQuery.of(context).size.height * 0.1),
                          AspectRatio(
                            aspectRatio: isPortrait
                                ? MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 6)
                                : 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color((0xFFF0EAEA)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    offset: const Offset(0, 4),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, RecipientSignUp.id);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.home,
                                            color: Color(0xFF3D8361)),
                                        Text(
                                          ' Need Help?',
                                          style: mainLogoName.copyWith(
                                            color: const Color(0xFF3D8361),
                                            fontSize: isPortrait
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.06
                                                : 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Sign up your organization to receive donations.',
                                      style: textStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: isPortrait
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Sign Up Here >>',
                                        textAlign: TextAlign.right,
                                        style: textStyle.copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isPortrait
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03
                                              : MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar: NavBar(
            _selectedIndex,
            _onItemTapped,
          ),
        );
      },
    );
  }
}
