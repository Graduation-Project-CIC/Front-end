import 'package:flutter/material.dart';
import '../../design.dart';

void main() {
  runApp(const Donor1());
}

class Donor1 extends StatelessWidget {
  const Donor1({Key? key}) : super(key: key);

  static const String id = 'Donor1';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //final buttonWidth = screenWidth * 0.09;
    //final buttonHeight = screenHeight * 0.04;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    final fontSize = screenHeight / 30;
    final fontSize2 = screenHeight / 20;
    final padding = EdgeInsets.all(screenHeight * 0.03);
    final double sizedBoxHeight = screenHeight * 0.1;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/food-container1.png',
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  SizedBox(height: sizedBoxHeight),
                  Text(
                    'Use clean, sturdy containers.',
                    style: textStyle.copyWith(fontSize: fontSize),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
