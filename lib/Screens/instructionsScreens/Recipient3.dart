import 'package:flutter/material.dart';
import '../../design.dart';
void main() {
  runApp(const Recipient3());
}
class Recipient3 extends StatelessWidget {
  const Recipient3 ({Key? key}) : super(key: key);
  static const String id = 'Recipient3';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    //final buttonWidth = screenWidth * 0.09;
    //final buttonHeight = screenHeight * 0.04;
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
                'Recipient Instructions',
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
                      'images/cuate.png',
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                ],
              ),

              Text(
                'It’s preferable to write a review about your experience after every food receiving.',
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
