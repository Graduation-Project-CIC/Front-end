import 'package:flutter/material.dart';
import 'package:full_circle/Screens/instructionsScreens/Donors.dart';
import 'package:full_circle/Screens/instructionsScreens/Drivers.dart';
import 'package:full_circle/Screens/instructionsScreens/Recipients.dart';
import 'home-page.dart';
void main() {
  runApp(const MyScreen());
}
class MyScreen extends StatelessWidget {
  const MyScreen ({Key? key}) : super(key: key);
  static const String id = 'MyScreen';
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.6;
    final buttonHeight = screenHeight * 0.05;
    final iconWidth = screenWidth * 0.08;
    final iconHeight = screenHeight * 0.105;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: iconWidth,
              height: iconHeight,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, HomeScreen.id);
                },
              ),
            ),

            const Text(
              'Instructions',
              style: TextStyle(color: Colors.green, fontSize: 32),
            ),
             const Text(
              'Let us help you in using Full Circle.',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 24),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'images/inst1.png',
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green, //<-- SEE HERE
                    ),
                    child:  SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: const Center(
                        child: Text(
                          'Donor instructions',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, DonorsInstructions.id);
                    },
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green, //<-- SEE HERE
                    ),
                    child:  SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                    child: const Center(
                      child: Text(
                          'Driver instructions',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),

                    ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, DriversInstructions.id);
                    },
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.green, //<-- SEE HERE
                    ),
                    child:  SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: const Center(
                        child:  Text(
                            'Recipient instructions',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                       ),
                      ),
                    ),
                    onPressed: () {
                       Navigator.pushNamed(context, Recipientsinstructions.id);
                    },
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
