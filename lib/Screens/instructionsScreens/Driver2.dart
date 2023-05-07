import 'package:flutter/material.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';
void main() {
  runApp(const Driver2());
}
class Driver2 extends StatelessWidget {
  const Driver2 ({Key? key}) : super(key: key);
  static const String id = 'Driver2';
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
    final fontSize = screenHeight / 25;
    final fontSize2 = screenHeight / 20;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  child: SizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: const Center(
                      child: Text(
                        'Close',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MyScreen.id);
                  },
                ),
              ),
              Text(
                'Driver Instructions',
                style: TextStyle(
                  fontSize: fontSize2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'images/Directions-bro 1.png',
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                ],
              ),

              Text(
                'Before accepting a request, check the pick-up and drop-off locations.',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
