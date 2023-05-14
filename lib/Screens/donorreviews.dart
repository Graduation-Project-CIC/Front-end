import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/reviews/donorreview1.dart';
import 'package:full_circle/Screens/reviews/driverriveiw1.dart';
import '../../design.dart';

class DonorReviews extends StatelessWidget {
  const  DonorReviews({Key? key}) : super(key: key);
  static const String id = ' DonorReviews';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.04;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    final fontSize = screenHeight / 30;
    final fontSize2 = screenHeight / 30;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final buttonfont = screenHeight / 50;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:sizedBoxHeight),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, HomeScreen.id);
                  },
                ),
              ],
            ),
            Text.rich(
              TextSpan(
                text: 'Your donation has been delivered \n',
                style: TextStyle(
                  fontSize: fontSize2,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children:[
                  TextSpan(
                    text: 'Thank you for donating!',
                    style: TextStyle(
                      fontSize: fontSize2,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3D8361),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/thanks 1.png',
                    width: imageWidth,
                    height: imageHeight,
                  ),
                  Text(
                    'You can help us make this experience better by taking this quick review',
                    style: textStyle.copyWith(fontSize: fontSize),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: buttonpadding,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xff3D8361), //<-- SEE HERE
                      ),
                      child:  SizedBox(
                        width: buttonWidth,
                        height: buttonHeight,
                        child: Center(
                          child: Text(
                            'Start',
                            style: TextStyle(color: Colors.white, fontSize: buttonfont),
                          ),

                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, DonorReview1.id);
                      },
                    ),
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
