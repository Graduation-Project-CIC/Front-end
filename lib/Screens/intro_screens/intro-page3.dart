import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.09,
                horizontal: screenWidth * 0.1,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/fullCircle-GreenBG.png',
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.1,
                        ),
                        const Text(
                          'MARK HOMELESS',
                          style: mainLogoName,
                        ),
                        Image.asset(
                          'images/markHomeless.png',
                          width: screenWidth * 0.5,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: Text(
                            'You can easily drop a pin on a map to indicate a location where a homeless person is in need.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}