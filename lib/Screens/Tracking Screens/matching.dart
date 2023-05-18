// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/Tracking%20Screens/recipientMatch.dart';
import 'package:full_circle/design.dart';
import '../donationForm.dart';

class Matching extends StatefulWidget {
  const Matching({Key? key}) : super(key: key);
  static const String id = 'Matching';

  @override
  _MatchingState createState() => _MatchingState();
}

class _MatchingState extends State<Matching> {
  double _puzzle1PositionX = 20;
  double _puzzle2PositionX = 20;
  bool _isPuzzle1Reversed = false;
  bool _isPuzzle2Reversed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _puzzle1PositionX = 70;
        _puzzle2PositionX = 70;
        animationRepeating();
      });
    });
  }

  void animationRepeating() {
    for (int i = 0; i < 5; i++) {
      Future.delayed(Duration(seconds: 5 * i), () {
        setState(() {
          _isPuzzle1Reversed = false;
          _isPuzzle2Reversed = false;
        });
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            _puzzle1PositionX = 70;
            _puzzle2PositionX = 70;
          });
          if (i == 4) {
            Navigator.pushReplacementNamed(context, RecipientMatching.id);
          }
        });
      });
    }
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
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, DonationForm.id);
                  },
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              'We’re finding the perfect candidate for your donation',
              style: mainLogoName.copyWith(color: Colors.black, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.13),
            Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    left: _isPuzzle1Reversed ? 20 : _puzzle1PositionX,
                    onEnd: () {
                      if (_puzzle1PositionX >= 70 && !_isPuzzle1Reversed) {
                        setState(() {
                          _isPuzzle1Reversed = true;
                        });
                      }
                    },
                    child: Container(
                      height: screenHeight * 0.18,
                      child: Image.asset(
                        'images/Puzzle1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    right: _isPuzzle2Reversed ? 20 : _puzzle2PositionX,
                    onEnd: () {
                      if (_puzzle2PositionX >= 70 && !_isPuzzle2Reversed) {
                        setState(() {
                          _isPuzzle2Reversed = true;
                        });
                      }
                    },
                    child: Container(
                      height: screenHeight * 0.186,
                      child: Image.asset(
                        'images/Puzzle2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.12,
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
              child: Row(
                children: [
                  SizedBox(width: screenWidth * 0.2),
                  Container(
                      width: screenWidth * 0.45,
                      height: screenHeight * 0.025,
                      decoration: BoxDecoration(
                        color: Color(0xFF3D8361),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Text('Finding destination',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white))),
                  SizedBox(width: screenWidth * 0.1),
                  Container(
                      width: screenWidth * 0.05,
                      height: screenHeight * 0.025,
                      decoration: BoxDecoration(
                        color: Color(0xFF3D8361),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Text('2',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white)))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
