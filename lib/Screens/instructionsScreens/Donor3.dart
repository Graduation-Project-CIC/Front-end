import 'package:flutter/material.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';

import '../../design.dart';
//import 'lib/Screens/instructionsScreen.dart';
void main() {
  runApp(const Donor3());
}
class Donor3 extends StatelessWidget {
  const Donor3 ({Key? key}) : super(key: key);
  static const String id = 'Donor3';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.09;
    final buttonHeight = screenHeight * 0.04;
    //final buttonWidth = screenWidth * 0.6;
    //final buttonHeight = screenHeight * 0.05;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    final fontSize = screenHeight / 30;
    final fontSize2 = screenHeight / 20;
    final padding = EdgeInsets.all(screenHeight * 0.03);
    final double sizedBoxHeight = screenHeight * 0.1;
    return Scaffold(
      body: Padding(
        padding: padding,
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Donor Instructions',
                style: TextStyle(
                  fontSize: fontSize2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: sizedBoxHeight),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'images/image 5.png',
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                ],
              ),

              Text(
                'Package the food in appropriate quantities for the recipient.',
                style: textStyle.copyWith(fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
