// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/donationForm.dart';
import 'package:full_circle/Screens/recipient-signUp.dart';
import '../design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'Home_Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onMenuItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DonationForm()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipientSignUp()),
        );
        break;
      default:
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  _onMenuItemTapped(index);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
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
                      Text(menuItems[index], style: textStyle),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello,',
                        style: textStyle.copyWith(color: const Color(0xFFA5A4A4),fontSize: 32),
                    ),
                  ),
                  Container(
                    width: 397,
                    height: 233,
                    decoration: homeMainButton,
                    child: MaterialButton(
                      onPressed: () {},
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                'Make A Difference',
                                style: mainLogoName.copyWith(
                                  color: Colors.white,fontSize: 25
                                ),
                              ),
                                Text('Start donating >',style: textStyle.copyWith(color: Colors.white, fontSize: 15)),
                            ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Want to volunteer?',
                      style: mainLogoName.copyWith(color: const Color(0xFFA5A4A4),fontSize: 32),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'View donors requests',
                        style: TextStyle(
                            color: Color(0xffb7b9c2),fontSize: 15),),
                      TextButton(onPressed: (){}, child: Text('See All >>',style: TextStyle(color: Color(0xffb7b9c2),fontSize: 15))),
                    ],
                  ),
                ],
              ),
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
