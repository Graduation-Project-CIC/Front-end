import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.09,
                  horizontal: screenWidth * 0.1,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'images/fullCircle-GreenBG.png',
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.1,
                        ),
                        const Text(
                          'DONATE',
                          style: mainLogoName,
                        ),
                      ],
                    ),
                    Image.asset(
                      'images/donate.png',
                      width: screenWidth * 0.7,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: screenWidth * 0.8,
                      child: Text(
                        'Full Circle will help you to easily donate your surplus food to those who need it most. Our app connects you with local charities and organizations that are working tirelessly to feed people in need.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}