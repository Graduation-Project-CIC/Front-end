import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home_page.dart';
import 'package:full_circle/Screens/instructionsScreen.dart';

import '../../design.dart';

class DoneTracking extends StatelessWidget {
  const  DoneTracking ({Key? key}) : super(key: key);
  static const String id = 'DoneTracking';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.40;
    final buttonHeight = screenHeight * 0.02;
    final buttonWidth1 = screenWidth * 0.25;
    final buttonHeight1 = screenHeight * 0.02;
    final imageWidth = screenWidth * 0.6;
    final imageHeight = screenHeight * 0.4;
    final fontSize = screenHeight /40;
    final fontSize1 = screenHeight / 25;
    final fontSize2 = screenHeight / 30;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final buttonfont = screenHeight / 60;
    final pointSize = screenHeight / 50;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height:sizedBoxHeight),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Delivery volunteer ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize1,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: 'is here!',
                    style: TextStyle(
                      color: Color(0xff3D8361),
                      fontSize: fontSize1,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Image.asset(
                      'images/unboxing 1.png',
                      width: imageWidth,
                      height: imageHeight,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xff3D8361),
                            size: pointSize,
                          ),
                        ),
                        TextSpan(
                          text: 'Help the volunteer go through their safety checklist',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xff3D8361),
                            size: pointSize,
                          ),
                        ),
                        TextSpan(
                          text: 'Please accept any returned items from the volunteer and try them again in the next donation after making sure they comply with ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyScreen.id);
                      //print('Button clicked!');
                    },
                    child: Text('our instructions',style: TextStyle(color: Color(0xff3D8361),fontSize: fontSize,),), // Change the button text here
                  ),

                  Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_circle,
                            color: Color(0xff3D8361),
                            size: pointSize,
                          ),
                        ),
                        TextSpan(
                          text: 'Confirm the pickup after you’re done',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),

                  // Padding(
                  //   padding: buttonpadding,
                  //   child:
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:[
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          // child: SizedBox(
                          //   width: buttonWidth1,
                          //   height: buttonHeight1,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: pointSize,
                                  ),
                                  Text(
                                    'Cancel Request',
                                    style: TextStyle(color: Colors.white, fontSize: buttonfont),
                                  ),
                                ],
                              ),
                            ),
                          //),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Are you sure you want to cancel your delivery?'),
                                  content: Text('Try to resolve safety issues with donor'),
                                  actions: [
                                    TextButton(
                                      child:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: pointSize,
                                          ),
                                          Text('Cancel Request',
                                            style: TextStyle(color: Colors.red, fontSize: buttonfont),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, HomeScreen.id);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),


                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xff3D8361),
                          ),
                          // child: SizedBox(
                          //   width: buttonWidth,
                          //   height: buttonHeight,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: pointSize,
                                  ),
                                  Text(
                                    'Packages were picked up',
                                    style: TextStyle(color: Colors.white, fontSize: buttonfont),
                                  ),],),),
                          //),
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                        ),
                      ],
                    ),),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}