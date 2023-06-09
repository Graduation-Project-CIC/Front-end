// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/Tracking%20Screens/matching.dart';
import 'package:full_circle/Screens/home_page.dart';
import 'package:full_circle/design.dart';

import '../donation_form.dart';

class RecipientMatching extends StatefulWidget {
  const RecipientMatching({Key? key}) : super(key: key);
  static const String id = 'RecipientMatching';

  @override
  _RecipientMatchingState createState() => _RecipientMatchingState();
}

class _RecipientMatchingState extends State<RecipientMatching> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE5FFE5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  },
                )
              ],
            ),
            Text(
              'We found you’re candidate. \n Waiting for volunteer driver',
              style: mainLogoName.copyWith(color: Colors.black, fontSize: 28),
              textAlign: TextAlign.center,
            ),
            Image.asset('images/matchingCar.png'),
            Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('images/organization.png'),
                      Column(
                        children: [
                          Text(
                            'Organization name',
                            style: mainLogoName.copyWith(color: Colors.black),
                          ),
                          const Text('Organization bio ',
                              style: textStyle, textAlign: TextAlign.left),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: screenWidth * 0.05, height: screenHeight * 0.025,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3D8361),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: const Text('1',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white))),
                      Container(
                        width: screenWidth * 0.45, height: screenHeight *0.025,
                          decoration: BoxDecoration(
                            color: const Color(0xFF3D8361),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: const Text('Finding driver',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white))),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, HomeScreen.id);
                          },
                          child: Text('Back to home',
                              style: textStyle.copyWith(fontSize: 12)))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
