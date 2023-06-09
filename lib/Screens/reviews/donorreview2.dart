import 'package:flutter/material.dart';
import 'package:full_circle/Screens/donorreviews.dart';
import 'package:full_circle/Screens/home_page.dart';


class DonorReview2 extends StatefulWidget {
  const DonorReview2({Key? key}) : super(key: key);

  static const String id = 'DonorReview2';

  @override
  _DonorReview2 createState() => _DonorReview2();
}

class _DonorReview2 extends State<DonorReview2> {

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    final fontSize2 = screenHeight / 30;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizedBoxHeight),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.id);
                },
              ),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/star (1) 1.png',
                      width: imageWidth,
                      height: imageHeight,
                    ),
                    Text(
                      'Thank you for you feedback',
                      style: TextStyle(fontSize: fontSize2,fontWeight: FontWeight.bold,),

                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
