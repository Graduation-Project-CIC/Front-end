import 'package:flutter/material.dart';
import 'package:full_circle/Screens/intro_screens/intro-page1.dart';
import 'package:full_circle/Screens/intro_screens/intro-page2.dart';
import 'package:full_circle/Screens/intro_screens/intro-page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onBoarding_screen';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[
          PageView(
            controller: _controller,
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
          ),

          Container(
            alignment: Alignment(0,0.75),
            child: SmoothPageIndicator(controller: _controller,count: 3),
          ),
        ],

        ),
      );

  }
  }