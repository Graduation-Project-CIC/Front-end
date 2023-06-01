import 'package:flutter/material.dart';
import 'package:full_circle/Screens/donorreviews.dart';
import 'package:full_circle/Screens/home_page.dart';
import 'package:full_circle/Screens/reviews/donorreview2.dart';
import 'package:full_circle/design.dart';

class DonorReview1 extends StatefulWidget {
  const DonorReview1({Key? key}) : super(key: key);

  static const String id = 'DonorReview1';

  @override
  _DonorReview1 createState() => _DonorReview1();
}

class _DonorReview1 extends State<DonorReview1> {
  String _additionalNotes = '';
  bool _safetyCheck  = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.2;
    final buttonHeight = screenHeight * 0.04;
    final fontSize2 = screenHeight / 40;
    final padding = EdgeInsets.all(screenHeight * 0.01);
    final buttonpadding = EdgeInsets.all(screenHeight * 0.05);
    final double sizedBoxHeight = screenHeight * 0.1;
    final double sizedBoxHeight1 = screenHeight * 0.04;
    final buttonfont = screenHeight / 50;

    return Scaffold(
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: sizedBoxHeight),
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, DonorReviews.id);
                  },
                ),
                Text(
                  'Did the driver safety check your packages?',
                  style: TextStyle(fontSize: fontSize2),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style:buttonStyle,
                        onPressed: () {
                          setState(() {
                            _safetyCheck = true;
                          });
                        },
                        child: Text('Yes'),
                      ),
                      ElevatedButton(
                        style: buttonStyle.copyWith(backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {
                          setState(() {
                            _safetyCheck = false;
                          });
                        },
                        child: Text('No'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: sizedBoxHeight1),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Additional Notes',
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff3D8361),
                      ),
                    ),
                    hintStyle: TextStyle(fontSize: fontSize2),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _additionalNotes = value;
                    });
                  },
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: buttonpadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                              child: SizedBox(
                                width: buttonWidth,
                                height: buttonHeight,
                                child: Center(
                                  child: Text(
                                    'Skip',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: buttonfont),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, HomeScreen.id);
                              },
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: const Color(0xff3D8361),
                              ),
                              child: SizedBox(
                                width: buttonWidth,
                                height: buttonHeight,
                                child: Center(
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: buttonfont),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, DonorReview2.id);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
