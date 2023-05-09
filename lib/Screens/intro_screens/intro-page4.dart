import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

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
                          'COLLECT POINTS',
                          style: mainLogoName,
                        ),
                        Image.asset(
                          'images/collectPoints.png',
                          width: screenWidth * 0.8,
                        ),
                        SizedBox(
                          width: screenWidth * 0.9,
                          child: Text(
                            'Every donation counts! You will earn points for every donation you make. These points can be converted into rewards like gifts and vouchers.',
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