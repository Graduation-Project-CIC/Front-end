import 'package:flutter/material.dart';
import 'package:full_circle/Screens/instructionsScreens/Driver1.dart';
import 'package:full_circle/Screens/instructionsScreens/Driver2.dart';
import 'package:full_circle/Screens/instructionsScreens/Driver3.dart';
import 'package:full_circle/Screens/instructionsScreens/Driver4.dart';
import 'package:full_circle/Screens/instructionsScreens/Driver5.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DriversInstructions extends StatefulWidget {
  const DriversInstructions ({Key? key}) : super(key: key);
  static const String id = 'DriversInstructions';

  @override
  _DriversInstructions createState() => _DriversInstructions();
}

class _DriversInstructions extends State<DriversInstructions> {
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
              Driver1(),
              Driver2(),
              Driver3(),
              Driver4(),
              Driver5(),
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
                      Navigator.pushNamed(context, MyScreen.id);
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
                      if (_currentPage == 4) {
                        Navigator.pushNamed(context, HomeScreen.id);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == 4 ? 'Continue' : 'Next',
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
              count: 5,
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
