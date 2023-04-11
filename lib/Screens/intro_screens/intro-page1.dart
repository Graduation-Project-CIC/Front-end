import 'package:flutter/material.dart';
import 'package:full_circle/design.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

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
                      'DONATE',
                      style: mainLogoName,
                    ),
                    Image.asset(
                      'images/donate.png',
                      width: 260,
                      height: 260,
                    ),
                    Text(
                      'Full Circle will help you to easily donate your surplus food to those who need it most. Our app connects you with local charities and organizations that are working tirelessly to feed people in need.',
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