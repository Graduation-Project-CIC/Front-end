
import 'package:flutter/material.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipient1.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipient2.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipient3.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Recipientsinstructions extends StatefulWidget {
  const Recipientsinstructions({Key? key}) : super(key: key);
  static const String id = 'Recipientsinstructions';

  @override
  _Recipientsinstructions createState() => _Recipientsinstructions();
}

class _Recipientsinstructions extends State<Recipientsinstructions> {
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
              Recipient1(),
              Recipient2(),
              Recipient3(),
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
                      if (_currentPage == 3) {
                        Navigator.pushNamed(context, HomeScreen.id);
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
              count: 3,
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
