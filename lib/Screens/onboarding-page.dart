// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';
import 'package:full_circle/Screens/intro_screens/intro-page1.dart';
import 'package:full_circle/Screens/intro_screens/intro-page2.dart';
import 'package:full_circle/Screens/intro_screens/intro-page3.dart';
import 'package:full_circle/Screens/intro_screens/intro-page4.dart';
import 'package:full_circle/Screens/welcome-page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onBoarding_screen';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage == 3) {
                        Navigator.pushNamed(context, WelcomeScreen.id);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == 3 ? 'Continue' : 'Next',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.87),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: Color(0xFF3D8361),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
