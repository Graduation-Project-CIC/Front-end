// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/donationForm.dart';
import 'package:full_circle/Screens/horizontalList.dart';
import 'package:full_circle/Screens/recipient-signUp.dart';
import '../design.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'Home_Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selectedIndex = 0;
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
          MaterialPageRoute(builder: (context) => const RecipientSignUp()),
        );
        break;
      default:
        break;
    }
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
                        Text(menuItems[index], style: textStyle),
                      ],
                    ),
                  ),
                );
              },
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
                            'Hello,',
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
                                              fontSize: isPortrait ? MediaQuery.of(context)
                                                          .size.width * 0.03
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
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'See All >>',
                                  style: TextStyle(
                                    color: const Color(0xffb7b9c2),
                                    fontSize: isPortrait
                                        ? MediaQuery.of(context).size.width *
                                            0.04
                                        : MediaQuery.of(context).size.height *
                                            0.04,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const HorizontalList(),
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
                                onPressed: () {},
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
                                              fontSize: isPortrait ? MediaQuery.of(context)
                                                  .size.width * 0.03
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
                                onPressed: () {},
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home, color: Color(0xFF3D8361)),
                                        Text(
                                          ' Need Help?',
                                          style: mainLogoName.copyWith(
                                            color: Color(0xFF3D8361),
                                            fontSize: isPortrait ? MediaQuery.of(context).size.width * 0.06 : 40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Sign up your organization to receive donations.',
                                      style: textStyle.copyWith(
                                        color: Colors.black,
                                        fontSize: isPortrait
                                            ? MediaQuery.of(context).size.width * 0.03
                                            : MediaQuery.of(context).size.height * 0.03,
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
                                              ? MediaQuery.of(context).size.width * 0.03
                                              : MediaQuery.of(context).size.height * 0.03,
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
            _onMenuItemTapped,
          ),
        );
      },
    );
  }
}
