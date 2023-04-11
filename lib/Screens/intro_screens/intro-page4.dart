import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'images/fullCircle-GreenBG.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height:70),
                    Text(
                      'COLLECT POINTS',
                      style: mainLogoName,
                    ),
                    Image.asset(
                      'images/collectPoints.png',
                      width: 260,
                      height: 260,
                    ),
                    Text(
                      'Every donation counts! you will earn points for every donation you make. These points can be converted into rewards like gifts and vouchers.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 120,
                left: 57,
                child: Container(
                  width: 225,
                  height: 0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF3D8361),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF3D8361).withOpacity(0.2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
