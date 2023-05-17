import 'package:flutter/material.dart';
import 'package:full_circle/Screens/home-page.dart';
import 'package:full_circle/Screens/reviews/donorreview1.dart';
import '../../design.dart';

class SafetyCheck2 extends StatelessWidget {
  const  SafetyCheck2 ({Key? key}) : super(key: key);
  static const String id = 'SafetyCheck2';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.52;
    final buttonHeight = screenHeight * 0.02;
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
            Text(
              'Donation Safety Checklist',
              style: TextStyle(fontSize: fontSize1,fontWeight: FontWeight.bold),
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
                          text: 'Re-package all broken packages',
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
                          text: 'Return any spoiled food',
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
                          text: 'Return any expired item',
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
                          text: 'Return any package that is not safe for transportation',
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
                          text: 'Add expiry dates on cooked meals',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: fontSize,
                          ),
                        ),
                      ],
                    ),
                  ),SizedBox(
                    height: sizedBoxHeight,
                  ),

                  // Padding(
                  //   padding: buttonpadding,
                  //   child:
                  Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
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
                            ),
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



                          // SizedBox(
                          //   height: sizedBoxHeight,
                          // ),


                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color(0xff3D8361),
                            ),
                            child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
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
                                      'Packages are now safe!',
                                      style: TextStyle(color: Colors.white, fontSize: buttonfont),
                                    ),],),),
                            ),
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
