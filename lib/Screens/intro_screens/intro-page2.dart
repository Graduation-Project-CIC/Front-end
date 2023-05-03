import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

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
                          'DELIVER',
                          style: mainLogoName,
                        ),
                        Image.asset(
                          'images/deliver.png',
                          width: screenWidth * 0.6,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: Text(
                            'Be the connection between food donors and people by delivering surplus food to local charities and organizations.',
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
